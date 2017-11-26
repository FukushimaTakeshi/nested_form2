class Answer
  include ActiveModel::Model
  attr_accessor :value, :value2
  validates :value, length: { maximum: 5 }
  validates :value2, length: { maximum: 5 }
end
