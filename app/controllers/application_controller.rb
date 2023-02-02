class ApplicationController < ActionController::API
    def health_check
        return render json: {msg: 'working fine'}
    end
end
