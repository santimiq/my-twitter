class UsersController < Clearance::UsersController
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
  end
    private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
