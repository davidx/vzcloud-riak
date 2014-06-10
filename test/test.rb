
$:.unshift(File.dirname(__FILE__))
require 'test_helper'

unit_tests do
   include VerizonCloud
  test "list vzcloud compute instances" do
    compute = VerizonCloud::Compute.new(SECRET_KEY, ACCESS_KEY)

    servers = compute.servers
    assert_not_nil servers
    assert_kind_of Array, servers
    assert_kind_of Server, servers.first
  end


  test "create vzcloud auth header" do
     instance_eval do
       def headers
         Hash.new
       end
     end
     assert_equal 0, headers.keys.length
  end
  test "create vzcloud compute instance" do

  end

  test "get templates" do
    compute = VerizonCloud::Compute.new(SECRET_KEY, ACCESS_KEY)

    vdiskTemplates = compute.api_request('/api/cloud/vdisk-template/')

  end
end
