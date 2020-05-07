class SightingsController < ApplicationController
  def show
    sighting = Sighting.find_by(id: params[:id])
    render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
    # render json: sighting, include: [:bird, :location]
    # this is another option to get the same
    # include: also works fine when dealing with an action that renders an array
    #     sighting = Sighting.find_by(id: params[:id])
    #   if sighting
    #     render json: sighting.to_json(include: [:bird, :location])
    #   else
    #     render json: { message: 'No sighting found with that id' }
    #   end
  end
end
