class Race < ActiveRecord::Base
    has_many :characters
    has_many :users, through: :characters
end