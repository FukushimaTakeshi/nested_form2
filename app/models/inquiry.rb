class Inquiry
  include ActiveModel::Model

  attr_accessor :name, :name_katakana, :tel, :email

  validates :name, presence: true, length: { maximum: 20 }
  validates :tel, presence: true, numericality: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  def initialize(free_form, params={})
    define_free_text_method(free_form)
    super(params)
  end

  def save!
  end

  private

  def define_free_text_method(free_form)
    free_form.each_with_index do |value, index|
      class_eval do
        attr_accessor :"free_text_#{index}"
        validates :"free_text_#{index}", length: { maximum: 100 }
      end
      # I18n ja.ymlのattributesにfree_formの数に応じた項目を定義(ex. free_text_0: '備考1')
      I18n.backend.store_translations :ja, activemodel: {
        attributes: { 'inquiry': { "free_text_#{index}": value[:remark] } }
      }
    end
  end
end
