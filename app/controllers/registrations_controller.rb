class RegistrationsController < Devise::RegistrationsController
 
  def create
    resource = User.new 
    resource.email = params[:user][:email]
    resource.password = params[:user][:password]
    resource.password_confirmation = params[:user][:password_confirmation]
    resource.add_role  params[:user][:role].to_sym
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        return render :json => {:success => true}
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        return render :json => {:success => true}
      end
    else
      clean_up_passwords resource
      return render :json => {:success => false}
    end
  end
 
  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  def after_sign_up_path_for(resource)
    root_path # Or :prefix_to_your_route
  end
 
end