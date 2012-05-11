class AccountController < ApplicationController
  def index
  end
 
  def registration
    if request.post? and params[:user]
      @user = User.new(params[:user])
 
      if @user.save
        flash[:notice] = "User created successfully."
        redirect_to :action => "index"
      end
    end
  end
  def admin
end
 
def login
  if request.post? and params[:user]
    @user = User.new(params[:user])
 
    user = User.find_by_username(@user.username)
 
    # If we found a user with that username and the password provided matches
    # the password on file for that user, we can login the user.
    if user and user.password_matches?(@user.password)
      session[:user_id] = user.id
      user.last_login = Time.now
      user.save
 
      if user.admin?
        redirect_to :action => &quot;admin&quot;
      else
        redirect_to :action => &quot;index&quot;
      end
    else
      flash[:notice] = &quot;Oops, no user was found with that username/password combination.&quot;
    end
  end
end
end