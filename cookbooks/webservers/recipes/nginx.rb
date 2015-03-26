package 'nginx' do
  action :install
end

service 'nginx' do
  supports :restart => true, :start => true, :stop => true, :reload => true
end

# Create the /srv/mywebsite directory
directory '/srv/mywebsite/' do
  action :create
end

directory '/srv/mywebsite/data' do
  action :create
end

# Create a basic landing page
file '/srv/mywebsite/index.html' do
    owner 'root'
    group 'root'
    mode   0644
    action :create
    content "<!DOCTYPE html>
             <html>
               <head></head>
               <body>
                 <h1>Welcome!</h1>
                 <p>Nginx test website</p>
               </body>
             </html>"
end

file '/srv/mywebsite/data/index.html' do
  owner 'root'
  group 'root'
  mode   0644
  action :create
  content "<p>Test!</p>"
end

# Create the nginx configuration file to enable
# serving from /srv/mywebsite
template '/etc/nginx/conf.d/nginx.conf' do
    owner 'root'
    group 'root'
    mode   0640
    source 'nginx.conf.erb'
    notifies :stop, 'service[nginx]', :immediately
    notifies :reload, 'service[nginx]', :delayed
end

# Make nginx load the new configuration file
execute 'load_conf' do
  # Reload the configuration file
  command 'sudo nginx -c /etc/nginx/conf.d/nginx.conf'
end
