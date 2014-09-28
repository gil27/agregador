class IdeasController < ApplicationController
  before_action :authenticate_user!
  def index
  	@ideas = Idea.all.paginate(params[:page])

  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

  def new
  	@idea = Idea.new
  end

  def create
  	@idea = Idea.create(idea_params)
    redirect_to root_path, notice: 'Idéia compartilhada com sucesso!'
  end

  def show
  	@idea = Idea.find params[:id]
  end

  private

  def idea_params
    params.require(:user).permit(:title, :description)
  end
end
