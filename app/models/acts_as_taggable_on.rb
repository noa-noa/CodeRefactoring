class Post < ActiveRecord::Base
  acts_as_taggable_on :labels
  acts_as_taggable           
end