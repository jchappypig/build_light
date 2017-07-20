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
	value['state']['result'] && (value['state']['result']['name'] == 'FAILED' || value['state']['result']['name'] == 'SUCCESSFUL')
 end

 result['state']['result']['name']
end

def get_statuses
 response = HTTParty.get(@bitbucket_url)	
 json_response = JSON.parse(response.body)
 values = json_response['values']
 failures = 0
 successes = 0
 results = []

 values.each do | value |

	if value['state']['result'] && value['state']['result']['name'] == 'FAILED'
		failures = failures + 1
	end


	if value['state']['result'] && value['state']['result']['name'] == 'SUCCESSFUL'
		successes = successes + 1
	end
 end

 {'successes' => successes, 'failures' => failures}
end


 