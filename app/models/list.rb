class List < ApplicationRecord
    has_many :reserves, class_name: 'Reserve', dependent: :destroy
    belongs_to :tag
end
