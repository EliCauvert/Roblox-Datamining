game:DefineFastString("PCGDKFilteredNotificationTypes", "ExperienceInvitation,SquadExperienceInvitation")

return function()
	local PCGDKFilteredNotificationTypesFastString: string = game:GetFastString("PCGDKFilteredNotificationTypes")
	
	if PCGDKFilteredNotificationTypesFastString == "" then
		return {}
	end
	local t = {}
	
	for _, value in ipairs((string.split(PCGDKFilteredNotificationTypesFastString, ","))) do
		local SS = value:match("^%s*(.-)%s*$")
		
		if SS ~= "" then
			t[SS] = true
		end
	end
	return t
end