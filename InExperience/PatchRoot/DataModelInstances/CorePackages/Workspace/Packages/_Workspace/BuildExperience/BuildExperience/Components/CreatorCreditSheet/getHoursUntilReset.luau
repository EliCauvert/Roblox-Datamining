return function(value, p1)
	local dateTime = DateTime.fromIsoDate(value)
	
	return if dateTime == nil then nil else math.max(0, math.ceil((dateTime.UnixTimestamp - (p1 or DateTime.now().UnixTimestamp)) / 3600))
end