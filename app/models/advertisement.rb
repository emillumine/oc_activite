class Advertisement < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates :title, presence: {
		message: "Erreur ! Le titre doit être renseigné."
	}

	validates :content, presence: {
		message: "Erreur ! Le contenu doit être renseigné."
	}

	validates :price, presence: {
		message: "Erreur ! Le prix doit être renseigné."
	}

	validates :user_id, presence: {
		message: "Erreur ! L'auteur doit être renseigné"
	}
end