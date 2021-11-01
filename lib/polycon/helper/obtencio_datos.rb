class Obtencion_datos
  def self.obtencion_datos (file_param)
    file = File.open(file_param)
    data = (file.readlines.map(&:chomp))
    paciente = "#{data[0].split(" ")[1]} #{data[1].split(" ")[1]}"
    telefono = "#{data[2].split(" ")[1]}"
    nota = "#{data[3].split(" ")[1]}"
    [paciente, telefono, nota]
  end
end
