require 'pry'
class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb:'landmarks/index'
  end

  post '/landmarks' do
    landmark = Landmark.find_or_create_by(params[:landmark])
    binding.pry
    redirect to "landmarks/#{landmark.id}"
  end

  get '/landmarks/new' do
    erb:'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb:'landmarks/show'
  end

  patch '/landmarks/:id' do
    #binding.pry
    landmark = Landmark.find(params[:id])
    landmark.update(params[:landmark])
    redirect to "landmarks/#{landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb:'landmarks/edit'
  end

  delete '/landmarks/:id/delete' do # delete a figure
    landmark = Landmark.find(params[:id])
    landmark.delete
    redirect to "landmarks"
  end
end
