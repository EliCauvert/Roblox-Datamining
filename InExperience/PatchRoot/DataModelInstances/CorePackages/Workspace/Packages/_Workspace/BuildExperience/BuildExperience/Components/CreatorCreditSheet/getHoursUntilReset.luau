return function(p1, p2) --[[ Line: 3 | Named "getHoursUntilReset" ]]
	local _DateTime = DateTime.fromIsoDate(p1)
	
	return if _DateTime == nil then nil else math.max(0, (math.ceil((_DateTime.UnixTimestamp - (p2 or DateTime.now().UnixTimestamp)) / 3600)))
end