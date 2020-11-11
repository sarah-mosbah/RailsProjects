
class Cat < ApplicationRecord
    require 'date'
    COLORS=%w(black white grey).freeze
    validates :color, inclusion: COLORS
    validates :sex, inclusion: %w(M F)
    validates :birth_date, :color, :name, :sex, presence: true

    def age
        time=Time.now.utc.to_date
        # puts time
        time.year- self.birth_date.year
    end

      has_many :cat_rental_requests
end