require "omniauth-oauth2"
require 'multi_json'

module OmniAuth
  module Strategies
    class Revrise < OmniAuth::Strategies::OAuth2
      option :name, 'revrise'

      option :client_options, {
        site: "https://www2.revrise.com",
        authorize_url: "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          :description => raw_info['email'],
          :name => raw_info['full_name']
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.load(access_token.get('https://api2.revrise.com/v1/core/users/me').body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

    end
  end
end
