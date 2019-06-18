class Race < ActiveRecord::Base
    has_many :character_classes, through: :characters
    has_many :professions, through: :characters
    has_many :users, through: :characters
    has_many :characters
end