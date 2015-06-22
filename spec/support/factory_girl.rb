require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    end
  end

  FactoryGirl.define do
    factory :question do
      sequence(:title) { |n| "how do i use factory girl version #{n}?" }
      body 'I am trying to implement factory girl but i confused'
    end
  end
