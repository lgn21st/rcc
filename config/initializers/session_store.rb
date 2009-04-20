# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_home_session',
  :secret      => '07407c0c5173a042a79305bb547e83637dd6d0cf58aadc560db29797378c2f92ff3bee88ca522e38422fbe515ffd5980956249c4eafc4cd0edba05e7d03d55f4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
