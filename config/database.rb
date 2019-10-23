# connect ActiveRecord with the current database
ActiveRecord::Base.establish_connection(
  :adapter  => "postgresql",
  :database => "tomato_time_api"
)
