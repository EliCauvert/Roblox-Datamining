return function(value, p0) --[[ line: 3 | named "getSettingsForMessage" ]]
	local userSpecificSettings = value and value.UserSpecificSettings
	
	return if not (not p0 or not userSpecificSettings) then if userSpecificSettings[p0.userId] then userSpecificSettings[p0.userId] elseif p0.partOrModel and userSpecificSettings[p0.partOrModel:GetFullName()] then userSpecificSettings[p0.partOrModel:GetFullName()] else value else value
end