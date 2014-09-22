class IdeasController < ApplicationController
  def index
  	@ideas = Idea.paginate(params[:page])
  end
end
