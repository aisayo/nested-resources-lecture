class Organization < ApplicationRecord
    has_many :donations
    has_many :donors, through: :donations


    # scope method that organizes donations by their organization 

    # write a scope method as class method

    def self.orgs_donations 
        joins(:donations).group('organizations.name')
    end

    # scope method 

    # scope :orgs_donations, -> {joins(:donations).group('organizations.name')}
        
    # alphabetize the list of organizations 
    scope :alpha, -> {order('name')}

    # show organizations with donations more than 1000

    scope :baller_donations, -> {joins(:donations).where('donations.amount > 5000').group('organizations.name')}
end
