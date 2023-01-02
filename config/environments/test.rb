# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

# The test environment is used exclusively to run your application's
# test suite. You never need to work with it otherwise. Remember that
# your test database is "scratch space" for the test suite and is wiped
# and recreated between test runs. Don't rely on the data there!

KitsuAwards::Application.configure do
  # Settings specified here will take precedence over those in `config/application.rb`.

  # Disable request forgery protection in text environment.
  config.action_controller.allow_forgery_protection = false

  # Disable caching for Action Controller.
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Store uploaded files on the local file system in a temporary directory.
  config.active_storage.service = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr

  # Turn false under Spring and add `config.action_view.cache_template_loading = true`.
  config.cache_classes = true

  # Show full error reports.
  config.consider_all_requests_local = true

  # Eager loading loads your whole application. When running a single test locally,
  # this probably isn't necessary. It's a good idea to do in a continuous integration
  # system, or in some way before deploying your code.
  config.eager_load = ENV['CI'].present?

  # Configure public file server for tests with `Cache-Control` for performance.
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }
end
