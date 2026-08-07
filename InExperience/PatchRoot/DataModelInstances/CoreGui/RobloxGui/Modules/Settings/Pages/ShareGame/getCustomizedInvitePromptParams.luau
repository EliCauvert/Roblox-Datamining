local constantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Constants)

return function(p0, p1) --[[ line: 9 ]]
	-- upvalues: constantsModule (ref)
	local var1 = if p0 and p0.InviteUser ~= 0 then p0.InviteUser else nil
	local var2, var3 = p1(if var1 then constantsModule.Triggers.DeveloperSingle else constantsModule.Triggers.DeveloperMultiple, var1)
	
	if not var2 then
		return nil
	end
	local t = {}
	
	if var3 and p0 then
		if p0.InviteMessageId ~= "" then
			t.inviteMessageId = p0.InviteMessageId
		end
		if p0.InviteUser ~= 0 then
			t.inviteUserId = p0.InviteUser
		end
		if p0.PromptMessage ~= "" then
			t.promptMessage = p0.PromptMessage
		end
		if p0.LaunchData ~= "" then
			t.launchData = p0.LaunchData
		end
	end
	return t
end