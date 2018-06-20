class User < ActiveRecord::Base
	has_many :advertisements
	has_many :comments

	validates :name, presence: {
		message: "Erreur ! Le nom doit être renseigné."
	}

	validates :name, uniqueness: {
		message: "Erreur ! Ce nom est déjà pris."
	}

	validates :password, presence: {
		message: "Erreur ! Le mot de passe doit être renseigné."
	}

end