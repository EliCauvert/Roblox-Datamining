local function convertSecondsToTimeFrames(p1)
	return if p1 >= 86400 then { unit = "days", value = math.ceil(p1 / 86400) } elseif p1 >= 3600 then { unit = "hours", value = math.ceil(p1 / 3600) } else { unit = "minutes", value = math.ceil(p1 / 60) }
end

return function(p1, p2)
	-- upvalues: convertSecondsToTimeFrames (ref)
	if not p1 then
		return nil
	end
	local dateTime = DateTime.fromIsoDate(p1)
	
	if not dateTime then
		return nil
	end
	local maxValue = math.max(dateTime.UnixTimestamp - (p2 or DateTime.now()).UnixTimestamp, 0)
	
	return if maxValue <= 0 then nil else convertSecondsToTimeFrames(maxValue)
end