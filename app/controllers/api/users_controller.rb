class Api::UsersController < ApiController
  skip_before_action :authenticate_user!, only: [:create, :export_csv, :export_pdf]
  skip_after_action :update_auth_header, only: [:export_csv, :export_pdf]

  def index
    @users = User.all
  end

  def create
    @user = UserService::CreateUser.new(user_params).call
    if @user
      @user
    else
      render json: {
        error: @user.errors,
        message: 'Creating user failed.'
      }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @user
    else
      render json: {
        error: @user.errors,
        message: 'Updating user failed.'
      }, status: :unprocessable_entity
    end
  end

  def export_csv
    @users = User.all
    render "export_csv.csv.rb"
  end

  def export_pdf
    @user = User.first
    render "export_pdf.pdf.prawn"
  end

  private

  def user_params
    params.require(:user)
    .permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
