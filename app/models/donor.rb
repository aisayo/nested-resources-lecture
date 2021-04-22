class Donor < ApplicationRecord
  has_secure_password # validation, .authentication, 
  # .password, .password=
  has_many :donations # array 
  has_many :organizations, through: :donations

  # where does validates come from? activerecord 
  validates :name, presence: true, full_name: true
  # validates :username, uniqueness: true
  validates :password, length: { in: 6..10 }
  validate :is_email?

  # custom method 

  def is_email?
    if !email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      errors.add(:email, "Give me a real email dammit")
    end 
  end 

  # validator going to check that theres 2 words when name is submitted
end
