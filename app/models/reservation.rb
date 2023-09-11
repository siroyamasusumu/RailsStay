class Reservation < ApplicationRecord
    belongs_to :room, optional: true

    validates :room_id, {presence: true}
    validates :start_date, {presence: true}
    validates :end_date, {presence: true}
    validates :people, {presence: true}
    validates :user_id, {presence: true}

    # validate :end_date_check
    # def end_date_check
    #     unless self.start_date < self.end_date then
    #         errors.add(:base, "(チェックアウト)はチェックイン以降の日付を選択してください")
    #     end
    # end
end
