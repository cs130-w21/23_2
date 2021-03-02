# frozen_string_literal: true

# This class adds messages to the database.

class CreateMessages < ActiveRecord::Migration[5.0]
  # Add a message to the database with the specified chatroom, user, and body.
  def change
    create_table :messages do |t|
      t.references :chatroom, foreign_key: true
      t.references :user, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
