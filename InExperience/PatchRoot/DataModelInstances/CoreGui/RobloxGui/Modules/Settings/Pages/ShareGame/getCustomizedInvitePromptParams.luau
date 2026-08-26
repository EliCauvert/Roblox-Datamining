local constantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Constants)

return function(p1, p2)
	-- upvalues: constantsModule (ref)
	local var1 = if p1 and p1.InviteUser ~= 0 then p1.InviteUser else nil
	local var2, var3 = p2(if var1 then constantsModule.Triggers.DeveloperSingle else constantsModule.Triggers.DeveloperMultiple, var1)
	
	if not var2 then
		return nil
	end
	local t = {}
	
	if var3 and p1 then
		if p1.InviteMessageId ~= "" then
			t.inviteMessageId = p1.InviteMessageId
		end
		if p1.InviteUser ~= 0 then
			t.inviteUserId = p1.InviteUser
		end
		if p1.PromptMessage ~= "" then
			t.promptMessage = p1.PromptMessage
		end
		if p1.LaunchData ~= "" then
			t.launchData = p1.LaunchData
		end
	end
	return t
end