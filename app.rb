require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/pirates' do
      @pirates = Pirate.all
      erb :'pirates/index'
    end

    get '/pirates/new' do
      erb :'pirates/new'
    end

    get '/pirates/:id' do
      @pirate = Pirate.find(params[:id])

      erb :'pirates/show'
    end

    post '/pirates' do
      binding.pry
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end

      @ships = Ship.all
      erb :show
    end

    # get '/' do
    #   "Welcome to the Nested Forms Lab! let's navigate to the '/new'"
    # end
    #
    # get '/new' do
    #   erb :'pirates/new'
    # end
    #
    # post '/pirates' do
    #   @pirate = Pirate.new(params[:pirate])
    #
    #   params[:pirate][:ships].each do |details|
    #     Ship.new(details)
    #   end
    #
    #   @ships = Ship.all
    #
    #   erb :'pirates/show'
    # end

  end
end
