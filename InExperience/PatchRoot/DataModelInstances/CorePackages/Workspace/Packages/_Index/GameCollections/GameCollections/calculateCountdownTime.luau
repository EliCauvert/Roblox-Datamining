return function(p1: number) --[[ Line: 11 | Named "calculateCountdownTime" ]]
	local Total = p1 + 59
	local Floored = 0
	local Floored1 = 0
	local Floored2 = 0
	
	if Total >= 86400 then
		Floored = math.floor(Total / 86400)
		Total -= Floored * 86400
	end
	if Total >= 3600 then
		Floored1 = math.floor(Total / 3600)
		Total -= Floored1 * 3600
	end
	if Total > 0 then
		Floored2 = math.floor(Total / 60)
	end
	return { days = Floored, hours = Floored1, minutes = Floored2 }
end