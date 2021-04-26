class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = Message.new(comment_params)
      @message.save
      redirect_to root_path
  end

  private

  def comment_params
    params.require(:message).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  

end
