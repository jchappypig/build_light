####

#####
require 'json'
require 'httparty'
require 'yaml'

 @bitbucket_url= YAML.load_file("./config.yml")['ci_api_url'] 

def get_status 
 response = HTTParty.get(@bitbucket_url)	
 json_response = JSON.parse(response.body)
 values = json_response['values']
 result = values.find do | value |
	value['state']['result'] && value['state']['result']['name']
 end

 result['state']['result']['name']
end

 puts get_status

 if get_status == 'FAILED'
	puts 'red'
 else
	puts 'green'
 end


 