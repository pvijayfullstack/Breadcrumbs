# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_breadcrumbs_session',
  :secret      => 'cf9474bfdec1961b4a209b673526ed11a8d0440be80276f10082346026dd817533abe85cf159ab531fb8eed7098b64871591644338f6ab478de0b3230dd64e70'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
