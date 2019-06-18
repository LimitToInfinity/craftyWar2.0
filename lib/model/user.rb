class User < ActiveRecord::Base
    has_many :characters
    has_many :character_classes, through: :characters
    has_many :races, through: :characters
    has_many :professions, through: :characters
    validates :name, uniqueness: true
end