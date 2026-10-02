return function(p1, p2)
	local absValue = math.abs(p1 - (p2 or DateTime.now().UnixTimestampMillis))
	local var1 = "LT"
	
	if absValue >= 31536000000 then
		var1 = "MMM D, YYYY, LT"
	elseif absValue >= 432000000 then
		var1 = "MMM D, LT"
	elseif absValue >= 86400000 then
		var1 = "dddd LT"
	end
	return DateTime.fromUnixTimestampMillis(p1):FormatLocalTime(var1, "en-us")
end