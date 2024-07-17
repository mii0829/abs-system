class User < ApplicationRecord
    validates :name, presence: true
    validates :user_id, presence: true

    has_many :reserves, class_name: 'Reserve', dependent: :destroy
end
  