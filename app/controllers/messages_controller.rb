class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params.require(:message).permit(:sender, :user_id, :subject, :body, :senderid))
    if @message.save 
      redirect_to user_path(@message.user_id)
    else
      render :new
    end
  end
end
