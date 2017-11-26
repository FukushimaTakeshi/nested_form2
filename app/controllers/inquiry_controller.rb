class InquiryController < ApplicationController

  def new
    @free_form = FreeForm.all
    @inquiry = Inquiry.new(answers: Array.new(@free_form.count).map { Answer.new })
  end

  def confirm
    @free_form = FreeForm.all
    @inquiry = Inquiry.new(inquiry_params)
    render :new unless @inquiry.valid?
  end

  def finish
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.save!
  end

  private
  # Strong Parameters
  def inquiry_params
    params.require(:inquiry).permit(:name, :name_katakana, :tel, :email, answers_attributes: [:value, :value2])
  end
end
