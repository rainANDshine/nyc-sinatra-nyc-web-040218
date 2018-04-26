require 'pry'
require_all 'app'
class FiguresController < ApplicationController
  get '/figures' do # render page to display all figures
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do # render page to create a new figure
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end

  get '/figures/:id' do # render page to display to create a figure
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = @figure.titles
    erb :"figures/show"
  end

  get '/figures/:id/edit' do # render page to edit a figure
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  post '/figures' do # create a new figure
    figure = Figure.find_or_create_by(params[:figure])

    #create title and add to fig
    if params[:newTitle] != ""
      tit = Title.create(name: params[:newTitle])
      figure.titles << tit
    end

    #create landmark and assign to fig
    if params[:newLandmark] != ""
      Landmark.create(figure_id: figure.id, name: params[:newLandmark], year_completed: params[:yc].to_i)
    end


    #add all selected titles to fig
    if params[:titles] != nil
      params[:titles].each do |el|
        a = Title.find(el)
        figure.titles << a
      end
    end
    #add all selected landmarks to fig
    if params[:landmarks] != nil
      params[:landmarks].each do |el|
        a = Landmark.find(el)
        a.figure_id = figure.id
        a.save
      end
    end
    redirect to "figures/#{figure.id}"
  end

# when a user creates or edits a figure, they should also be able
#   to select or create a new landmark and/or title to associate to
#   that figure. In other words, the form for a new figure and the
#   form to edit a figure should allow the user to select from existing
#   landmarks and title and create new landmarks and titles to associate
#    to the figure.


  patch '/figures/:id' do # update a figure
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    redirect to "figures/#{figure.id}"
  end

  delete '/figures/:id/delete' do # delete a figure
    figure = Figure.find(params[:id])
    figure.delete
    redirect to "figures"
  end
end
