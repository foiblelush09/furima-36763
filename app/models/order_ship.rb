class OrderShip
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postalcode, :prefecture_id, :city, :address, :building_name, :phonenumber

  with_options presence: true do
    validates :postalcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, :address, :user_id, :item_id
    validates :phonenumber, format: {with: /\A[0-9]+\z/, message: "input only number"}
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Ship.create(postalcode: postalcode, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phonenumber: phonenumber)
  end
end