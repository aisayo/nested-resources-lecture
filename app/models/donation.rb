class Donation < ApplicationRecord
  belongs_to :donor, optional: true
  belongs_to :organization, optional: true

  validates :amount, presence: :true


  # what goes in here? 
    # query methods / scope methods
    # verifications/validations
    # helper methods
    # domain logic 
    # associations 


  
end
