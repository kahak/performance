#private_ip = my_private_ip()
#public_ip = my_public_ip()

script 'run_experiment' do
  cwd "/tmp"
   user node['performance']['user']
  group node['performance']['group']
  interpreter "bash"
  code <<-EOM
/srv/hadoop/bin/hdfs dfs -rm -r -f /counts

cd /usr/local/flink

./bin/flink run -p 2 -j ./examples/flink-java-examples-0.9.1-WordCount.jar hdfs:///words/ hdfs://#{node.hadoop.nn.public_ips[0]}:29211/counts
  EOM
end

