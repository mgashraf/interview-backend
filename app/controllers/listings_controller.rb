class ListingsController < ApplicationController

  before_action :authenticate_user_from_token!
  before_action :set_user, :set_listings
  
  def create
    if params[:listing]
      listing = params[:listing]
      @user = current_user
      @checklist = Checklist.new
      @checklist.save
      @listing = @user.listings.create(:user_id => @user.id, :checklist_id => @checklist.id)
      @listing.update(listing_params)
      if @listing.save
        render json: { :listing => @listing }, status: :created
      else
        render json: { :error => "Problem creating listing"}, status: :bad_request
      end
      @checklist.update(:listing_id => @listing.id)
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

  def destroy
    @user = current_user
    @listing = @user.listings.find(params[:lid])
    if @listing.destroy
     render json: { :message => "Listing successfully deleted" }, status: :ok
    else
      render json: { :error => "Listing was not deleted" }, status: :not_found
    end 
  end

  private

    def set_user
      @user = current_user
    end

    def set_listing
      @listing = Listing.find(params[:lid])
    end

    def set_listings
      @listings = @user.listings.all
    end

    def listing_params
      params.require(:listing).permit(:posting_url, :contact_email, :phone_number,
                                      :applied, :posting_url, :company_name, :notes,
                                      :submitted_resume, :opportunity_ranking, :opportunity_description,
                                      :opportunity_description, :company_summary, :lead_source, :job_title)

    end
end
# create_table "listings", force: :cascade do |t|
# t.integer  "user_id"
# t.integer  "contact_id"
# t.string   "job_title"
# t.boolean  "applied",       default: false
# t.string   "contact_email"
# t.string   "phone_number"
# t.string   "email"
# t.string   "posting_url"
# t.datetime "created_at",                    null: false
# t.datetime "updated_at",                    null: false
# t.integer  "interview_id"
# t.string   "company_name"
# t.text     "notes"