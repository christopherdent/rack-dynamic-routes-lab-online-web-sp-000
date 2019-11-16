

class Application
  attr_reader :headers, :body, :request

  def initialize(&block)
    @block = block
    @status = 200
    @headers = {"Content-Type" => "text/html"}
    @body = ""
  end

  def status(value = nil)
    value ? @status = value : @status
  end

  def params
    request.params
  end

  def call(env)
    @request = Rack::Request.new(env)
    @body = self.instance_eval(&@block)
    [status, headers, [body]]
  end

end











=begin   
@@item = [] 

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path=="/items/"
        [200, {"Content-Type" => "text/html"}, ["Hello World!"]]
    else
       [400, {"Content-Type" => "text/html"}, ["Route not found"]]
    end
    resp.finish
  end

end 
=end 
# resp.write "Route not found"
 #      resp.status = 404