# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Git-web_mlocate_session',
  :secret      => '3bb64ca70300a270796804b6c13ebe1124dd7b34781f9ac1905a810badfcdd6ed885f091124a36426efffd0783815e02e7cd60f54a469086e6d9f9591fbe5b09'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
