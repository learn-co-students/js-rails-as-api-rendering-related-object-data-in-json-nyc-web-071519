class SightingsController < ApplicationController
  sighting = Sighting.find_by(id: params[:id])
  render json: sighting, include: [:bird, :location]
end

# An alternative is to use the include option to indicate what models you want to nest

# As before with only and except, include is actually just another option that we can pass into the to_json method. Rails is just obscuring this part:

def show
  sighting = Sighting.find_by(id: params[:id])
  if sighting
    render json: sighting, include: [:bird, :location], except: [:updated_at]
  else
    render json: { message: 'No sighting found with that id' }
  end
end
