class AdvertisementsController < ApplicationController
  def new
    @advertisement = Advertisement.new
  	if !@current_user
  		flash[:error] = "Accès interdit. Vous devez être connecté pour proposer une annonce."
  		return redirect_to request.referrer || root_path
  	end
  end

  def create
  	@advertisement = Advertisement.new title: params[:title], content: params[:content], price: params[:price], user_id: @current_user.id, state: "waiting"
  	if @advertisement.save
  		flash[:info] = "Votre annonce a bien été enregistrée. Elle est maintenant en attente de validation."
  		redirect_to "/users/home"
  	else
  		flash[:error] = "L'enregistrement de l'annonce a échoué."
  		render 'new'
  	end  	
  end

  def validate
  	@advertisement = Advertisement.find(params[:id])
  	@comments = Comment.where(advertisement_id: @advertisement)

  	if @current_user.try(:role) != "admin"
  		flash[:error] = "Action interdite"
  		return redirect_to request.referrer || root_path
  	else
  		if @advertisement.update state: "published"
  			flash[:info] = "L'annonce est publiée"
  			redirect_to "/advertisements/#{params[:id]}"
  		else
  			flash[:error] = "L'annonce n'a pas été publiée"
  			render 'show'
  		end
  	end
  end

  def index
  	@published_ads = Advertisement.where(state: "published")
  	@waiting_ads = Advertisement.where(state: "waiting") 
  end

  def show
  	@advertisement = Advertisement.find(params[:id])
    @comment = Comment.new
  	@comments = Comment.where(advertisement_id: @advertisement)
  	if @advertisement.state != "published" && @current_user.try(:role) != "admin"
  		flash[:error] = "Accès interdit"
  		return redirect_to request.referrer || root_path
  	end
  end

end
