require 'Faker'

10.times { Url.create(
   :long_url => Faker::Internet.domain_name, 
   :short_url => (Faker::Lorem.characters(char_count = 5) + ".ly"))}