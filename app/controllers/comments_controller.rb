class CommentsController < ApplicationController
	def create
		@advertisement = Advertisement.find(params[:id])
		@comments = Comment.where(advertisement_id: params[:id])
		@comment = Comment.new advertisement_id: params[:id], user_id: @current_user.id, content: params[:content] 
		if @comment.save
			flash[:info] = "Votre commentaire a été posté"
			redirect_to "/advertisements/#{params[:id]}"
		else
			flash[:error] = "Votre commentaire n'a pas été posté"
			render "advertisements/show"
		end
	end
end