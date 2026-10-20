local function convertSecondsToTimeFrames(Value: number)
	return if Value >= 86400 then {
		unit = "days",
		value = math.floor(Value / 86400),
		secondsRemaining = Value
	} elseif Value >= 3600 then {
		unit = "hours",
		value = math.floor(Value / 3600),
		secondsRemaining = Value
	} elseif Value >= 60 then {
		unit = "minutes",
		value = math.floor(Value / 60),
		secondsRemaining = Value
	} else {
		unit = "seconds",
		value = math.floor(Value),
		secondsRemaining = Value
	}
end

return function(p1, p2)
	-- upvalues: convertSecondsToTimeFrames (copy)
	if not p1 then
		return nil
	end
	local _DateTime = DateTime.fromIsoDate(p1)
	
	if _DateTime then
		local UnixTimestampDelta = _DateTime.UnixTimestamp - (if p2 then p2 else DateTime.now()).UnixTimestamp
		
		return if UnixTimestampDelta <= 0 then {
			value = -1,
			unit = "seconds",
			secondsRemaining = UnixTimestampDelta
		} else convertSecondsToTimeFrames(UnixTimestampDelta)
	else
		return nil
	end
end