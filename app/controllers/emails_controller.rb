class EmailsController < ApplicationController
  def create
    @email = Email.new 
    if @email.save
      cookies[:save_email] = true
    redirect_to root_path
  else
    redirect_to root_path alert: "Unable to save"
 end
end

private
  def lead_params
   params.require(:email).permit(:email)
  end
end
