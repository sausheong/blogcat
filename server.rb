require './settings'
require './models'

Cuba.define do
  on get do  

    on "auth" do
      
      on "login" do
        res.redirect "https://www.facebook.com/dialog/oauth?client_id=#{ENV['FACEBOOK_APP_ID']}&\
                      redirect_uri=#{req.scheme}://#{req.host}:#{req.port}/auth/callback"
      end
      
      on "callback", param('code') do |code|
        resp = RestClient.get("https://graph.facebook.com/oauth/access_token",
                          params: {client_id: ENV['FACEBOOK_APP_ID'],
                                   client_secret: ENV['FACEBOOK_APP_SECRET'],
                                   redirect_uri: "#{req.scheme}://#{req.host}:#{req.port}/auth/callback",
                                   code: code})                                           
        session[:access_token] = resp.split("&")[0].split("=")[1]
        user = RestClient.get("https://graph.facebook.com/me?access_token=#{session[:access_token]}&fields=picture,name,username,link,timezone")
        session[:user] = JSON.parse user
        res.redirect "/"
  
      end
      
      on "logout" do
        
      end
      
    end

    on root do      
      res.write view('index', toolbar: partial('toolbar'))
    end

    on "post" do
      
      on "new" do
      
      end

      on "view/:id" do |id|
        
      end
    
      on "edit/:id" do |id|
      
      end
      
    end

  end
  
  on post do
    
    on "post" do
      
    end
    
    on "comment" do
      
    end
    
  end
end