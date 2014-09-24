class IdeasController < ApplicationController
  def index
  	@ideas = Idea.paginate(params[:page])
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

  def new
  	@idea = Idea.new
  end

  def create
  	@idea = Idea.create(params[:idea])
  end

  def show
  	@idea = Idea.find params[:id]
  end
end
