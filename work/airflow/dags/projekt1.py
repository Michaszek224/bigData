from datetime import datetime
from airflow import DAG
from airflow.sdk import Param  
from airflow.providers.standard.operators.bash import BashOperator  
from airflow.providers.standard.operators.python import BranchPythonOperator  

with DAG(
    dag_id="project1-workflow",
    start_date=datetime(2015, 12, 1),
    schedule=None,
    params={
        "dags_home": Param(
            "/home/hadoop/airflow/dags", type="string"
        ),
        #"input_dir": Param(
        #    "input", type="string"
        #),
        #"output_mr_dir": Param("project1/output_mr3", type="string"),
        #"output_dir": Param("project1/output6", type="string"),
        "datasource1_path": Param(
            "/datasource1", type="string", 
            description="Ścieżka do datasource1 (wejście MapReduce)"
        ),
        "datasource3_path": Param(
            "/datasource3", type="string",
            description="Ścieżka do datasource3 (wyjście MapReduce)"
        ),
        "datasource4_path": Param(
            "/datasource4", type="string",
            description="Ścieżka do datasource4 (wejście Hive)"
        ),
        "datasource6_path": Param(
            "/datasource6", type="string",
            description="Ścieżka do datasource6 (wyjście Hive)"
        ),
        "classic_or_streaming": Param(
            "streaming", enum=["classic", "streaming"]
        ),
    },
    render_template_as_native_obj=True,
    catchup=False,  
) as dag:

#    # Usuwanie katalogów z HDFS jeśli istnieją
 #   clean_output_mr_dir = BashOperator(
  #      task_id="clean_output_mr_dir",
   #     bash_command=(
    #        "if hadoop fs -test -d {{ params.output_mr_dir }}; "
     #       "then hadoop fs -rm -f -r {{ params.output_mr_dir }}; fi"
      #  ),
    #)

    #clean_output_dir = BashOperator(
     #   task_id="clean_output_dir",
      #  bash_command=(
       #     "if hadoop fs -test -d {{ params.output_dir }}; "
        #    "then hadoop fs -rm -f -r {{ params.output_dir }}; fi"
        #),
    #)
    # Usuwanie katalogów z HDFS jeśli istnieją
    clean_output_mr_dir = BashOperator(
        task_id="clean_output_mr_dir",
        bash_command=(
            "if hadoop fs -test -d {{ params.datasource3_path }}; "
            "then hadoop fs -rm -f -r {{ params.datasource3_path }}; fi"
        ),
    )

    clean_output_dir = BashOperator(
        task_id="clean_output_dir",
        bash_command=(
            "if hadoop fs -test -d {{ params.datasource6_path }}; "
            "then hadoop fs -rm -f -r {{ params.datasource6_path }}; fi"
        ),
    )
    # Wybór trybu wykonania: klasyczny MR lub streaming
    def _pick_classic_or_streaming(params):
        if params["classic_or_streaming"] == "classic":
            return "mapreduce_classic"
        else:
            return "hadoop_streaming"

    pick_classic_or_streaming = BranchPythonOperator(
        task_id="pick_classic_or_streaming",
        python_callable=_pick_classic_or_streaming,
        op_kwargs={"params": dag.params},
    )

    # MapReduce klasyczny
    mapreduce_classic = BashOperator(
        task_id="mapreduce_classic",
        bash_command=(
            "hadoop jar {{ params.dags_home }}/project_files/ . . . "
        ),
    )
    hadoop_streaming = BashOperator(
        task_id="hadoop_streaming",
        bash_command=(
            "hdfs dfs -rm -r -f {{ params.datasource3_path }} && "
            "hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming*.jar "
            "-input {{ params.datasource1_path }} "
            "-output {{ params.datasource3_path }} "
            "-mapper /home/hadoop/airflow/dags/project_files/mapper.py "
            "-combiner /home/hadoop/airflow/dags/project_files/combiner.py "
            "-reducer /home/hadoop/airflow/dags/project_files/reducer.py "
            "-file /home/hadoop/airflow/dags/project_files/mapper.py "
            "-file /home/hadoop/airflow/dags/project_files/combiner.py "
            "-file /home/hadoop/airflow/dags/project_files/reducer.py"
        ),
    )
    # MapReduce streaming
    #hadoop_streaming = BashOperator(
     #   task_id="hadoop_streaming",
      #  bash_command=(
    #        "mapred streaming "
    #        "-files {{ params.dags_home }}/project_files/ . . ."
   #     ),
    #)
    hive = BashOperator(
        task_id="hive",
        bash_command=(
            "hdfs dfs -test -d {{ params.datasource3_path }} && "
            "hdfs dfs -test -d {{ params.datasource4_path }} && "
            "hdfs dfs -rm -r -f {{ params.datasource6_path }} 2>/dev/null || true && "
            "beeline "
            "-u jdbc:hive2://localhost:10000/default "
            "-n hadoop "
            "--hiveconf input_dir3={{ params.datasource3_path }} "
            "--hiveconf input_dir4={{ params.datasource4_path }} "
            "--hiveconf output_dir6={{ params.datasource6_path }} "
            "-f {{ params.dags_home }}/project_files/hive.hql"
        ),
        trigger_rule="none_failed",
    )
    # Program Hive
    #hive = BashOperator(
     #   task_id="hive",
      #  bash_command=(
       #     "beeline -u jdbc:hive2://localhost:10000/default "
        #    ". . ."
        #),
        #trigger_rule="none_failed",
    #)

    get_output = BashOperator(
        task_id="get_output",
        bash_command=(
            "hadoop fs -getmerge {{ params.datasource6_path }} output6.json && head output6.json"
        ),
        trigger_rule="none_failed",
    )
    # Pobranie wyników
   # get_output = BashOperator(
    #    task_id="get_output",
     #   bash_command=(
      #      "hadoop fs -getmerge {{ params.output_dir }} output6.json && head output6.json"
       # ),
        #trigger_rule="none_failed",
    #)

    # Zależności
    [clean_output_mr_dir, clean_output_dir] >> pick_classic_or_streaming
    pick_classic_or_streaming >> [mapreduce_classic, hadoop_streaming]
    [mapreduce_classic, hadoop_streaming] >> hive
    hive >> get_output
