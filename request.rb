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
    @method, @resource, @version = @request_lines[0].split(' ')
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

  def parse_request_line
    @method, @resource, @version = @request_lines[0].split(' ')
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

# Exempel resultat som ska fås. Detta ska ge :GET, det blev:

p request_line.method

p request_line.resource


p request_line.version

p request_line.headers

p request_line.params



# Detta ska ge :GET, det blev: 
