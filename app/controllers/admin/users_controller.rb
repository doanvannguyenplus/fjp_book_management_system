class Admin
  class UsersController < AdminController
    skip_before_action  :verify_authenticity_token
    before_action :find_user, only: [:update, :destroy]

    def index
      @data = Supports::AdminUsers.new users: User.all, param: params
      @user = User.new
    end

    def create
      user = User.new user_params
      user.password = "framgiajapan"
      user.password_confirmation = "framgiajapan"
      if user.save
        flash[:success] = t "admin.users.create.success"
      else
        flash[:danger] = t "admin.users.create.something_wrong"
      end
    end

    def update
      if @user.update_attributes user_params
        flash[:success] = t "admin.users.update.success"
      else
        flash[:danger] = t "admin.users.update.something_wrong"
      end
    end

    def destroy
      if @user != current_user && @user.destroy
        flash[:success] = t "admin.users.destroy.success"
      else
        flash[:danger] = t "admin.users.destroy.something_wrong"
      end
    end

    private
    def find_user
      @user = User.find_by id: params[:id]

      return if @user
      flash[:danger] = t "admin.not_exist"
    end

    def user_params
      params.require(:user).permit :id, :email, :role, :staff_code, :name
    end
  end
end
