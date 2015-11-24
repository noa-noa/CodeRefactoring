class User < ActiveRecord::Base
	has_many :questions
	has_many :answers
	has_many :relationships, foreign_key: "liker_id"
	has_many :liked_answers, through: :relationships, source: :liked
  has_many :follows, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :follows, source: :followed
  has_many :reverse_follows, foreign_key: "followed_id",
                             class_name:  "Follow",
                             dependent: :destroy
  has_many :followers, through: :reverse_follows, source: :follower
	
	def self.find_or_create_from_auth_hash(auth_hash)
		provider = auth_hash[:provider]
		uid = auth_hash[:uid]
		nickname = auth_hash[:info][:nickname]
		image_url = auth_hash[:info][:image]

		User.find_or_create_by(provider: provider, uid: uid) do |user|
			user.nickname = nickname
			user.image_url = image_url
		end
	end

	def liking?(answer)
    relationships.find_by(liked_id: answer.id)
  end

  def like!(answer)
    relationships.create!(liked_id: answer.id)
  end

  def following?(other_user)
  	follows.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    follows.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
  	follows.find_by(followed_id: other_user.id).destroy
  end
end
