class OrganizationsController < ApplicationController
    before_action :set_organization, except: [:index, :new, :create]

    def index 
        @organizations = Organization.baller_donations
        @donations = Donation.latest_donations
    end
    
      def new 
       @organization = Organization.new
      end
    
      def create 
        @organization = Organization.new(organization_params)
        if @organization.save 
          redirect_to organization_path(@organization)
        else 
          render :new
        end 
      end 
    
      def show 
        # if i wanted to show all organizations donations as well
        @organization = Organization.find_by(id: params[:id])
      end

      def edit
      end
    
      def update 
        if @organization.update(organization_params)
            redirect_to organization_path(@organization)
        else 
            render :edit
        end 
      end 
    
      def destroy
        @organization.destroy
        redirect_to organizations_path
      end 
    
    
private 

      def organization_params
        params.require(:organization).permit(:name)
      end 

      def set_organization
        @organization = Organization.find_by_id(params[:id])
      end 
end
