class CharacterClass < ActiveRecord::Base
    has_many :professions, through: :characters
    has_many :races, through: :characters
    has_many :users, through: :characters
    has_many :characters
end