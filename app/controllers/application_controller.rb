# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def append_info_to_payload(payload)
    super

    payload[:request_id] = request.uuid
  end
end
