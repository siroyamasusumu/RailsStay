class RoomsController < ApplicationController
protect_from_forgery :except => [:destroy]
before_action :set_q, only: [:index, :search]

  def index
    @rooms = Room.all
    @rooms = Room.where(user_id: @login_user.id)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(
      name_room: params[:name_room],
      detail: params[:detail],
      price: params[:price],
      address: params[:address],
      image_room: params[:image_room],
      user_id: @login_user.id
    )
    if @room.save
      session[:room_id] = @room.id
      flash[:notice] = "施設登録が完了しました"
      redirect_to("/rooms/#{@room.id}")
    else
      render("rooms/new")
    end
  end

  def show
    @room = Room.find(params[:id])
    @reserve = Reserve.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.name_room = params[:name_room]
    @room.detail = params[:detail]
    @room.price = params[:price]
    @room.address = params[:address]
    @room.image_room = params[:image_room]
    @room.user_id = @login_user.id
    if @room.save
      flash[:notice] = "施設情報を編集しました"
      redirect_to("/rooms/#{@room.id}")
    else
      render("rooms/edit")
    end
  end

  def destroy
    @room = Room.find_by(id: params[:id])
    @room.destroy
    flash[:notice] = "施設情報を削除しました"
    redirect_to("/rooms/index")
  end

  def search
    @results = @q.result
  end

  def set_q
    @q = Room.ransack(params[:q])
  end

end
