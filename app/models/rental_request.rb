class RentalRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  default_scope { order({start_date: :desc})} #this will sort(descending) all the requests by their start date


  validate :start_date_before_end_date

  def start_date_before_end_date
    errors.add(:start_date, "cannot precede end date") if end_date && end_date < start_date
  end

  def approve!
   RentalRequest.transaction do
     self.status = "APPROVED"
     self.save!
   end
  end

  def deny!
    RentalRequest.transaction do
      self.status = "DENIED"
      self.save!
    end
  end







end



#
# def approve!
#     if overlapping_approved_requests.empty?
#       CatRentalRequest.transaction do
#         self.status = "APPROVED"
#         self.save!
#         overlapping_pending_requests.each do |request|
#           request.deny!
#         end
#       end
#     else
#       return false
#     end
#   end
#
#   def deny!
#     if self.status == "PENDING"
#       self.status = "DENIED"
#       self.save!
#     end
#   end
#
#   def overlapping_requests
#     CatRentalRequest.where(<<-SQL, self.start_date, self.end_date, self.start_date, self.end_date)
#     ((start_date BETWEEN ? AND ?) OR
#     (end_date BETWEEN ? AND ?))
#     SQL
#   end
#
#   def overlapping_approved_requests
#     if self.id.nil?
#       self.overlapping_requests.where("status = 'APPROVED' AND id IS NOT NULL")
#     else
#       self.overlapping_requests.where("status = 'APPROVED' AND id  <> ?", self.id)
#     end
#   end
#
#   def overlapping_pending_requests
#     if self.id.nil?
#       self.overlapping_requests.where("status = 'PENDING' AND id IS NOT NULL")
#     else
#       self.overlapping_requests.where("status = 'PENDING' AND id  <> ?", self.id)
#     end
#   end
#
#   private
#   def no_overlapping_approved_requests
#     unless self.overlapping_approved_requests.empty? || self.status == 'DENIED' || self.status == 'PENDING'
#       errors[:base] << "Dates can't overlap with other requests"
#     end
#   end
# end
#
#
#






#
#   def approve!
#       CatRentalRequest.transaction do
#         overlapping_requests.where(status: 'PENDING').update_all(status: "DENIED")
#         update! status: 'APPROVED'
#       end
#     end
#
#     def deny!
#       update! status: 'DENIED'
#     end
#
#     def pending?
#       status == 'PENDING'
#     end
#
#     private
#
#     def overlapping_requests
#       CatRentalRequest
#         .where(cat_id: cat_id)
#         .where('start_date BETWEEN :start_date AND :end_date OR
#                 end_date BETWEEN :start_date AND :end_date OR
#                 :start_date BETWEEN start_date AND end_date OR
#                 :end_date BETWEEN start_date AND end_date',
#                 { start_date: start_date, end_date: end_date } )
#         .where.not(id: id)
#     end
#
#     def overlapping_approved_requests
#       overlapping_requests.where(status: 'APPROVED')
#     end
#
#     def doesnt_overlap_existing_approved_request
#       errors.add(:requests, "cannot overlap") if overlapping_approved_requests.any?
#     end
#
#     def start_date_before_end_date
#       errors.add(:start_date, "cannot precede end date") if end_date &&
#                                                             end_date < start_date
#     end
#
#     def set_status
#       self.status ||= "PENDING"
#     end
#
