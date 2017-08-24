class Admin::UsersController < AdminController

  def index
    @q = User.ransack(params[:q])
    @users = @q.result.includes(:groups).all  # NOTE association group is used in users/index page, so there is includes(:groups) 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render "edit"
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :group_ids => [])
  end

end
