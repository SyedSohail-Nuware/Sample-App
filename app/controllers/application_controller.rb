class ApplicationController < ActionController::Base
    include SessionsHelper
    def hello
        render html: "Hello Sample app" 

    end
end
