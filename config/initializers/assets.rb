# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( logos/google.png logos/facebook.png logos/apple.png logos/stripe.png logos/yahoo.png testimonials/testimonial2.jpg testimonials/testimonial3.jpg feature1.png feature2.png slider/slide3.png slider/slide4.png slider/slide1.png slider/slide5.png slider/slide2.png social/social-tw.png social/social-dbl.png )
