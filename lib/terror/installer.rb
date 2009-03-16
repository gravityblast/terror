require File.dirname(__FILE__) + '/../terror'
require 'erb'

module Terror
  class Installer
    include FileUtils
    
    attr_reader :root
    
    def initialize(path)
      @project_name = path
      @root         = File.expand_path(path)
    end
    
    def start
      create_folders
      copy_files
      create_thin_configuration
    end
    
    private
    
      def create_folders
        mkdir_p "#{root}/public"
        mkdir_p "#{root}/config"
        mkdir_p "#{root}/db"
        mkdir_p "#{root}/tmp"
        mkdir_p "#{root}/log"
      end
      
      def copy_files
        cp "#{Terror.root}/public/style.css",           "#{root}/public/style.css"
        cp "#{Terror.root}/config/terror.yml.default",  "#{root}/config/terror.yml"
        cp "#{Terror.root}/config/config.ru.default",   "#{root}/config.ru"
        cp "#{Terror.root}/config/Rakefile.default",    "#{root}/Rakefile"
      end
    
      def create_thin_configuration
        File.open(Terror.root + '/config/thin.yml.default') do |template|
          File.open("#{root}/config/thin.yml", 'w') do |output|
            output.write(ERB.new(template.read).result(binding))
          end
        end
      end
      
  end
end