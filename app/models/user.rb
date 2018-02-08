class User < ApplicationRecord
 has_many :created_events, foreign_key: "creator_id", class_name: "Event"

 has_and_belongs_to_many :attended_events, class_name: "Event"


 before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { in: 4..20}, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

end
