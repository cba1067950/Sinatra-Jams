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
  # /artists/<%= @artist.id %>/edit
  get '/artists/:id/edit' do
    @artist = Artist.find_by(id: params[:id])
    erb :artist_edit
  end

  get "/artists/:id" do
    @artist = Artist.find_by(id: params[:id])
    erb :artists
  end


  patch '/artists/:id' do
    @artist = Artist.find_by(id: params[:id])
    @artist.update(params[:artist])
    redirect to "/artists/#{@artist.id}"
  end

  delete '/artists/:id' do
    @artist = Artist.find_by(id: params[:id])
    @artist.destroy
    redirect to "/artists"
  end

end
