class Reservation < ApplicationRecord
    belongs_to :room, optional: true

    validates :room_id, {presence: true}
    validates :start_date, {presence: true}
    validates :end_date, {presence: true}
    validates :people, {presence: true}
    validates :user_id, {presence: true}

    validate :end_date_check
    def end_date_check
        unless start_date.nil?  || end_date.nil?  || self.start_date < self.end_date then
            errors.add(:base, "チェックアウトはチェックイン以降の日付を選択してください")
        end
    end

    validate :start_date_check
    def start_date_check
        unless Date.today < self.start_date then
            errors.add(:base, "チェックイン日を本日以降の日付にしてください")
        end
    end

    validate :people_check
    def people_check
        unless 0 < self.people then
            errors.add(:base, "一人以上にしてください")
        end
    end

end
