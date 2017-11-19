class CreateFreeForms < ActiveRecord::Migration[5.1]
  def change
    create_table :free_forms do |t|
      t.string :remark

      t.timestamps
    end
  end
end
