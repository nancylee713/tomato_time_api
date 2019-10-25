configure :development do
  database_name = "tomato_time_api_#{TomatoTimeApi.environment}"
 set :database, "postgres://localhost/#{database_name}"
 set :show_exceptions, true
end

# connect ActiveRecord with the current database
configure :production do
# set the database based on the current environment
  database_name = "tomato_time_api_#{TomatoTimeApi.environment}"
  db = URI.parse(ENV['DATABASE_URL'] || "postgres://localhost/#{database_name}")

 ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :port     => db.port,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )
end
