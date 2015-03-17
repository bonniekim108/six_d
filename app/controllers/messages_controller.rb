class MessagesController < ApplicationController
  def index
    @messages = current_user.messages
  end
  def new
    @message = Message.new
  end
  def create
    @message = Message.new(params.require(:message).permit(:sender, :user_id, :subject, :body, :senderid))
    @message.sender = current_user.first_name
    if @message.save 
      redirect_to user_path(@message.user_id)
    else
      render :new
    end
  end
   def destroy
      Message.find(params[:param1]).destroy
      redirect_to messages_path 
    end
end
