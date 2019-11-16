

class Application

  @@items = []

 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path=="/items"
  
      item_name = req.path.split("/items/").last
      item = @@items.detect { |i| i.name == item_name }
      if item
        resp.write item.price
      else
        resp.write "Route not found"
        resp.status = 404
      end
    end 
    resp.finish
  end
end


