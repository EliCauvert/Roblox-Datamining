local function convertSecondsToTimeFrames(p0) --[[ line: 33 ]]
	return if p0 >= 86400 then {
		unit = "days",
		value = math.floor(p0 / 86400),
		secondsRemaining = p0
	} elseif p0 >= 3600 then {
		unit = "hours",
		value = math.floor(p0 / 3600),
		secondsRemaining = p0
	} elseif p0 >= 60 then {
		unit = "minutes",
		value = math.floor(p0 / 60),
		secondsRemaining = p0
	} else {
		unit = "seconds",
		value = math.floor(p0),
		secondsRemaining = p0
	}
end

return function(p1, p2) --[[ line: 61 | named "getRemainingTime" ]]
	-- upvalues: convertSecondsToTimeFrames (ref)
	if not p1 then
		return nil
	end
	local dateTime = DateTime.fromIsoDate(p1)
	
	if not dateTime then
		return nil
	end
	local var2 = dateTime.UnixTimestamp - (p2 or DateTime.now()).UnixTimestamp
	
	return if var2 <= 0 then { value = -1, unit = "seconds", secondsRemaining = var2 } else convertSecondsToTimeFrames(var2)
end