require 'httparty'
require 'openssl'
require 'Base64'

module VerizonCloud
  class Base
    include HTTParty
    base_uri 'https://api.cloud.verizon.com'
    debug_output
    def initialize(secret_key, access_key)
      @secret_key = secret_key
      @access_key = access_key
    end
    def add_auth_headers(rest_verb, content_type, api_resource, can_headers)
      time_stamp = Time.now.utc.strftime("%a, %d %b %Y %H:%M:%S GMT")
      string_to_sign = ""
      [rest_verb.upcase, content_type, time_stamp, can_headers, api_resource].each do |element|
        string_to_sign += URI.encode(element) + "\n"
      end
      p "string_to_sign: #{string_to_sign}"
      digest = OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha256'), @secret_key, string_to_sign.encode("utf-8")).strip()
      signature = Base64.encode64(digest)
      authorization_string = "CloudApi AccessKey=#{@access_key} SignatureType=HmacSHA256 Signature=#{signature}"

      { 'Date' => time_stamp, 'x-tmrk-authorization' => authorization_string }

    end
    def api_request(api_resource)
      auth_headers = add_auth_headers("GET", "text/html", api_resource, "")
      self.class.get api_resource, :headers => auth_headers
    end
  end

  class Server < Base

  end
  class Compute  < Base
     def servers

       api_request('/api/cloud/vmachine-template/')

     end
  end
  class NotYetAuthenticatedError < StandardError

  end
end
