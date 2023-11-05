class EnrollUserController < ApplicationController
  before_action :valid_params, :check_college_existence, :check_college_exam_related

  def enroll_user
    @user = User.new(create_params)
    
    if @user.save
      @response_message = { response: "User enrolled to the test successfully" }
      response_status = 200
    else
      @response_message = { response: "Failed to create the test for user: #{params[:first_name]}" }.merge!(@user.errors)
      response_status = 400
    end

    log_request_response(@response_message, response_status)

    if request.format.html?
      render 'enroll_user/response_page'
    else
      render json: { message: @response_message }, status: response_status
    end
  end

  def create_params
    {
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      college_id: params[:college_id],
      exam_id: params[:exam_id],
      start_time: params[:start_time]
    }
  end

  private

  def valid_params
    unless validate_params?
      error = { message: "Required parameters are missing" }
      status = 400

      log_request_response(error, status)

      render json: error, status: status
    end
  end

  def check_college_existence
    unless college_exist?
      error =  { error: "College with id: #{params[:college_id]} doesn't exist" }
      status = 400

      log_request_response(error, status)

      render json: error, status: status
    end
  end

  def check_college_exam_related
    unless college_exam_related?
      error =  { error: "#{params[:exam_id]} is invalid or unassociated with the college" }
      status = 400

      log_request_response(error, status)

      render json: error, status: status
    end
  end

  def validate_params?
    required_keys = [:first_name, :last_name, :phone_number, :college_id, :exam_id, :start_time]
    permitted_params = params.permit(required_keys)
    required_keys.all? { |key| permitted_params[key].present? }
  end

  def college_exist?
    College.where(id: params[:college_id]).exists?
  end

  def college_exam_related?
    exam = Exam.includes(:college, :exam_window).find_by(id: params[:exam_id])
  
    return false if exam.nil?
  
    exam_college_related = exam.college.present?
    within_time = params[:start_time] >= exam.exam_window.first.start_time.to_s && params[:start_time] <= exam.exam_window.first.end_time.to_s
  
    exam_college_related && within_time
  end

  def log_request_response(response, response_status)
    RequestResponseLog.create(
      request_params: params,
      response: response,
      request_time: Time.now,
      status_code: response_status
    )
  end
end
