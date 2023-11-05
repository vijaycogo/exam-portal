class EnrollUserController < ApplicationController
  before_action :valid_params, :check_college_existence, :check_college_exam_related

  def enroll_user
    @user = User.new(create_params)
    
    if @user.save
      @response_message = { response: "User: #{params[:first_name]} enrolled to the test successfully" }
      response_status = 200
    else
      @response_message = { response: "Failed to create the test for user: #{params[:first_name]}" }.merge!(@user.errors)
      response_status = 400
    end

    send_response(response_status)
  end

  def send_response(response_status)
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
    required_keys = [:first_name, :last_name, :phone_number, :college_id, :exam_id, :start_time]
    permitted_params = params.permit(required_keys)
    missing_keys = required_keys.select { |key| !permitted_params[key].present? }
    
    if missing_keys.present?
      @response_message =  { response: "#{missing_keys} are missing" }
      response_status = 400
      send_response(response_status)
    end
  end

  def check_college_existence
    unless college_exist?
      @response_message = { response: "College with id: #{params[:college_id]} doesn't exist" }
      
      response_status = 400

      send_response(response_status)
    end
  end

  def check_college_exam_related
    unless college_exam_related?
      @response_message =  { response: "Exam id: #{params[:exam_id]} is invalid or unassociated with the college" }

      response_status = 400

      send_response(response_status)
    end
  end

  def college_exist?
    College.where(id: params[:college_id]).exists?
  end

  def college_exam_related?
    exam = Exam.includes(:college, :exam_window).find_by(id: params[:exam_id])
  
    return false if exam.nil?
  
    exam_college_related = exam.college.present?
    return false unless exam_college_related
    
    exam_window = exam.exam_window.first
    return false if exam_window.blank?

    within_time = params[:start_time] >= exam_window.start_time.to_s && params[:start_time] <= exam_window.end_time.to_s
  
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
