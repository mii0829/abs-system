class List < ApplicationRecord
    has_many :reserves, class_name: 'Reserve', dependent: :destroy
end
