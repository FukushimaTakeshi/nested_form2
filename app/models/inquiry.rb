class Inquiry
  include ActiveModel::Model

  attr_accessor :name, :name_katakana, :tel, :email, :inquiry_details

  validates :name, presence: true, length: { maximum: 20 }
  validates :tel, presence: true, numericality: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  def valid?
    valid_inquiry_details = @inquiry_details.map { |v| v.valid? }.all?
    super && valid_inquiry_details
  end

  def save
  end

  def inquiry_details_attributes=(attributes)
    @inquiry_details = attributes.map { |_k, v| InquiryDetail.new(v) }
  end
end
