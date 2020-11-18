# frozen_string_literal: true

class ConversationsController < ApplicationController
  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]

  # GET /listings
  def index
    # Below will display all conversations a user has had while ordering it based on their inner messages
    @conversations = Conversation.participating(current_user).includes(:personal_messages).order("personal_messages.created_at DESC")
  end

  # GET /listings/1
  def show
    # displays conversation with specific user with input at bottom
    @personal_message = PersonalMessage.new
  end

  # GET /listings/new
  def new
    # starts a new conversation OR if one exits adds to it
    redirect_to conversation_path(@conversation) and return if @conversation
    @personal_message = current_user.personal_messages.build
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  def check_participating!
    # checks for conversation containing 2 particpants
    redirect_to conversations_path unless @conversation&.participates?(current_user)
  end
end
