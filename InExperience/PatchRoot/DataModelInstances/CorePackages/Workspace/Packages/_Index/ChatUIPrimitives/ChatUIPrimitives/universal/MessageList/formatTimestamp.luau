return function(p1, p2)
	local Magnitude = math.abs(p1 - (p2 or DateTime.now().UnixTimestampMillis))
	
	return DateTime.fromUnixTimestampMillis(p1):FormatLocalTime(if Magnitude >= 31536000000 then "MMM D, YYYY, LT" elseif Magnitude >= 432000000 then "MMM D, LT" elseif Magnitude >= 86400000 then "dddd LT" else "LT", "en-us")
end