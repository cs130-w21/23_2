# frozen_string_literal: true

# This class adds user profiles to the database.

class CreateProfiles < ActiveRecord::Migration[5.0]
  # Add a new profile in the database with the specified avatar, ID, name, age, gender, city, college email, and gender.
  def change
    create_table :profiles do |t|
      t.attachment :avatar
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.string :city
      t.string :collegeemail
      t.string :genderpreference, default: 'Does Not Matter'
      t.integer :minimumage, default: 13
      t.integer :maximumage, default: 100
      t.string :collegepreference, default: 'Does Not Matter'
      t.string :search, default: ''
      t.timestamps
    end
  end
end
