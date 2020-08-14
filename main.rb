require 'uri'
require 'net/http'
require 'openssl'

#
#  Get your SMSLink / SMS Gateway Connection ID and Password from 
#  https://www.smslink.ro/get-api-key/
#

url = URI("https://secure.smslink.ro/sms/gateway/communicate/index.php?connection_id=MyConnectionID&password=MyConnectionPassword&to=07xyzzzzzz&message=TestMessage")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)

response = http.request(request)
puts response.read_body