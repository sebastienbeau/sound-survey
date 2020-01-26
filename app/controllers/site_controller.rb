class SiteController < ApplicationController
  def index
  end

  def example1
  end

  def example2
  end

  def example3
  end

  def example4
  end

  def logout
    reset_session
    redirect_to :controller => 'site', :action => 'index'
  end

  def finish
  end

  def update_user
    user = User.find(user_id)
    user.update(
        age: new_params[:age],
        gender: new_params[:gender],
    )
    reset_session
    redirect_to :controller => 'site', :action => 'thanks'
  end

  def thanks
  end

  private

  def new_params
    @new_params ||= params.permit(:age, :gender)
  end

end
