# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

KitsuAwards::Application.configure do
  # Settings specified here will take precedence over those in `config/application.rb`.

  # Caching is turned on.
  config.action_controller.perform_caching = true

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  config.asset_host = ENV.fetch('ASSET_HOST', nil)

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Full error reports are disabled.
  config.consider_all_requests_local = false

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Use the default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = Logger::Formatter.new

  # Include generic and useful information about system operation, but avoid logging too much
  # information to avoid inadvertent exposure of personally identifiable information (PII).
  config.log_level = :info

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger = ActiveSupport::Logger.new($stdout)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  # Enable Lograge in production.
  config.lograge.enabled = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
end
