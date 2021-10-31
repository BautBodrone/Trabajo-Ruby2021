
class OS
  def self.name
    case RbConfig::CONFIG['host_os']
    when /linux/
      '\''
    when /mswin|mingw32|windows/
      '/'
    end
  end
end