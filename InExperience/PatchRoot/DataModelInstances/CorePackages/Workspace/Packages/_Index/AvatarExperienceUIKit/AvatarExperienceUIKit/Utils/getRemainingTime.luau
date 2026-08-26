local function convertSecondsToTimeFrames(p1)
	return if p1 >= 86400 then {
		unit = "days",
		value = math.floor(p1 / 86400),
		secondsRemaining = p1
	} elseif p1 >= 3600 then {
		unit = "hours",
		value = math.floor(p1 / 3600),
		secondsRemaining = p1
	} elseif p1 >= 60 then {
		unit = "minutes",
		value = math.floor(p1 / 60),
		secondsRemaining = p1
	} else {
		unit = "seconds",
		value = math.floor(p1),
		secondsRemaining = p1
	}
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
	local var1 = dateTime.UnixTimestamp - (p2 or DateTime.now()).UnixTimestamp
	
	return if var1 <= 0 then { value = -1, unit = "seconds", secondsRemaining = var1 } else convertSecondsToTimeFrames(var1)
end