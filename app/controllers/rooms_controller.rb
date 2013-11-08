class RoomsController < ApplicationController

  # before_filter :require_authentication, :only => [:new, :edit, :create. :update, :destroy]
  
  def index 
    # Ordenar dos mais recentes aos mais antigos
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = current_user.rooms.build
  end

  def edit
    @room = current_user.rooms.find(params[:id])
  end

  def create
    @room = current_user.rooms.build(params[:room])
      if @room.save
        redirect_to @room, notice: t('flash.notice.room_created')
      else
        render action: "new"
      end
  end

  def update
    @room = current_user.rooms.find(params[:id])
      if @room.update_attributes(params[:room])
        redirect_to @room, notice: t('flash.notice.room_update')
      else
        render action: "edit"
      end
  end

  def destroy
    @room = current_user.rooms.find(params[:id])
    @room.destroy
      redirect_to rooms_url
  end
end
