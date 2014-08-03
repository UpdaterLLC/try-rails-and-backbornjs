class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def self.bad_request(msg)
    msg.nil? and msg = ''
    raise ActionController::BadRequest.new(msg)
  end
  def self.not_found(msg)
    msg.nil? and msg = ''
    raise ActionController::RoutingError.new(msg)
  end


  rescue_from ActionController::BadRequest,     with: :render_400
  rescue_from ActiveRecord::RecordNotFound,     with: :render_400
  rescue_from ActionController::RoutingError,   with: :render_404
  # rescue_from Exception,                        with: :render_500

  def render_400(e = nil)
    logger.info "Rendering 400 with exception: #{e.message}" if e

    if request.xhr?
      render json: { error: '400 error: '+(e ? e.message : '') }, status: 400
    else
      respond_to do |format|
        format.json { render json: { error: '400 error: '+(e ? e.message : '') }, status: 400 }
        format.html { render template: 'errors/error_400: '+(e ? e.message : ''), status: 400, layout: 'application', content_type: 'text/html' }
      end
    end
  end

  def render_404(e = nil)
    logger.info "Rendering 404 with exception: #{e.message}" if e

    if request.xhr?
      render json: { error: '404 error: '+(e ? e.message : '') }, status: 404
    else
      respond_to do |format|
        format.json { render json: { error: '404 error: '+(e ? e.message : '') }, status: 404 }
        format.html { render template: 'errors/error_404: '+(e ? e.message : ''), status: 404, layout: 'application', content_type: 'text/html' }
      end
    end
  end

  def render_500(e = nil)
    logger.info "Rendering 500 with exception: #{e.message}" if e

    if request.xhr?
      render json: { error: '500 error: '+(e ? e.message : '')  }, status: 500
    else
      respond_to do |format|
        format.json { render json: { error: '500 error: '+(e ? e.message : '') }, status: 500 }
        format.html { render template: 'errors/error_500: '+(e ? e.message : ''), status: 500, layout: 'application', content_type: 'text/html' }
      end
    end
  end
end
