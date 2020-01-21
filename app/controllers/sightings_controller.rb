class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        # render json: sightings, include: [:bird, :location]
            # Using include: also works fine when dealing with an action that renders an array, like when we use all in index actions
        
        render json: sightings.to_json(include: [:bird, :location])
    end


       
    def show
        sighting = Sighting.find_by(id: params[:id])
        # render json: sighting
            
            # custom hash: now that the models are connected
        # render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
            
            # use include: same as the customized one above
        # render json: sighting, include: [:bird, :location]
        # render json: sighting.to_json(include: [:bird, :location])

    # Error Handling
        # if sighting
        #     render json: sighting.to_json(include: [:bird, :location])
        # else
        # render json: { message: 'No sighting found with that id' }
        # end
    
    # include + only: / except: 
        # render json: sighting, include: [:bird, :location], except: [:updated_at]
    
    # gets complicated: adding nesting into options:
        render json: sighting.to_json(:include => {
        :bird => {:only => [:name, :species]},
        :location => {:only => [:latitude, :longitude]}
      }, :except => [:updated_at])
    
    end
end

# include is actually just another option that we can pass into the to_json method. Rails is just obscuring this part: