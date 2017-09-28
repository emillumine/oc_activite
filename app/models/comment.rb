class Comment < ActiveRecord::Base
	belongs_to :advertisement
	belongs_to :user

	validates :content, presence: {
		message: "Erreur ! Le commentaire est vide"
	}
	
	validates :user_id, presence: {
		message: "Erreur ! L'auteur doit être renseigné"
	}
end