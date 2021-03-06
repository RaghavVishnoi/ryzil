class Admin::SessionsController < Devise::SessionsController

  before_action :authenticate_admin!,except: [:new,:create]
  after_action :allow_iframe_requests
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private
    def allow_iframe_requests
      response.headers.delete('X-Frame-Options')
    end
end
