class ApplicationController < ActionController::API
  include ResponseRenderer
  include Rescuer
  include AuthenticateUser

  # make current_user object available everywhere
  def current_user
    @current_user
  end

  # render error if any mandatory params are missing
  def assert_required_params params, required_params
    missing_params = []
    required_params.each do |p|
      missing_params << p if params[p].blank?
    end

    raise MissingParams.new(missing_params) if missing_params.any?
  end


end
