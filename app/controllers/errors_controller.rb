# frozen_string_literal: true

class ErrorsController < ActionController::API
  def error
    raise env['action_dispatch.exception']
  end
end
