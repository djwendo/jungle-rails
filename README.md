# Jungle

A mini e-commerce application built with Rails 4.2.

## Final Product

!["Jungle Home Page"](https://github.com/djwendo/jungle-rails/blob/master/public/images/home_page.png?raw=true)
!["Item with no reviews or ratings"](https://github.com/djwendo/jungle-rails/blob/master/public/images/no_review_no_rating.png?raw=true)
!["Logged in users can create reviews and delete their own reviews"](https://github.com/djwendo/jungle-rails/blob/master/public/images/logged_in_create_delete_reviews.png?raw=true)
!["Cart with Items"](https://github.com/djwendo/jungle-rails/blob/master/public/images/jungle_cart.png?raw=true)
!["Completed Order"](https://github.com/djwendo/jungle-rails/blob/master/public/images/jungle_order.png?raw=true)

## Getting Started

1. Fork this repository, then clone your fork of this repository
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create `.env` file based on `.env.example`
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate `.env` vars
9. Run `bin/rails s -b 0.0.0.0` to start the server
10. Visit `http://localhost:3000`

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
