module ResponseRenderer

  extend ActiveSupport::Concern

  included do ;  end

  module ClassMethods ;  end

  # Common method to render success response inside this module
  def render_success(message: nil, data: nil, status_code: 200)
    render json: { success: true, message: message, data: data }, status: status_code
  end

  # Common method to render error response inside this module
  def render_error(message: 'Not Found', status_code: 400)
    render json: { success: false, error: message, status_code: status_code }, status: status_code
  end

  # Handle Rails exceptions with custom JSON response
  def render_500_error(message: 'Internal Server Error')
    render_error message: message, status_code: 500
  end

  # Handle 400 errors with custom JSON response
  def render_bad_request(message: 'Not Found')
    render_error message: message, status_code: 400
  end

  # Handle 422 errors with custom JSON response
  def render_unprocessable_entity(message: 'Unprocessible Entity')
    render_error message: message, status_code: 422
  end

  # Handle 401 errors with custom JSON response
  def render_unauthorized(message: 'Unauthorised')
    render_error message: message, status_code: 401
  end

  # Handle 404 errors with custom JSON response
  def render_not_found( message: 'Not Found')
    render_error message: message, status_code: 404
  end

  # Handle 403 errors with custom JSON response
  def render_forbidden(message: 'Forbidden')
    render_error message: message, status_code: 403
  end


  # Common method to render create new resource
  def render_created message: , data: nil
    render_succ message: message, data: data, status_code: 201
  end

end
