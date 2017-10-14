class Entry
  include ActiveModel::Model

  attr_accessor :name, :tel, :email, :free_texts
  # コーリバックさせたいアクションを指定
  define_model_callbacks :save
  before_save {
    # raise
    self.valid? }

  validates :name, presence: true, length: { maximum: 50 }
  validates :tel, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :free_texts, length: { maximum: 100 }

  # def question(param = {})
  #   ['a', 'b', 'c']
  # end


  def save
    run_callbacks :save do
      # raise
    end
  end

end
