return function(value, p0) --[[ line: 3 | named "getHoursUntilReset" ]]
	local dateTime = DateTime.fromIsoDate(value)
	
	return if dateTime == nil then nil else math.max(0, math.ceil((dateTime.UnixTimestamp - (p0 or DateTime.now().UnixTimestamp)) / 3600))
end