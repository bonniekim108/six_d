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
   def destroy
      Message.find(params[:param1]).destroy
      redirect_to user_path(params[:param2]) 
    end
end
