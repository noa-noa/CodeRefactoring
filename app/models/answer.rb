class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	has_many :reverse_relationships, foreign_key: "liked_id",
                                   	 class_name:  "Relationship",
                                   	 dependent:   :destroy
	has_many :likers, through: :reverse_relationships, source: :liker
	#has_many :comments

	validates :body, presence: true
end
