

class Application
  attr_reader :headers, :body, :request

 
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


