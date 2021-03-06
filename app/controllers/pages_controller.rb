# frozen_string_literal: true

# This class renders the homepage of the current user.

class PagesController < ApplicationController
  # Find and display all chatrooms where the current user is a member.
  def home
    @user = User.find(current_user.id)
    if current_user.profile
      @chatrooms = Chatroom.all

      @results = []
      @chatrooms.each do |x|
        if !current_user.profile.search.blank? && !((x.title.downcase.include? current_user.profile.search.downcase) || (x.details.downcase.include? current_user.profile.search.downcase))
          next
        end
        next if x.chatroom_users.count == 0

        @member = x.chatroom_users.where(admin: true).first
        @adminuser = User.find(@member.user_id)
        next if x.city != current_user.profile.city
        next if x.minimumage > current_user.profile.age || x.maximumage < current_user.profile.age

        if current_user.profile.minimumage > x.minimumage || current_user.profile.maximumage < x.maximumage
          max = 0
          min = 100
          x.chatroom_users.each do |y|
            @temporary = User.find(y.user_id)
            min = @temporary.profile.age if @temporary.profile.age < min
            max = @temporary.profile.age if @temporary.profile.age > max
          end
          next if current_user.profile.minimumage > min || current_user.profile.maximumage < max
        end
        next if (x.gender == 'Only Male' && current_user.profile.gender != 'Male') || (x.gender == 'Only Female' && current_user.profile.gender != 'Female')

        if current_user.profile.genderpreference == 'Only Male'
          result = false
          x.chatroom_users.each do |y|
            @temporary = User.find(y.user_id)
            if @temporary.profile.gender != 'Male'
              result = true
              break
            end
          end
          next if result == true
        end
        if current_user.profile.genderpreference == 'Only Female'
          result = false
          x.chatroom_users.each do |y|
            @temporary = User.find(y.user_id)
            result = true if @temporary.profile.gender != 'Female'
          end
          next if result == true
        end
        if current_user.profile.genderpreference == 'Must Include Male'
          male = 0
          x.chatroom_users.each do |y|
            @temporary = User.find(y.user_id)
            male += 1 if @temporary.profile.gender == 'Male'
          end
          next if male == 0
        end
        if current_user.profile.genderpreference == 'Must Include Female'
          female = 0
          x.chatroom_users.each do |y|
            @temporary = User.find(y.user_id)
            female += 1 if @temporary.profile.gender == 'Female'
          end
          next if female == 0
        end
        if current_user.profile.collegepreference == 'Only Students At My College'
          result = false
          x.chatroom_users.each do |y|
            @temporary = User.find(y.user_id)
            if Swot.school_name(@temporary.profile.collegeemail) != Swot.school_name(current_user.profile.collegeemail)
              result = true
              break
            end
          end
          next if result == true
        end
        if current_user.profile.collegepreference == 'Only College Students'
          result = false
          x.chatroom_users.each do |y|
            @temporary = User.find(y.user_id)
            if @temporary.profile.collegeemail.blank?
              result = true
              break
            end
          end
          next if result == true
        end
        if current_user.profile.collegepreference == 'Must Include Students At My College'
          mycollege = 0
          x.chatroom_users.each do |y|
            @temporary = User.find(y.user_id)
            mycollege += 1 if Swot.school_name(@temporary.profile.collegeemail) == Swot.school_name(current_user.profile.collegeemail)
          end
          next if mycollege == 0
        end
        if current_user.profile.collegepreference == 'Must Include College Students'
          number = 0
          x.chatroom_users.each do |y|
            @temporary = User.find(y.user_id)
            number += 1 unless @temporary.profile.collegeemail.blank?
          end
          next if number == 0
        end
        next if x.collegestudent == 'Only Students At My College' && Swot.school_name(current_user.profile.collegeemail) != Swot.school_name(@adminuser.profile.collegeemail)
        next if x.collegestudent == 'Only College Students' && current_user.collegeemail.blank?
        next if x.visible == false

        @results.push(x)
      end
      @unread = 0
      @requests =
        @unread = current_user.chatroom_users.where(read: false).count
      current_user.chatroom_users.where(admin: true).each do |x|
        @which = Chatroom.find(x.chatroom_id)
        @requests += @which.requests.count
      end
    end
  end
end
