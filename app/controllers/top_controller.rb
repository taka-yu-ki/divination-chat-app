class TopController < ApplicationController
  def index
    if user_signed_in?
      @diviners = Diviner.all
      rooms = current_user.rooms
      @diviner_ids = []
      rooms.each do |r|
        @diviner_ids << r.diviner_id
      end
    elsif diviner_signed_in?
      @users = User.all
      rooms = current_diviner.rooms
      @user_ids = []
      rooms.each do |r|
        @user_ids << r.user_id
      end
    end
  end
end
