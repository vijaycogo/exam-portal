class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.references :college, null: false, foreign_key: true
      t.string :exam_name

      t.timestamps
    end
  end
end
