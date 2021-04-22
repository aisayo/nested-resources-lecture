class Donation < ApplicationRecord
  belongs_to :donor, optional: true
  belongs_to :organization, optional: true

  validates :amount, presence: :true


# scope methods 
# class methods that query the table associated with model
# return 

# return the last 3 donations that were made
scope :latest_donations, -> {order(created_at: :desc).limit(3)}




  
end
