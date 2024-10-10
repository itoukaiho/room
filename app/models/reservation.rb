class Reservation < ApplicationRecord

belongs_to:room
belongs_to:user


validates :people, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}

validates :start_date, presence: true
validates :end_date, presence:true

validate :start_end_check
validate :date_before_start

def start_end_check
return if start_date.blank? || end_date.blank?
if self.start_date >= self.end_date
errors.add(:end_date, "は開始日以降の日付で選択してください") 
  

end
end


def date_before_start
return if start_date.blank?
errors.add(:start_date, "は今日以降のものを選択してください") if start_date < Date.today
end

def total_date
end_date-start_date
end

def total_price
total_date*room.price*people
end

end
