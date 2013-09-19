require './settings'

Cuba.define do
  on get do  
    
    on "hello" do
      res.write view('index')
    end

    on root do
      res.redirect "/hello"
    end
  end
end