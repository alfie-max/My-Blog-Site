class OmniauthController < Devise::OmniauthCallbacksController
  def twitter
    auth = request.env["omniauth.auth"]
    # raise auth.to_yaml
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || create(auth)
    session[:user_id] = user.id
    sign_in user
    redirect_to root_url, :notice => "Signed in!"
  end

  def stackexchange
    auth = request.env["omniauth.auth"]
    # raise auth.to_yaml
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || create(auth)
    session[:user_id] = user.id
    sign_in user
    redirect_to root_url, :notice => "Signed in!"
  end

  def github
    auth = request.env["omniauth.auth"]
    raise auth.to_yaml
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || create(auth)
    session[:user_id] = user.id
    sign_in user
    redirect_to root_url, :notice => "Signed in!"
  end

  private

  def create(auth)
    password = Devise.friendly_token.first(8)
    email = "example" + User.last.id.to_s + "@domain.com"
    User.create!(email: email, password: password, name: auth.info.name,
                  uid: auth.uid, provider: auth.provider)
  end
end
