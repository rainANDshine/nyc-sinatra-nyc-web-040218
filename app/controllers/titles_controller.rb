# require 'pry'
# class TitlesController < ApplicationController
#
#   get '/titles' do
#     @titles = Title.all
#     erb:'titles/index'
#   end
#
#   post '/titles' do
#     title = Title.find_or_create_by(params[:title])
#     redirect to "titles/#{title.id}"
#   end
#
#   get '/titles/new' do
#     erb:'titles/new'
#   end
#
#   get '/titles/:id' do
#     @title = Title.find(params[:id])
#     erb:'titles/show'
#   end
#
#   patch '/titles/:id' do
#     title = Title.find(params[:id])
#     title.update(params[:title])
#     redirect to "titles/#{title.id}"
#   end
#
#   get '/titles/:id/edit' do
#     @title = Title.find(params[:id])
#     erb:'titles/edit'
#   end
#
#   delete '/titles/:id/delete' do # delete a figure
#     title = Title.find(params[:id])
#     title.delete
#     redirect to "titles"
#   end
# end
