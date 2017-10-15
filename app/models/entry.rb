class Entry
  include ActiveModel::Model

  attr_accessor :name, :name_katakana, :tel, :email, :free_form
  # コーリバックさせたいアクションを指定
  define_model_callbacks :save
  before_save { self.valid? }

  validates :name, presence: true, length: { maximum: 20 }
  VALID_KATAKANA_REGEX = /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/
  validates :name_katakana, presence: true,
                            format: { with: VALID_KATAKANA_REGEX },
                            length: { maximum: 20 }
  validates :tel, presence: true, numericality: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validate  :free_form_validation

   def free_form_validation
     free_form.each do |form|
       if form.free_texts.length > 100
         errors.add(:free_form, "コメントは100文字以内で入力して下さい。")
       end
     end
   end

  def free_form_attributes=(attributes)
    @free_form ||= []
    attributes.each do |_, params|
      @free_form.push(FreeForm.new(params))
    end
  end

  def save
    run_callbacks :save do
    end
  end

end
