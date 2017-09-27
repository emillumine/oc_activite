class UsersController < ApplicationController
  def home
  end

  def new
  end

  def create
  	if User.create name: params[:name], password: params[:password], role: "user"
  		flash[:info] = "Votre compte a été créé. Veuillez vous connecter."
  		redirect_to "/users/login"
  	else
  		flash[:info] = "L'inscrition a échoué."
  		render "/users/new"
  	end
  end

  def login
  end

  def check
  	@current_user = User.where(name: params[:name], password: params[:password]).first
  	if @current_user
  		session[:user_id] = @current_user.id 
  		flash[:info] = "Vous êtes maintenant connecté"
  		redirect_to "/users/home"
  	else
  		session[:user_id] = nil
  		flash[:info] = "La connexion a échoué"
  		redirect_to '/users/home'
  	end
  end

  def logout
  	session[:user_id] = nil
  	flash[:info] = "Vous êtes maintenant déconnecté"
  	redirect_to "/users/home"
  end

end
