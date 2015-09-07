require "json"

class JsonParser
  def initialize(dir, filename)
    @dir = dir
    @filename = filename
  end

  def parse
    JSON.load File.open(File.join(@dir, @filename))
  end
end
