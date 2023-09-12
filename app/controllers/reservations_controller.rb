class ReservationsController < ApplicationController
    protect_from_forgery :except => [:destroy]
    
    def index
        @reservations = Reservation.all
    end

    def new
        @reservation = Reservation.new
    end

    def confirm
        @room = Room.find(params[:room_id])
        @reservation = Reservation.new(
            room_id: params[:room_id], #ルームID
            start_date: params[:start_date], #チェックイン
            end_date: params[:end_date], #チェックアウト
            people: params[:people], #人数
            user_id: @login_user.id #ユーザーID
        )
        if @reservation.valid?
            @days = (@reservation.end_date - @reservation.start_date).to_i #日数
            @reservation.total_price = @reservation.people * @days * @room.price #合計金額
        else
            render template:"rooms/show"
        end
    end

    def create
        @reservation = Reservation.new(
            start_date: params[:reservation][:start_date], #チェックイン
            end_date: params[:reservation][:end_date], #チェックアウト
            people: params[:reservation][:people], #人数
            user_id: @login_user.id, #ユーザーID
            room_id: params[:reservation][:room_id], #ルームID
            total_price: params[:reservation][:total_price] #合計金額
        )
        # binding.pry
        if 
        @reservation.save
            session[:reservation_id] = @reservation.id
            flash[:notice] = "施設の予約が完了しました。"
            redirect_to reservations_path
        else
            redirect_back fallback_location: "rooms#index"
        end
    end

    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
        flash[:notice] = "ユーザーを削除しました"
        redirect_to reservations_path
    end
    
end
