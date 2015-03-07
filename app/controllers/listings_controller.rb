class ListingsController < ApplicationController

  before_action :authenticate_user_from_token!
  before_action :set_user, :set_listings
  
  def create
    listing = JSON.parse(params[:listing])
    @listing = @user.listings.new(:user_id => @user.id, :job_title => listing[:title], 
                          :posting_url => listing[:url], :email => listing[:email],
                          :contact_email => listing[:contact_email], :phone_number => listing[:phone_number])
    if @listing.save
      render json: { :listing => @listing }, status: :created
    else
      render json: { :error => "Problem creating listing"}, status: :bad_request
    end
  end

  def edit
    @user = current_user
    @listing = @user.listings.find(params[:lid])
    if @listing.update( listing_params )
      render json: { :listing => @listing }, status: :ok
    else
      render json: { :error => "There was an error"}, status: :bad_request
    end
  end

  def index
    @user = current_user
    @listings = set_listings
    if @listings.count > 0
      render json: { :listings => @listings }, status: :ok
    else
      render json: { :error => "There are currently no listings" }, status: :no_content
    end
  end

  def show
    @user = current_user
    @listing = @user.listings.find(params[:lid])
    if @listing
      render json: { :listing => @listing }, status: :ok
    else
      render json: { :error => "No listing with that id" }, status: :not_found
    end
  end

  private

    def set_user
      @user = current_user
    end

    def set_listings
      @listings = @user.listings.all
    end

    def listing_params
      params.require(:listing).permit(:job_title, :applied, :contact_email, :phone_number, :email, :posting_url, :contact_id, :company_id)
    end

end

# SCHEMA THINGS UPDATE AS NEEDED
# t.integer  "user_id"
# t.integer  "company_id"
# t.integer  "contact_id"
# t.string   "job_title"
# t.boolean  "applied",       default: false
# t.string   "contact_email"
# t.string   "phone_number"
# t.string   "email"
# t.string   "posting_url"
# t.datetime "created_at",                    null: false
# t.datetime "updated_at",