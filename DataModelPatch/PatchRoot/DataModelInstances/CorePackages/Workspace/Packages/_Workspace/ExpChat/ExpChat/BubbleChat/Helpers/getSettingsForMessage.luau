return function(p1, p2)
	local UserSpecificSettings = p1 and p1.UserSpecificSettings
	
	return if p2 and UserSpecificSettings then if UserSpecificSettings[p2.userId] then UserSpecificSettings[p2.userId] elseif p2.partOrModel and UserSpecificSettings[p2.partOrModel:GetFullName()] then UserSpecificSettings[p2.partOrModel:GetFullName()] else p1 else p1
end