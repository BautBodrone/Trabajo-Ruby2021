class Obtencion_datos
  def obtencion_datos (file)
    paciente = "#{file.readlines.map(&:chomp)[0].split(" ")[1]} #{file.readlines.map(&:chomp)[1].split(" ")[1]}"
    telefono = "#{file.readlines.map(&:chomp)[2].split(" ")[1]}"
    nota = "#{file.readlines.map(&:chomp)[3].split(" ")[1]}"
    [paciente, telefono, nota]
  end
end
