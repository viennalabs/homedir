require 'thor'

module Homedir
  # The command line interface for {Homedir}.
  #
  # See the source or the command line tool `bin/homedir` for more
  # information
  class CLI < Thor

    desc "list", "Lists available packages.""
    method_option(
      :remote,
      :type => :boolean,
      :default => false,
      :aliases => '-r',
      :description => "Queries the remote server")
    def list
      # FIXME: list needs to do something
      puts "Not implemented yet"
    end

    desc "info PACKAGE", "Describe a specific PACKAGE in detail."
    def info(package_name)
      # FIXME: info needs to do something
      puts "Not implemented yet #{package_name.inspect}"
    end

    desc "enable PACKAGE...", "Enable PACKAGE, making it available in your home directory."
    def enable(*packages)
      # FIXME: info needs to do something
      puts "Not implemented yet #{packages.inspect}"
    end

    desc "disable PACKAGE...", "Disable PACKAGE, removing it from your home directory."
    def disable(*packages)
      # FIXME: info needs to do something
      puts "Not implemented yet #{packages.inspect}"
    end

    desc "create PACKAGE...", "Create PACKAGE, prompting you for information."
    method_option(
      :directory,
      :type => :string,
      :default => "#{ENV['HOME']}/.homedir/package",
      :aliases => "-d",
      :description => "Where to save the DIRECTORY."
    )
    def create(package_name)
      # FIXME: info needs to do something
      puts "Not implemented yet #{package_name.inspect}"
    end

    desc "repair", "Scans through your home directory and repairs all links. Warning: This can take a long time."
    def repair
      # FIXME: needs to do something
      puts "Not implemented yet"
    end
  end
end

