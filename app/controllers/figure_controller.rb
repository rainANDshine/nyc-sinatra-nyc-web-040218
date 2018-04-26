class FigureController < Sinatra::Base
  get '/figures' do # display all figures
    erb :"figures/index"
  end

  get '/figures/new' do # create a new figure
    erb :"figures/new"
  end

  post '/figures' do

  end


end
