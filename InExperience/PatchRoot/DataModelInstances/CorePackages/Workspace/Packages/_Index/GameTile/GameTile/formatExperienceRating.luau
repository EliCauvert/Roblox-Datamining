return function(p0, p1, p2, p3) --[[ line: 1 | named "formatExperienceRating" ]]
	if p0 + p1 == 0 then
		return p2 or "--"
	end
	local rounded = math.round(p0 / (p0 + p1) * 100)
	
	return if p3 then `{rounded}%` else tostring(rounded)
end