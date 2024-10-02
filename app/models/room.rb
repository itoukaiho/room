class Room < ApplicationRecord

  mount_uploader :room_image, RoomImageUploader

  belongs_to :user
  has_many :reservations

    validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    validates :room_name, presence: true
    validates :introduce, presence: true
    validates :address, presence: true
    


    def self.search(search)
      return Room.all unless search
      Room.where(['room_name LIKE ?', "%#{search}%"]).or Room.where(['introduce LIKE ?', "%#{search}%"])
    end

    def self.area(area)
      return Room.all unless area
  Room.where(['address LIKE ?', "%#{area}%"])
 
    end

end
