require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get "/artists" do
    erb :welcome
  end

  post "/artists" do
    artist = Artist.create(params)
    redirect to "/artists/#{artist.id}"
  end

  get'/artists/new' do
    erb :new_artist
  end

  get "/artists/:id" do
    @artist = Artist.find_by(id: params[:id])
    erb :artists
  end

  get '/artists/:id/edit' do
    erb :artists
  end

  put '/artists/:id' do
    binding.pry
    # @artist = Artist.find_by(id: params[:id])
    # @artist.update
    # redirect to "/artist/:id" make dynamic
  end

  delete '/artists/:id' do
    @artist = Artist.find_by(id: params[:id])
    @artist.destroy
    redirect to "/artists"
  end

end
