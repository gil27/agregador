class IdeasController < ApplicationController
  def index
  	@ideas = Idea.paginate(params[:page])
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
