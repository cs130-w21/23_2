class PagesController < ApplicationController
    def home
        @user = User.find(current_user.id)
        if current_user.profile
            
           
            @chatrooms = Chatroom.all
            @results = []
            @chatrooms.each do |x|
                
                @results.push(x)

            end
            @unread = 0
            @requests = 0
        end
        
        
    end
    
    
    

end