# frozen_string_literal: true

# This class adds requests to the database.

class CreateRequests < ActiveRecord::Migration[5.0]
  # Add a request to the database with the specified user and chatroom to request to join.
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :chatroom_id
      t.timestamps
    end
  end
end
