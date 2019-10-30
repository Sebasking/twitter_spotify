class ZapierWebhookController < ApplicationController
    protect_from_forgery with: :null_session

    def recieveWebHook
        begin 
            # byebug
            render :json => {:status => 200}
        rescue
            binding.pry
            render :json => {:status => 400}
        end
    end
end