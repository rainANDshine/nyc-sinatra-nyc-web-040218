require 'pry'
class LandmarksController < ApplicationController

  get '/landmark' do
    @landmarks = Landmark.all
    erb:'landmarks/index'
  end

  post '/landmark' do
    Landmark.find_or_create_by(name: params[:name])
    @landmarks = Landmark.all
    erb:"landmarks/index"
  end

  get '/landmark/new' do
    erb:'landmarks/new'
  end

  get '/landmark/:id' do
    @landmark = Landmark.find(params[:id])
    erb:'landmarks/show'
  end

  patch '/landmark/:id' do
    binding.pry
    @landmark = Landmark.find(params[:id])
    @landmark.name = params[:name]
    @landmark.save
    erb:'landmarks/show'
  end

  get '/landmark/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb:'landmarks/edit'
  end





end
