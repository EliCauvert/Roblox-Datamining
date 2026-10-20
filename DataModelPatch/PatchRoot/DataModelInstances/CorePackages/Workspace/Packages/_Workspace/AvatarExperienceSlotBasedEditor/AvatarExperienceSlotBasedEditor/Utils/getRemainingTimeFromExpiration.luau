local function convertSecondsToTimeFrames(Largest: number)
	return if Largest >= 86400 then { unit = "days", value = math.ceil(Largest / 86400) } elseif Largest >= 3600 then { unit = "hours", value = math.ceil(Largest / 3600) } else { unit = "minutes", value = math.ceil(Largest / 60) }
end

return function(p1, p2)
	-- upvalues: convertSecondsToTimeFrames (copy)
	if not p1 then
		return nil
	end
	local _DateTime = DateTime.fromIsoDate(p1)
	
	if _DateTime then
		local Largest = math.max(_DateTime.UnixTimestamp - (if p2 then p2 else DateTime.now()).UnixTimestamp, 0)
		
		return if Largest <= 0 then nil else convertSecondsToTimeFrames(Largest)
	else
		return nil
	end
end