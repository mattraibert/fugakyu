# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_railso_session',
  :secret      => 'b14c9d43555e0d40ce14c9c0c22836b3f9edacbf54537a92e2a59a16497710989a77a0a172bb906dfad4671593da9571cb3bae394111136489b9b6c32906994b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
