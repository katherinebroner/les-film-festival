require 'rails_helper'

describe Category do
  let(:category) { Category.create(title: "Drama") }

  let(:movie_1) { Movie.create(title: Faker::Book.title, description: Faker::Lorem.sentence, category_id: category.id) }
  let(:movie_2) { Movie.create(title: Faker::Book.title, description: Faker::Lorem.sentence, category_id: category.id) }

  let(:user_1) { User.create(username: Faker::Name.first_name, email: Faker::Internet.safe_email, password: "password", role: "judge") }
  let(:user_2) { User.create(username: Faker::Name.first_name, email: Faker::Internet.safe_email, password: "password", role: "judge") }
  let(:user_3) { User.create(username: Faker::Name.first_name, email: Faker::Internet.safe_email, password: "password", role: "user") }
  let(:user_4) { User.create(username: Faker::Name.first_name, email: Faker::Internet.safe_email, password: "password", role: "user") }

  let(:review_1) { Review.create(description: Faker::Lorem.sentence, stars: 3.0, user_id: user_1.id, movie_id: movie_1.id) }
  let(:review_2) { Review.create(description: Faker::Lorem.sentence, stars: 3.5, user_id: user_3.id, movie_id: movie_1.id) }
  let(:review_3) { Review.create(description: Faker::Lorem.sentence, stars: 4.0, user_id: user_4.id, movie_id: movie_1.id) }
  let(:review_4) { Review.create(description: Faker::Lorem.sentence, stars: 5.0, user_id: user_1.id, movie_id: movie_2.id) }
  let(:review_5) { Review.create(description: Faker::Lorem.sentence, stars: 5.0, user_id: user_2.id, movie_id: movie_2.id) }


  describe "#validations" do
    it "is a valid Category object" do
      category.should be_valid
    end

    let(:invalid_category) { Category.create(title: nil) }
    it "is an invalid Category object" do
      invalid_category.should_not be_valid
    end
  end

  describe "#instance methods" do
    it "returns five most recent reviews in descending order" do
      movie_1.reviews << review_1
      movie_1.reviews << review_2
      movie_1.reviews << review_3
      movie_2.reviews << review_4
      movie_2.reviews << review_5

      category.movies << movie_1
      category.movies << movie_2

      expect( category.five_most_recent_reviews ).to eq( [review_5, review_4, review_3, review_2, review_1] )
    end

    it "does not return five most recent reviews in ascending order" do
       expect( category.five_most_recent_reviews ).not_to eq( [review_1, review_2, review_3, review_4, review_5] )
    end

    it "returns the movie with the highest average rating" do
      movie_1.reviews << review_1
      movie_1.reviews << review_2
      movie_1.reviews << review_3
      movie_2.reviews << review_4
      movie_2.reviews << review_5

      category.movies << movie_1
      category.movies << movie_2

      expect( category.winner ).to eq( movie_2 )
    end
  end
end
