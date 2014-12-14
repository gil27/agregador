class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:execute, :about]
  def index
    if params[:tag]
      @ideas = Idea.tagged_with(params[:tag]).order('created_at desc').paginate(params[:page])
    else
      @ideas = Idea.all.order('created_at desc').paginate(params[:page])
    end

  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

  def ideas
    @ideas = current_user.ideas.order('created_at desc').paginate(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
  	@idea = current_user.ideas.build
  end

  def create
  	@idea = Idea.create(idea_params)
    redirect_to root_path, notice: 'Ideia compartilhada com sucesso!'
  end

  def show
  	@idea = Idea.find params[:id]
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :email, :telefone, :twitter, :facebook, :user_id, :tag_list)
  end
end
