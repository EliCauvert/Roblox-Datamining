return function(p1, p2)
	if not p1 then
		return nil
	end
	local floored = math.floor((p2 - os.time({
		hour = 0,
		min = 0,
		sec = 0,
		year = p1.year,
		month = p1.month,
		day = p1.day
	})) / 86400)
	
	if floored < 1 then
		return { value = 0, unit = "days" }
	end
	local dateString = os.date("!*t", p2)
	local var1 = (dateString.year - p1.year) * 12 + (dateString.month - p1.month)
	
	if dateString.day < p1.day then
		var1 -= 1
	end
	return if var1 >= 12 then { unit = "years", value = math.floor(var1 / 12) } elseif var1 >= 1 then { unit = "months", value = var1 } else { unit = "days", value = floored }
end