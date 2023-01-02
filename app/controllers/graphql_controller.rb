class GraphQLController < ApplicationController
  protect_from_forgery with: :null_session

  def execute
    context = {}
    query = params[:query]
    operation_name = params[:operation_name]
    variables = ensure_hash(params[:variables])

    result = KitsuAwardsSchema.execute(query, context: context, operation_name: operation_name, variables: variables)

    render json: result
  rescue => err
    raise err unless Rails.env.development?

    handle_error_in_development err
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(err)
    logger.error err.message
    logger.error err.backtrace.join("\n")

    render json: { data: {}, error: { backtrace: err.backtrace, message: err.message } }, status: 500
  end
end
