require 'pry'
class LandmarksController < ApplicationController

  get '/title' do
    @titles = Title.all
    erb:'titles/index'
  end

  post '/title' do
    Title.find_or_create_by(name: params[:name])
    @titles = Title.all
    erb:"titles/index"
  end

  get '/title/new' do
    erb:'titles/new'
  end

  get '/title/:id' do
    @title = Title.find(params[:id])
    erb:'titles/show'
  end

  patch '/title/:id' do
    binding.pry
    @title = Title.find(params[:id])
    @title.name = params[:name]
    @title.save
    erb:'titles/show'
  end

  get '/title/:id/edit' do
    @title = Title.find(params[:id])
    erb:'titles/edit'
  end


end
