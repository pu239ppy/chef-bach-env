
node[:bcpc][:hadoop][:mounts].each do |i|

  directory "/disk/#{i}/yarn/local" do
    owner "yarn"
    group "yarn"
    mode 0755
    action :create
    recursive true
  end

  directory "/disk/#{i}/yarn/logs" do
    owner "yarn"
    group "yarn"
    mode 0755
    action :create
    recursive true
  end

end


%w{hadoop-yarn-resourcemanager hadoop-client}.each do |pkg|
  package pkg do
    action :upgrade
  end
end

service "hadoop-yarn-resourcemanager" do
  action [:enable, :restart]
end


