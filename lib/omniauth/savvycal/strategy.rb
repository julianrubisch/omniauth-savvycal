require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class SavvyCal < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: "https://api.savvycal.com",
        authorize_url: "https://savvycal.com/oauth/authorize",
        token_url: "https://savvycal.com/oauth/token"
      }

      uid { raw_info["id"].to_s }

      extra do
        {raw_info: raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get("user").parsed
      end
    end
  end
end

OmniAuth.config.add_camelization "savvycal", "SavvyCal"
