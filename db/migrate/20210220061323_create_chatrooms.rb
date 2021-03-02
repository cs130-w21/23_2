# frozen_string_literal: true

# This class adds chatrooms to the database.

class CreateChatrooms < ActiveRecord::Migration[5.0]
  # Add a new chatroom to the database with the specified title, details, city, and target demographics.
  def change
    create_table :chatrooms do |t|
      t.string :title
      t.text :details
      t.string :gender
      t.string :collegestudent
      t.integer :minimumage
      t.integer :maximumage
      t.boolean :visible, default: true
      t.timestamps
      t.string :city
    end
  end
end
