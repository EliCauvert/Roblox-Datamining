return function(value, p1)
	local userSpecificSettings = value and value.UserSpecificSettings
	
	return if not (not p1 or not userSpecificSettings) then if userSpecificSettings[p1.userId] then userSpecificSettings[p1.userId] elseif p1.partOrModel and userSpecificSettings[p1.partOrModel:GetFullName()] then userSpecificSettings[p1.partOrModel:GetFullName()] else value else value
end