class PushJobInRedisController < ApplicationController
    #before_action :http_basic_authenticate

    def push_job
        PushJobInRedisService.new.push_job(params["_id"]["$oid"], params["mbb_id"], params['action'], params["user_id"])
        head :ok
    end

    # private
    # def http_basic_authenticate
    #     authenticate_or_request_with_http_basic do |username, password|
    #       username == USERNAME && password == PASSWORD
    #     end
    # end
end