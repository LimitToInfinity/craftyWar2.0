class Character < ActiveRecord::Base
    belongs_to :character_class
    belongs_to :profession
    belongs_to :race
    belongs_to :user
end