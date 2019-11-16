

class Application
  attr_reader :headers, :body, :request
=begin 
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
=end 




 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path=="/items"
      resp.write "#{item.price}"
      resp.status = 200 
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end


