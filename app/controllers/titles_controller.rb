require 'pry'
class TitlesController < ApplicationController

  get '/titles' do
    @titles = Title.all
    erb:'titles/index'
  end

  post '/titles' do
    Title.find_or_create_by(name: params[:name])
    @titles = Title.all
    erb:"titles/index"
  end

  get '/titles/new' do
    erb:'titles/new'
  end

  get '/titles/:id' do
    @title = Title.find(params[:id])
    erb:'titles/show'
  end

  patch '/titles/:id' do
    binding.pry
    @title = Title.find(params[:id])
    @title.name = params[:name]
    @title.save
    erb:'titles/show'
  end

  get '/titles/:id/edit' do
    @title = Title.find(params[:id])
    erb:'titles/edit'
  end

  delete '/titles/:id/delete' do # delete a figure
   title = Title.find(params[:id])
   title.delete
   redirect to "titles"
  end



end
