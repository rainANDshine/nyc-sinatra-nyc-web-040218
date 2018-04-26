class FiguresController < Sinatra::Base
  get '/figures' do # render page to display all figures
    erb :"figures/index"
  end

  get '/figures/new' do # render page to create a new figure
    erb :"figures/new"
  end

  get '/figures/:id' do # render page to display to create a figure
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do # render page to edit a figure
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  post '/figures' do # create a new figure
    figure = Figure.create(params)
    redirect to "figures/#{figure.id}"
  end

  patch '/figures/:id/edit' do # update a figure
    figure = Figure.find(params[:id])
    figure.update(params)
    redirect to "figures/#{figure.id}"
  end

  delete '/figures/:id/delete' do
    figure = Figure.find(params[:id])
    figure.delete
    redirect to "figures/index"
  end


end
