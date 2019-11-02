class ConsoleLogger
  def self.yellow(msg:)
    print msg.color(33)
  end

  def self.green(msg:)
    print msg.color(32)
  end

  def self.red(msg:)
    print msg.color(31)
  end
end

String.send(:define_method, 'color') do |code|
  "\e[#{code}m#{self}\e[0m"
end
