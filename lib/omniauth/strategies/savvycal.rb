require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class SavvyCal < OmniAuth::Strategies::OAuth2
      option :name, "savvy_cal"
      option :client_options, {
        site: "https://api.savvycal.com/v1",
        authorize_url: "https://savvycal.com/oauth/authorize",
        token_url: "https://savvycal.com/oauth/token"
      }

      uid { raw_info["id"].to_s }

      info do
        {
          first_name: raw_info["first_name"],
          last_name: raw_info["last_name"],
          email: raw_info["email"]
        }
      end

      extra do
        {raw_info: raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get("me", {headers: {"Authorization" => "Bearer #{access_token.token}"}}).parsed
      end

      def callback_url
        options[:callback_url] || (full_host + callback_path)
      end

      def build_access_token
        options.token_params.merge!(
          client_id: options.client_id,
          client_secret: options.client_secret
        )

        super
      end
    end
  end
end

OmniAuth.config.add_camelization "savvycal", "SavvyCal"
