class ApplicationController < ActionController::Base
    def hello
        render text: "Hello Sample app" 
    end
end
