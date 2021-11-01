class Os_helper
  def self.name
    case RbConfig::CONFIG['host_os']
    when /linux/
      return '\''
    when /mswin|mingw32|windows/
      return '/'
    end
  end
end