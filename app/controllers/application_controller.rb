class ApplicationController < ActionController::Base

  def after_sign_in_path_for (resource)
    appointments_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, notice: exception.message }
    end
  end

end
