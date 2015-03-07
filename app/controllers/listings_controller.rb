class ListingsController < ApplicationController

  before_action :authenticate_user_from_token!
  before_action :set_user, :set_listings
  
  def create
    listing = params[:listing]
    # binding.pry
    @listing = @user.listings.new(:user_id => @user.id, :job_title => listing[:job_title], 
                          :posting_url => listing[:url], :contact_email => listing[:contact_email],
                          :phone_number => listing[:phone_number], :applied => listing[:applied],
                          :posting_url => listing[:posting_url], :company_name => listing[:company_name],
                          :notes => listing[:notes], :submitted_resume => listing[:submitted_resume],
                          :opportunity_ranking => listing[:opportunity_ranking], 
                          :opportunity_description => listing[:opportunity_description],
                          :company_summary => listing[:company_summary], :lead_source => listing[:lead_source])
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

    # #:job_title => listing[:job_title], 
    #                       :posting_url => listing[:url], :contact_email => listing[:contact_email],
    #                       :phone_number => listing[:phone_number], :applied => listing[:applied],
    #                       :posting_url => listing[:posting_url], :company_name => listing[:company_name],
    #                       :notes => listing[:notes], :submitted_resume => listing[:submitted_resume],
    #                       :opportunity_ranking => listing[:opportunity_ranking], 
    #                       :opportunity_description => listing[:opportunity_description],
    #                       :company_summary => listing[:company_summary], :lead_source => listing[:lead_source]

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