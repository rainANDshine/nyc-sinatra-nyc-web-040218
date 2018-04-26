require 'pry'
class FiguresController < ApplicationController
  get '/figures' do # render page to display all figures
    @figures = Figure.all
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
    binding.pry
    figure = Figure.create(params[:figure])
    redirect to "figures/#{figure.id}"
  end

  patch '/figures/:id' do # update a figure
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    redirect to "figures/#{figure.id}"
  end

  delete '/figures/:id/delete' do # delete a figure
    binding.pry
    figure = Figure.find(params[:id])
    figure.delete
    redirect to "figures"
  end
end
