class IdeasController < ApplicationController
  before_action :authenticate_user!
  def index
  	@ideas = Idea.all
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
