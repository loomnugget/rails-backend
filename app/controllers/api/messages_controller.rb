class Api::MessagesController < ApiController
  before_action :find_message, only: [:update, :destroy]

  def index
    if params[:user_id].present?
      user = User.find(params[:user_id])
      @messages = user.messages
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save!
      @message
    else
      render json: { error: @message.errors, message: 'Creating message failed.' }, status: :unprocessable_entity
    end
  end

  def update
    if @message.update(message_params)
      @message
    else
      render json: { error: @message.errors, message: 'Updating message failed.' }, status: :unprocessable_entity
    end
  end

  def destroy
    if @message.destroy!
      @message
    else
      render json: { error: @message.errors, message: 'Deleting message failed.' }, status: :unprocessable_entity
    end
  end


  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end

  def find_message
    @message = Message.find(params[:id])
  end

end
