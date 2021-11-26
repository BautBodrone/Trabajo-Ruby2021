json.extract! appointment, :id, :name, :surname, :phone, :date, :notes, :professional_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
