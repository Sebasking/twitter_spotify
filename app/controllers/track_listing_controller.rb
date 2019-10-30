class TrackListingController < ApplicationController
    def index
        render component: 'TrackListing'
    end
end