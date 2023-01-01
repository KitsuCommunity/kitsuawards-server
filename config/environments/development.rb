# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

KitsuAwards::Application.configure do
  # Settings specified here will take precedence over those in `config/application.rb`.

  config.action_controller.enable_fragment_cache_logging = true
  config.action_controller.perform_caching = true

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # In the development environment, your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Log everything in development.
  config.log_level = :debug

  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{2.days.to_i}"
  }

  # Enable server timing.
  config.server_timing = true

  # Use the cache store for user sessions.
  config.session_store :cache_store
end
