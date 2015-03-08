class ResumesController < ApplicationController
  before_action :authenticate_user_from_token!
  
  def create
    @resume = Resume.new(:user_id => current_user.id)
    if @resume.update( resume_params )
      render json: { :resume => @resume }, status: :created
    else
      render json: { :error => "Unable to create resume" }, status: :bad_request
    end
  end

  def index
    @resumes = set_resumes
    render json: { :resumes => @resumes }, status: :ok
  end

  def show
    @resume = set_resume
    render json: { :resume => @resume }, status: :ok
  end

  def destroy
    @resume = set_resume
    if @resume.destroy
      render json: { :message => "resume deleted" }, status: :ok
    else
      render json: { :error => "unable to delete resume" }, status: :bad_request
    end
  end

  private

  def set_resumes
    @resumes = Resume.find(:user_id => current_user.id)
  end

  def set_resume
    @resume = Resume.find(:id => params[:rid])
  end

  def resume_params
    params.require(resume).permit(:name, :age, :location, :jobtitle, :experience, :education, :date)
  end
end

# t.string :name
# t.string :age
# t.string :location
# t.string :jobtitle
# t.string :experience
# t.string :education
# t.string :date
