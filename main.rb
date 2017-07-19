require './get_build_status'
require './send_signal'


def show_status
	status = get_status
	puts Time.now


	if status == 'FAILED'
	 green(:off)
	 red(:on)
	else
	 green(:on)
	 red(:off)
	end
end


while true
	show_status
	sleep 5
end