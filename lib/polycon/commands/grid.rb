require 'date'
require 'erb'
require 'rbconfig'
require_relative 'obtencio_datos'
require_relative 'os'

module Polycon
  module Commands
    module Grid
      class Dia < Dry::CLI::Command
        desc 'Create day grid'
        argument :date, required: true, desc: 'Full date for the Grid'
        def call(date:)
          separator = os.name
          hash_appoint = {"8:00": "","8:15":"","8:30":"","8:45":"","9:00": "","9:15":"","9:30":"","9:45":"","10:00": "","10:15":"",
                          "10:30":"","10:45":"","11:00": "","11:15":"","11:30":"","11:45":"","12:00": "","12:15":"","12:30":"",
                          "12:45":"", "13:00": "","13:15":"","13:30":"","13:45":"","14:00": "","14:15":"","14:30":"","14:45":"",
                          "15:00": "","15:15":"", "15:30":"","15:45":""}
          Dir["#{Dir.home}/polycon/*"].each do |profesional|
            prof = profesional.split("polycon"+separator)[1].split("/")[0]
            Dir["#{profesional}/*"].each do |file|
              aux = (file.split("polycon"+separator))[1].split(separator)[1].split("_")
              fecha_file = aux[0]
              if date == fecha_file
                hora = aux[1].gsub("-",":")
                paciente, telefono, nota = obtencion_datos(File.open(file))
                hash_datos = "Profesional: #{prof} \nPaciente: #{paciente} \nTelefono: #{telefono}\nNota: #{nota}"
                hash_appoint[hora] = hash_datos
              end
            end
          end
          template = File.read('./templates/dia.html')
          erb = ERB.new(template).result_with_hash(hash:hash_appoint)
          output = erb
          File.open("#{Dir.home}/#{date}.pdf","w+") do
            |f| f.write(output)
          end
        end
      end
    end
  end
end

