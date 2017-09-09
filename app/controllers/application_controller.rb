class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  respond_to :html, :json
  
  private

  def after_sign_in_path_for(resource)
	  rails_admin_path
  end

  def after_sign_out_path_for(resource_or_scope)
      new_admin_session_path
  end


  def render_errors(errors)
    render json: { errors: errors }, status: 422
  end

protected
  def authenticate_admin!
    if admin_signed_in?
      super
    else
      redirect_to new_session_path, :notice => 'Please login first!'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

end
