class SightingsController < ApplicationController
  def show
    sighting = Sighting.find_by(id: params[:id])
    render json: sighting.to_json(:include => {
      :bird => {:only => [:name, :species]},
      :location => {:only => [:latitude, :longitude]}
    }, :except => [:bird_id, :location_id, :created_at, :updated_at])
  end
end
