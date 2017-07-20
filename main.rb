require './get_build_status'
require './send_signal'


def show_status
	status = get_status
	puts Time.now


	if status == 'SUCCESSFUL'
	 red(:off)
	 green(:on)
	else
	 green(:off)
	 red(:on)
	end
end


while true
	show_status
	sleep 30
end