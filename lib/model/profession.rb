class Profession < ActiveRecord::Base
    has_many :character_classes, through: :characters
    has_many :races, through: :characters
    has_many :users, through: :characters
    has_many :characters
end