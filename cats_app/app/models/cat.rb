require "action_view"

class Cat < ApplicationRecord
include ActionView::Helpers::DateHelper
    validates :sex, presence: true, inclusion: {in: %w(M F)}
    validates :color, presence: true 
    validates :name, presence: true 
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        if birth_date > Date.today
            errors.add(:birth_date, "birthdate cannot be in the future")
        end
    end

    def age
        birth_time = birth_date.to_time
        return time_ago_in_words(birth_time)
    end


end
