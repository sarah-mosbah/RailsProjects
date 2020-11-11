class CatRentalRequest < ApplicationRecord

    validates :start_date, :end_date, presence: true
    validates :status, presence: true, inclusion: %w(Pending Approved Denied).freeze
    validate :does_not_overlap_approved_request
    validate :start_must_come_before_end
    belongs_to :cat,  dependent: :destroy


    def overlapping_requests

        CatRentalRequest.where.not(id: self.id).where(cat_id: cat_id)
        .where.not('start_date > :end_date OR end_date < :start_date',
        start_date: start_date, end_date: end_date)
        
    end

    def overlapping_approved_requests
        req= self.overlapping_requests
        req.where(status:"Approved")
    end
    

    def does_not_overlap_approved_request
    
        unless overlapping_approved_requests.empty?
          errors[:base] <<
            'Request conflicts with existing approved request'
        end
    end
    def start_must_come_before_end
        return if start_date < end_date
        errors[:start_date] << 'must come before end date'
        errors[:end_date] << 'must come after start date'
      end
 
end