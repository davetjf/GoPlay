# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  before_action :find_conversation

  def index
    if current_user.blocked == true
      redirect_to '/contacts/new'
      flash[:notice] = "You have been blocked! Please contact the admin if you think this is an error"
    else
    @messages = @conversation.messages
    

    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    @message = @conversation.messages.new
  end
  end

  def create
    
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  def new
    if current_user.blocked == true
      redirect_to '/contacts/new'
      flash[:notice] = "You have been blocked! Please contact the admin if you think this is an error"
    else    
    @message = @conversation.messages.new
  end
  end



  private

    def message_params
      params.require(:message).permit(:body, :user_id)
    end

    def find_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end
end