class EntryController < ApplicationController

  def new
    @free_form = FreeForm.new
    @entry = Entry.new(answer: @free_form.text.size.times.map { Answer.new })
  end

  def confirm
    @free_form = FreeForm.new
    @entry = Entry.new(entry_params)
    render :new unless @entry.valid?
  end

  def finish
    @entry = Entry.new(entry_params)
    @entry.save
  end

  private
    # Strong Parameters
    def entry_params
      params.require(:entry).permit(:name, :name_katakana, :tel, :email, answer_attributes: [:value ])
    end
end
