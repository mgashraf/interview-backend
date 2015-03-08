class ChecklistsController < ApplicationController
  before_action :authenticate_user_from_token!

  def show_pre
    @checklist = set_checklist
    if @checklist
      render json: { :preinterview => @checklist.as_json(:only => [:research, :interviewer, :location, :businesscards, :keyfindings, :interviewtips]) }, status: :ok
    else
      render json: { :error => "Error retrieving checklist" }, status: :not_found
    end

  end

  def show_post
    @checklist = set_checklist
    if @checklist
      render json: { :postinterview => @checklist.as_json(:only => [:takeaway, :conversation, :whodidyoumeet, :status, :contactemail, :recruiteremail, :thankyounote]) }, status: :ok
    else
      render json: { :error => "Error retrieving checklist" }, status: :not_found
    end
  end

  def edit_pre
    @checklist = set_checklist
    if @checklist.update( pre_params )
      render json: { :preinterview => @checklist.as_json(:only => [:research, :interviewer, :location, :businesscards, :keyfindings, :interviewtips]) }, status: :ok
    else
      render json: { :error => "Error retrieving checklist" }, status: :not_found
    end
  end

  def edit_post
    @checklist = set_checklist
    if @checklist.update ( post_params )
      render json: { :postinterview => @checklist.as_json(:only => [:takeaway, :conversation, :whodidyoumeet, :status, :contactemail, :recruiteremail, :thankyounote]) }, status: :ok
    else
      render json: { :error => "Error writing checklist" }, status: :not_found
    end
  end

  private

  def set_checklist
    @checklist = Checklist.find_by(:listing_id => params[:lid])
  end

  def post_params
    params.require(:checklist).permit(:takeaway, :conversation, :whodidyoumeet, :status, :contactemail, :recruiteremail, :thankyounote)
  end

  def pre_params
    params.require(:checklist).permit(:research, :interviewer, :location, :businesscards, :keyfindings, :interviewtips)
  end


end
# t.integer :listing_id
#       t.string :takeaway
#       t.text :conversation
#       t.text :whodidyoumeet
#       t.string :status
#       t.string :contactemail
#       t.string :recruiteremail
#       t.string :thankyounote

#       t.string :research
#       t.string :interviewer
#       t.string :location
#       t.string :businesscards
#       t.string :keyfindings
#       t.string :interviewtips

#       t.timestamps null: false
#     end
#   end
# end
