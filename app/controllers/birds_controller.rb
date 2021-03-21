class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # using json: birds is actually json: birds.to_json. Works here bc of rails magic
    render json: birds, only: [:id, :name, :species]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # if bird exists, render the json data
    if bird
      # render json: birds - renders specific bird with all keys
      # render json: {id: bird.id, name: bird.name, species: bird.species} - renders specific bird with specific keys
      # render json: bird.slice(:id, :name, :species) - same as above
      render json: bird, only: [:id, :name, :species] # same as above, best practice. can also use except: in place of only: to exclude specific keys
    # else display error message
    else
      render json: {message: 'Bird not found'}
    end
  end
end