
script 'run_experiment' do
  cwd "/tmp"
  user node['performance']['user']
  group node['performance']['group']
  interpreter "bash"
  code <<-EOM
/srv/hadoop/bin/hdfs dfs -rm -r -f /counts

cd /usr/local/flink

./bin/flink run -p #{node.numworkers} -j ./examples/flink-java-examples-0.9.1-WordCount.jar hdfs:///words/ hdfs://#{node.hadoop.nn.public_ips[0]}:29211/counts
  EOM
end

