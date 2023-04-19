class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
    if user_signed_in?
      if @room.user.id == current_user.id
        @diviner = @room.diviner
      else
        redirect_to "/"
      end
    elsif diviner_signed_in?
      if @room.user.id == current_diviner.id
        @user = @room.user
      else
        redirect_to "/"
      end
    else
      redirect_to "/"
    end
  end

  def create
    if user_signed_in?
      @room = Room.new(room_diviner_params)
      @room.user_id = current_user.id
    elsif diviner_signed_in?
      @room = Room.new(room_user_params)
      @room.diviner_id = current_diviner.id
    else
      redirect_to "/"
    end

    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to "/"
    end
  end

  private
  def room_diviner_params
    params.require(:room).permit(:diviner_id)
  end

  def room_user_params
    params.require(:room).permit(:user_id)
  end
end
