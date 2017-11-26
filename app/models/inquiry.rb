class Inquiry
  include ActiveModel::Model

  attr_accessor :name, :name_katakana, :tel, :email, :answers

  validates :name, presence: true, length: { maximum: 20 }
  validates :tel, presence: true, numericality: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  def valid?
    @answers.each { |v| v.valid? }
    super
  end

  def save!
  end

  def answers_attributes=(attributes)
    @answers = attributes.map { |_k, v| Answer.new(v) }
  end
end
