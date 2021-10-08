module Polycon
  module Commands
    module Professionals
      class Create < Dry::CLI::Command
        require 'fileutils'
        desc 'Create a professional'

        argument :name, required: true, desc: 'Full name of the professional'

        example [
          '"Alma Estevez"      # Creates a new professional named "Alma Estevez"',
          '"Ernesto Fernandez" # Creates a new professional named "Ernesto Fernandez"'
        ]

        def call(name:, **)
          if Dir.exist?("#{Dir.home}/polycon/#{name}")
            puts("Profesional '#{name}' already exists")
          else
            FileUtils.mkdir_p("#{Dir.home}/polycon/#{name}") #si le saco el primer / lo crea en la carpeta del programa
            puts("Profesional '#{name}' successfully created")
          end
        end
      end

      class Delete < Dry::CLI::Command
        desc 'Delete a professional (only if they have no appointments)'

        argument :name, required: true, desc: 'Name of the professional'

        example [
          '"Alma Estevez"      # Deletes a new professional named "Alma Estevez" if they have no appointments',
          '"Ernesto Fernandez" # Deletes a new professional named "Ernesto Fernandez" if they have no appointments'
        ]

        def call(name: nil)
          if Dir.exist?("#{Dir.home}/polycon/#{name}")
            if Dir["#{Dir.home}/polycon/#{name}/*.paf"].empty?
              FileUtils.remove_dir("#{Dir.home}/polycon/#{name}")
              puts "Profesional '#{name}' successfully deleted"
            else
              puts "Please delete all apointments before deleteing the professional"
            end
          else
            puts("Profesional '#{name}' not found")
          end
        end
      end

      class List < Dry::CLI::Command
        desc 'List professionals'

        example [
          "          # Lists every professional's name"
        ]

        def call(*)
          if Dir["#{Dir.home}/polycon/*"].empty?
            puts("No professionals available")
          else
            puts(Dir["#{Dir.home}/polycon/*"].map {|file| File.basename(file)})
          end
        end
      end

      class Rename < Dry::CLI::Command
        desc 'Rename a professional'

        argument :old_name, required: true, desc: 'Current name of the professional'
        argument :new_name, required: true, desc: 'New name for the professional'

        example [
          '"Alna Esevez" "Alma Estevez" # Renames the professional "Alna Esevez" to "Alma Estevez"',
        ]

        def call(old_name:, new_name:, **)
          if Dir.exist?("#{Dir.home}/polycon/#{old_name}")
            File.rename("#{Dir.home}/polycon/#{old_name}","#{Dir.home}/polycon/#{new_name}") # en windows si existe siempre muestra esto
            puts("Profesional '#{old_name}' renamed to '#{new_name}'")
          else
            puts("Profesional '#{old_name}' not found")
          end
        end
      end
    end
  end
end
