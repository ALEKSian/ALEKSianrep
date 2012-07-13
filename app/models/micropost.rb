class Micropost < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :user
  validates :content, :length => { :maximum => 140 }
=======
>>>>>>> 6a1fa9db24dc19a8e269cf1280a245bb9481823b
  attr_accessible :content, :user_id
end
