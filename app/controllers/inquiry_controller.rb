class InquiryController < ApplicationController

  def new
    @free_form = FreeForm.all
    @inquiry = Inquiry.new(inquiry_details: Array.new(@free_form.count).map { InquiryDetail.new })
  end

  def confirm
    @free_form = FreeForm.all
    @inquiry = Inquiry.new(inquiry_params)
    render :new unless @inquiry.valid?
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.save
  end

  private
  # Strong Parameters
  def inquiry_params
    params
      .require(:inquiry)
      .permit(
        :name,
        :tel,
        :email,
        inquiry_details_attributes: [
          :detail,
          :detail2,
          :detail3,
          :detail4,
          :detail5
        ]
      )
  end
end
