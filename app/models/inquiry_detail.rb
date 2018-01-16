class InquiryDetail
  include ActiveModel::Model
  attr_accessor :detail, :detail2, :detail3, :detail4, :detail5
  validates :detail, length: { maximum: 5 }
  validates :detail2, length: { maximum: 5 }
  validates :detail3, length: { maximum: 5 }
  validates :detail4, length: { maximum: 5 }
  validates :detail5, length: { maximum: 5 }
end
