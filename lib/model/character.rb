class Character < ActiveRecord::Base
    belongs_to :character_classes
    belongs_to :professions
    belongs_to :races
    belongs_to :users
end