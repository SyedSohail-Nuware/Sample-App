class ApplicationController < ActionController::Base
    def hello
        render html: "Hello Sample app" 
    end
end
