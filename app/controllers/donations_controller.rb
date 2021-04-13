class DonationsController < ApplicationController
  before_action :set_donation, except: [:index, :new, :create]
  
  def index
     if params[:organization_id]
      @organization = Organization.find_by(params[:organization_id])
      @donations = @organization.donations
     else 
      @donations = Donation.all
     end
  end

  def new 
    if params[:organization_id]
      @organization = Organization.find_by(params[:organization_id])
      @donation = @organization.donations.build
    else 
      @donation = Donation.new
      @donation.build_organization
    end 
  end

  def create 
    if params[:organization_id]
      @organization = Organization.find_by(params[:organization_id])
      @donation = @organization.donations.build(donation_params)
    else 
      @donation = Donation.new(donation_params)
    end 

    if @donation.save 
      redirect_to donation_path(@donation)
    else 
      render :new
    end 
  end 

  def show 
  end

  def edit
  end

  def update 
    if @donation.update(donation_params)
      redirect_to donation_path(@donation)
    else 
      render :edit
    end 
  end 

  def destroy
    @donation.destroy
    redirect_to donations_path
  end 

  private 

  def donation_params 
    params.require(:donation).permit(:amount, :date, :organization_id)
  end 

  def set_donation
    @donation = Donation.find_by_id(params[:id])
  end 

end
