game:DefineFastString("PCGDKFilteredNotificationTypes", "ExperienceInvitation,SquadExperienceInvitation")

return function()
	local PCGDKFilteredNotificationTypesFastString = game:GetFastString("PCGDKFilteredNotificationTypes")
	
	if PCGDKFilteredNotificationTypesFastString == "" then
		return {}
	end
	local t = {}
	
	for i, v in ipairs(string.split(PCGDKFilteredNotificationTypesFastString, ",")) do
		local var2 = v:match("^%s*(.-)%s*$")
		
		if var2 ~= "" then
			t[var2] = true
		end
	end
	return t
end