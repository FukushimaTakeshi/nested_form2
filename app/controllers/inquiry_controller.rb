class InquiryController < ApplicationController

  def new
    @free_form = FreeForm.all
    @inquiry = Inquiry.new(@free_form)
  end

  def confirm
    @free_form = FreeForm.all
    @inquiry = Inquiry.new(@free_form, inquiry_params(@free_form.count))
    render :new unless @inquiry.valid?
  end

  def finish
    @free_form = FreeForm.all
    @inquiry = Inquiry.new(@free_form, inquiry_params(@free_form.count))
    @inquiry.save!
  end

  private

  # Strong Parameters
  def inquiry_params(count)
    free_texts_params = count.times.map { |index| "free_text_#{index}".to_sym }
    params.require(:inquiry).permit([:name, :tel, :email] << free_texts_params)
  end
end
