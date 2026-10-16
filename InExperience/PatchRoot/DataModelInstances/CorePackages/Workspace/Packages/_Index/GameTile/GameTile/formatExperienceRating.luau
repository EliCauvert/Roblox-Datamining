return function(p1, p2, p3, p4) --[[ Line: 1 | Named "formatExperienceRating" ]]
	if p1 + p2 == 0 then
		return p3 or "--"
	else
		local Rounded = math.round(p1 / (p1 + p2) * 100)
		
		return if p4 then `{Rounded}%` else tostring(Rounded)
	end
end