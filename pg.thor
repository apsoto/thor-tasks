class Pg < Thor
  include Thor::Actions

  desc "init", "Create a postgresql db cluster.  Sets user from config as super user."
  method_option :config, :aliases => '-c', :desc => "Location of a rails database.yml file.", :default => './config/database.yml'
  method_option :environment, :aliases => '-e', :desc => "Environment to use from database.yml.", :default => "development"
  method_option :dir, :aliases => '-d', :desc => "Directory to create the db cluster", :default => "./db/postgresql"
  def init
    db_dir = options[:dir]
    yaml = YAML::load(File.read(options[:config]))[options[:environment]]

    password = yaml["password"]
    raise "Password missing from config" if password.nil?

    username = yaml["username"]
    raise "Username missing from config" if username.nil?

    password_file = Tempfile.new('pword')
    password_file.write password
    password_file.flush

    command = %{initdb -D #{db_dir} -U #{username} --pwfile=#{password_file.path}}
    run(command)
  end
end

