return function(p1, p2)
	local TimeoutDurationSeconds: number = p1.timeoutDurationSeconds
	
	if TimeoutDurationSeconds == nil or TimeoutDurationSeconds < 0 then
		return false, nil
	elseif TimeoutDurationSeconds == 0 then
		return true, nil
	else
		local TimeoutStartTime = p1.timeoutStartTime
		local _DateTime = if TimeoutStartTime and TimeoutStartTime ~= "" then DateTime.fromIsoDate(TimeoutStartTime) else nil
		local NewTimeoutDurationSeconds = (if _DateTime then _DateTime.UnixTimestamp else p2) + TimeoutDurationSeconds
		
		if NewTimeoutDurationSeconds <= p2 then
			return false, nil
		else
			return true, NewTimeoutDurationSeconds
		end
	end
end