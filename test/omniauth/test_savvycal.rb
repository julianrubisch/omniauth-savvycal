# frozen_string_literal: true

require "test_helper"

class Omniauth::TestSavvycal < Minitest::Spec
  def test_that_it_has_a_version_number
    refute_nil ::Omniauth::Savvycal::VERSION
  end

  subject do
    OmniAuth::Strategies::SavvyCal.new({})
  end

  describe "client options" do
    it "should have correct site" do
      _(subject.options.client_options.site).must_equal("https://api.savvycal.com/v1")
    end

    it "should have correct authorize url" do
      _(subject.options.client_options.authorize_url).must_equal("https://savvycal.com/oauth/authorize")
    end

    it "should have correct token url" do
      _(subject.options.client_options.token_url).must_equal("https://savvycal.com/oauth/token")
    end
  end

  describe "#callback_url" do
    it "is a combination of host, script name, and callback path" do
      subject.stub :full_host, "https://example.com" do
        subject.stub :script_name, "/sub_uri" do
          _(subject.callback_url).must_equal("https://example.com/sub_uri/auth/savvycal/callback")
        end
      end
    end
  end
end
