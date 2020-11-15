class UserNotifierMailer < ApplicationMailer

  def send_signup_email(user)
    mail( to: @user.email,subject: 'Thanks for signing up for our amazing app' )
  end

  def create
    # Create the user from params
    @user = User.new(user_params)
    if @user.save
      # Deliver the signup email
      UserNotifierMailer.send_signup_email(@user).deliver
      redirect_to(@user, :notice => 'User created')
    else
      render :action => 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :login)
  end
end
Alright, now we're cooking! Let's get it all going through SendGrid.

Conf

end
