worker_processes Integer(ENV["WEB_CONCURRENCY"] || 2)
timeout 65
preload_app true

listen 3000
pid "/tmp/unicorn.pid"


## XXX: Adjust graceful restart behavior for gets along with supervisord.
#

# before_fork do |server, worker|
# end

# after_fork do |server, worker|
# end

if ENV["RAILS_LOG_TO_STDOUT"].present?
  stdout_path '/dev/stdout'
  stderr_path '/dev/stderr'
else
  stdout_path File.expand_path('log/unicorn_out.log', ENV['RAILS_ROOT'])
  stderr_path File.expand_path('log/unicorn_err.log', ENV['RAILS_ROOT'])
end
