class ZapierWebhookController < ApplicationController
    protect_from_forgery with: :null_session

    def recieveWebHook
        begin 
            tweet_text = params["full_text"]
            retweet_count = params["retweet_count"]
            twitter_name = params["user"]["name"]
            song_info = tweet_text.split("-")
            song = song_info[0]
            artist = song_info[1].split("#")[0]
            byebug
            render :json => {:status => 200}
        rescue
            render :json => {:status => 400}
        end
    end
end