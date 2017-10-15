class EntryController < ApplicationController

  def new
    @free_form = FreeForm.new
    @entry = Entry.new(free_form: @free_form.text.count.times.map { FreeForm.new })
  end

  def confirm
    @free_form = FreeForm.new
    @entry = Entry.new(entry_params)
    # raise
    if @entry.valid?
      render :confirm and return
    else
      render :new and return
    end
  end

  def finish
    @entry = Entry.new(entry_params)
    @entry.save
  end

  private
    # Strong Parameters
    def entry_params
      params.require(:entry).permit(:name, :name_katakana, :tel, :email, free_form_attributes: [:free_texts])
    end
end
