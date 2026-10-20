return function(p1, p2)
	if not p1 then
		return nil
	end
	local Floored = math.floor((p2 - os.time({
		hour = 0,
		min = 0,
		sec = 0,
		year = p1.year,
		month = p1.month,
		day = p1.day
	})) / 86400)
	
	if Floored < 1 then
		return { value = 0, unit = "days" }
	end
	local DateInfo = os.date("!*t", p2)
	local NewYear = (DateInfo.year - p1.year) * 12 + (DateInfo.month - p1.month)
	
	if DateInfo.day < p1.day then
		NewYear -= 1
	end
	return if NewYear >= 12 then { unit = "years", value = math.floor(NewYear / 12) } elseif NewYear >= 1 then { unit = "months", value = NewYear } else { unit = "days", value = Floored }
end