class EntryController < ApplicationController

  def new
    @free_form = FreeForm.new
    @entry = Entry.new
    @entry.free_texts = Array.new(@free_form.free_texts.count)
    # raise
  end

  def confirm
    @free_form = FreeForm.new
    @entry = Entry.new(entry_params)
    raise
    if @entry.valid?
      render :confirm and return
    else
      render :new and return
    end
  end

  def finish
    @entry = Entry.new(entry_params)
  end

  private
    # Strong Parameters
    def entry_params
      params.require(:entry).permit(:name, :tel, :email).merge!(params.permit(free_texts: []))
    end

    # strong parameters
    def submit_params
      permit_attrs = []
      @free_form.free_texts.each do |item|
        permit_attrs.push("#{item}".to_sym)
      end
      params.require(:other_user).permit(permit_attrs)
    end
end
