class Users::SessionsController < Devise::SessionsController
  layout 'sessions'
  prepend_before_action :hack_devise

  def new
  end

  def create
    self.resource = warden.authenticate(auth_options)
    p '================================'
    p   self.resource
    p '================================'
    if resource.present?
      sign_in(resource_name, resource)
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      render :new, locals: {message: t("devise.failure.user.#{warden.message}")}
    end
  end

  def after_sign_in_path_for(resource)
    stored_location = stored_location_for(resource)
    (stored_location.blank? || stored_location == '/') ? root_path : stored_location
  end

  protected
  def auth_options
    {scope: resource_name, recall: root_path}
  end


  private
  def hack_devise
    request.env['devise.mapping'] = Devise.mappings[:user]
  end
end
