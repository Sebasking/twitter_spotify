class TrackListingController < ApplicationController
    def show
        render component: 'TrackListing', props: {}
    end
end