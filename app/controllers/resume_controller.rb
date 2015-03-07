class ResumeController < ApplicationController

  def create
    @resume = User.create( params[:resume] )
  end

end
