
class Request
  def initialize(request_string)
    @request_lines = request_string.split("\n")
    parse_request
  end

  def parse_request
    parse_request_line
    parse_headers
    parse_params if @method == 'GET'
  end

  def parse_request_line
    request_line = @request_lines[0].split("\n")
    @method = request_line[0]
    @resource = request_line[1]
    @version = request_line[2]
  end

  def parse_headers
    @headers = {}
    header_lines = @request_lines[1..-1].reject { |line| line.empty? }

    header_lines.each do |line|
      key, value = line.split(': ')
      @headers[key] = value
    end
  end


  def method
    @method
  end

  def resource
    @resource
  end

  def version
    @version
  end

  def headers
    @headers
  end

  def params
    @params
  end
end

  def params
    @params
  end

  def parse_request
    parse_request_line
    parse_headers
    parse_params if @method == 'GET'
  end

  def parse_request_line(line)
    @method, @version,@source = line.split('')
  end

  def parse_headers
    @headers = {}
    header_lines = @request_lines[1..-1].reject { |line| line.empty? }

    header_lines.each do |line|
      key, value = line.split(': ')
      @headers[key] = value
    end
  end
  
  request_string = File.read('get-index.request.txt')
  
  request_line = Request.new(request_string)

# Exempel resultat som ska fås:

puts "Method: #{request_line.method}" # -----> GET

puts "Resource: #{request_line.resource}" # -----> '/fruits?type=bananas&minrating=4'


p "Version: #{request_line.version}" # -----> 'HTTP/1.1'

p "Headers: #{request_line.headers}" # ----->
# {'Host' => 'fruits.com',
# 'User-Agent' => 'ExampleBrowser/1.0',
# 'Accept-Encoding' => 'gzip, deflate',
# 'Accept' => '*/*'}

p "Params: #{request_line.params} "# -----> {'type' => 'bananas', 'minrating' => '4'}



