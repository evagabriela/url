class Url < ActiveRecord::Base
  # Remember to create a migration!
    validates_uniqueness_of :short_url
    validates_format_of :long_url, :with => /^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/,
                        :message => "Please enter a real url!"
end