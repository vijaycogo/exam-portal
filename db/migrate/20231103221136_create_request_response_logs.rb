class CreateRequestResponseLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :request_response_logs do |t|
      t.text :request_params
      t.text :response
      t.datetime :request_time
      t.integer :status_code

      t.timestamps
    end
  end
end
# we use text type instead of jsonb beacuse i am using Sqlite