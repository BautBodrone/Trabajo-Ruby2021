require 'date'
module Polycon
  module Commands
    module Appointments
      class Create < Dry::CLI::Command
        desc 'Create an appointment'

        argument :date, required: true, desc: 'Full date for the appointment'
        option :professional, required: true, desc: 'Full name of the professional'
        option :name, required: true, desc: "Patient's name"
        option :surname, required: true, desc: "Patient's surname"
        option :phone, required: true, desc: "Patient's phone number"
        option :notes, required: false, desc: "Additional notes for appointment"

        example [
          '"2021-09-16 13:00" --professional="Alma Estevez" --name=Carlos --surname=Carlosi --phone=2213334567'
        ]

        def call(date:, professional:, name:, surname:, phone:, notes: nil)
          #date.filled(:date?)
          begin
            Date.parse(date)
            if File.directory?("#{Dir.home}/polycon/#{professional}")
              if File.exist?("#{Dir.home}/polycon/#{professional}/#{date}.paf")
                puts "An appointment with that date already exist"
              else
                puts("Appointment created")
                File.open("#{Dir.home}/polycon/#{professional}/#{date}.paf","w+") do
                  |f| f.write("Surname: #{surname}\nName: #{name}\nPhone: #{phone}\nNotes:#{notes}")
                end
              end
            else
              puts "Professional doesnt exist"
            end
          rescue
            puts("Invalid date format recommended format: year-month-day_hour-minute")
          end
        end
      end

      class Show < Dry::CLI::Command
        desc 'Show details for an appointment'

        argument :date, required: true, desc: 'Full date for the appointment'
        option :professional, required: true, desc: 'Full name of the professional'

        example [
          '"2021-09-16 13:00" --professional="Alma Estevez" # Shows information for the appointment with Alma Estevez on the specified date and time'
        ]

        def call(date:,professional:)
          if File.directory?("#{Dir.home}/polycon/#{professional}")
            if File.exist?("#{Dir.home}/polycon/#{professional}/#{date}.paf")
              puts(File.read("#{Dir.home}/polycon/#{professional}/#{date}.paf"))
            else
              puts "Appointment with that date doesnt exist"
            end
          else
            puts "Professional doesnt exist"
          end
        end
      end

      class Cancel < Dry::CLI::Command
        desc 'Cancel an appointment'

        argument :date, required: true, desc: 'Full date for the appointment'
        option :professional, required: true, desc: 'Full name of the professional'

        example [
          '"2021-09-16 13:00" --professional="Alma Estevez" # Cancels the appointment with Alma Estevez on the specified date and time'
        ]

        def call(date:, professional:)
          if File.directory?("#{Dir.home}/polycon/#{professional}")
            if File.exist?("#{Dir.home}/polycon/#{professional}/#{date}.paf")
              puts "Appointment deleted"
              File.delete("#{Dir.home}/polycon/#{professional}/#{date}.paf")
            else
              puts "Appointment with that date doesnt exist"
            end
          else
            puts "Professional doesnt exist"
          end
        end
      end

      class CancelAll < Dry::CLI::Command
        desc 'Cancel all appointments for a professional'

        argument :professional, required: true, desc: 'Full name of the professional'

        example [
          '"Alma Estevez" # Cancels all appointments for professional Alma Estevez',
        ]

        def call(professional:)
          if File.directory?("#{Dir.home}/polycon/#{professional}")
            puts "All appointments have been deleted"
            Dir["#{Dir.home}/polycon/#{professional}/*.paf"].each { |file| File.delete(file)}
          else
            puts "Professional doesnt exist"
          end
        end
      end

      class List < Dry::CLI::Command
        desc 'List appointments for a professional, optionally filtered by a date'

        argument :professional, required: true, desc: 'Full name of the professional'
        option :date, required: false, desc: 'Date to filter appointments by (should be the day)'

        example [
          '"Alma Estevez" # Lists all appointments for Alma Estevez',
          '"Alma Estevez" --date="2021-09-16" # Lists appointments for Alma Estevez on the specified date'
        ]

        def call(professional:)
          if File.directory?("#{Dir.home}/polycon/#{professional}")
            if Dir["#{Dir.home}/polycon/#{professional}/*.paf"].empty?
              puts("This professional doesnt has any appointments")
            else
              puts(Dir["#{Dir.home}/polycon/#{professional}/*.paf"].sort.map {|file| File.basename(file)})
            end
          else
            puts "Professional doesnt exist"
          end
        end
      end

      class Reschedule < Dry::CLI::Command
        desc 'Reschedule an appointment'

        argument :old_date, required: true, desc: 'Current date of the appointment'
        argument :new_date, required: true, desc: 'New date for the appointment'
        option :professional, required: true, desc: 'Full name of the professional'

        example [
          '"2021-09-16 13:00" "2021-09-16 14:00" --professional="Alma Estevez" # Reschedules appointment on the first date for professional Alma Estevez to be now on the second date provided'
        ]

        def call(old_date:, new_date:, professional:)
          if File.directory?("#{Dir.home}/polycon/#{professional}")
            if File.exist?("#{Dir.home}/polycon/#{professional}/#{old_date}.paf")
              puts("Appointment has been reschedule")
              File.rename("#{Dir.home}/polycon/#{professional}/#{old_date}.paf","#{Dir.home}/polycon/#{professional}/#{new_date}.paf")
            else
              puts "Appointment with that date doesnt exist"
            end
          else
            puts "Professional doesnt exist"
          end
        end
      end

      class Edit < Dry::CLI::Command
        desc 'Edit information for an appointments'

        argument :date, required: true, desc: 'Full date for the appointment'
        option :professional, required: true, desc: 'Full name of the professional'
        option :name, required: false, desc: "Patient's name"
        option :surname, required: false, desc: "Patient's surname"
        option :phone, required: false, desc: "Patient's phone number"
        option :notes, required: false, desc: "Additional notes for appointment"

        example [
          '"2021-09-16 13:00" --professional="Alma Estevez" --name="New name" # Only changes the patient\'s name for the specified appointment. The rest of the information remains unchanged.',
          '"2021-09-16 13:00" --professional="Alma Estevez" --name="New name" --surname="New surname" # Changes the patient\'s name and surname for the specified appointment. The rest of the information remains unchanged.',
          '"2021-09-16 13:00" --professional="Alma Estevez" --notes="Some notes for the appointment" # Only changes the notes for the specified appointment. The rest of the information remains unchanged.',
        ]

        def call(date:, professional:, **options)
          warn "TODO: Implementar modificación de un turno de la o el profesional '#{professional}' con fecha '#{date}', para cambiarle la siguiente información: #{options}.\nPodés comenzar a hacerlo en #{__FILE__}:#{__LINE__}."
        end
      end
    end
  end
end
