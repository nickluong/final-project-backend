class Session < ApplicationRecord
    has_many :user_sessions 
    has_many :users, through: :user_sessions
end
