class ReservesController < ApplicationController
  def index
    @reserves = Reserve.all
  end

  def new
    @reserve = Reserve.new
  end

  def confirm
    @room = Room.find(params[:room_id])
    @reserve = Reserve.new(
      room_id: params[:room_id], #ルームID
      start_date: params[:start_date], #チェックイン
      end_date: params[:end_date], #チェックアウト
      people: params[:people], #人数
      user_id: @login_user.id #ユーザーID
    )
    if @reserve.valid?
      @days = (@reserve.end_date - @reserve.start_date).to_i #日数
      @reserve.total_price = @reserve.people * @days * @room.price #合計金額
      else
        render template:"rooms/show"
    end
  end

  def create
    @reserve = Reserve.new(
      start_date: params[:start_date], #チェックイン
      end_date: params[:end_date], #チェックアウト
      people: params[:people], #人数
      user_id: @login_user.id, #ユーザーID
      total_price: params[:total_price] #合計金額
    )
    # binding.pry
    if 
      @reserve.save
      session[:reserve_id] = @reserve.id
      flash[:notice] = "施設の予約が完了しました。"
      redirect_to reserves_path, as: :index
    else
      redirect_back fallback_location: "rooms#index"
    end
  end

  # def show
  #   redirect_to reserves_path, as: :index
  # end

end
