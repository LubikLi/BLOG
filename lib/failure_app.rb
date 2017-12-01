class FailureApp < Devise::FailureApp
  def store_location!
    if request.get?
      super
    else
      store_location_for(scope, URI(request.referer).path)
    end
  end

  def skip_format?
    true
  end

  def redirect_as_js
    store_location!
    self.status = 401
    self.headers["WWW-Authenticate"] = %(Basic realm=#{Devise.http_authentication_realm.inspect}) if http_auth_header?
    self.content_type = request.format.to_s
    renderer = ApplicationController.renderer.new
    self.response_body = renderer.render(file: 'shared/need_login.js.erb', locals: {redirect_url: redirect_url})
  end

  def respond
    if http_auth?
      redirect_as_js
    else
      redirect
    end
  end
end
