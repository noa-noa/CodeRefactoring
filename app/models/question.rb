class Question < ActiveRecord::Base
	belongs_to :user
  	has_many :answers
  # has_many :comments, through: :answers

  	acts_as_ordered_taggable_on :tags

  	validates :title, presence: true, length: { maximum: 30 }
  	validates :description, presence: true, length: { maximum: 140 }
  	validates :theme, presence: true
  	validates :code, presence: true
 end