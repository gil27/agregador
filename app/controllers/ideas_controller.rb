class IdeasController < ApplicationController
  def index
  	@ideas = Idea.paginate(params[:page])
  end

  def show
  	@idea = Idea.find params[:id]
  end
end
