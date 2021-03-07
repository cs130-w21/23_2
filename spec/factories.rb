# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { 'JoeBruin' }
    email { 'JoeBruin@gmail.com' }
    password { 'UCLAgobruins' }
  end
  factory :profile do
    first_name { 'Joe' }
    last_name { 'Bruin' }
    age { 20 }
    gender { 'Male' }
    city { 'Los Angeles,United States,California,5368361' }
    collegeemail { 'JoeBruin@ucla.edu' }
    user
  end
  factory :chatroom do
    title { 'Group Room' }
    details { 'Group Description' }
    gender { 'Does Not Matter' }
    collegestudent { 'Only College Student' }
    minimumage { 13 }
    maximumage { 100 }
    visible { true }
    city { 'Los Angeles,United States,California,5368361' }
  end
  factory :request do
    chatroom
    user
  end
  factory :chatroom_user do
    email { 'JoeBruin@gmail.com' }
    encrypted_password { 'UCLAgobruins' }
    remember_created_at { 0 }
  end
  factory :message do
    body { 'sample message' }
    chatroom
    user
  end
end
