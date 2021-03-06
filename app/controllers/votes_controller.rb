class VotesController < ApplicationController
  before_action :authenticate_user!
  def vote
  	idea = params[:idea]

  	Vote.find_or_create_by!(idea_id: idea, user_id: session[:user_id])

  	respond_to do |format|
  		format.js
  	end
  end
end