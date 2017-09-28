class CommentsController < ApplicationController
	def create
		@comment = Comment.new advertisement_id: params[:id], user_id: @current_user.id, content: params[:content] 
		if @comment.save
			flash[:info] = "Votre commentaire a été posté"
			redirect_to "/advertisements/#{params[:id]}"
		else
			flash[:info] = "Votre commentaire n'a pas été posté"
			redirect_to "/advertisements/#{params[:id]}"
		end
	end
end