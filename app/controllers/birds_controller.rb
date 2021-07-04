class BirdsController < ApplicationController
  def index
    birds = Bird.all
    #render json: birds, only: [:id, :name, :species]
    #render json: birds, except: [:created_at, :updated_at]
    render json: birds.to_json(except: [:created_at, :updated_at]) # this code snippet is what is happening behin de scene  on th above code when it doesn't have the to_json method
  end

  def show 
    bird = Bird.find_by(id: params[:id])
    if bird
    #render json: { id: bird.id, name: bird.name, species: bird.species}
    render json: bird.slice(:id, :name, :species)
    else 
      render json: {message: 'Bird Not found'}
    end
  end

end