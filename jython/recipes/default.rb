

remote_file "#{Chef::Config[:file_cache_path]}/jython-standalone-2.7-b1.jar" do
  source "http://search.maven.org/remotecontent?filepath=org/python/jython-installer/2.7-b1/jython-installer-2.7-b1.jar"
  action :create_if_missing
end

bash "install_jython" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    java -jar jython-installer-2.7-b1.jar
  EOH
  creates "/usr/local/bin/jython"
end