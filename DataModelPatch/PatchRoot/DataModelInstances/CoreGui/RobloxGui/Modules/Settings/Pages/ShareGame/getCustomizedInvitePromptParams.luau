local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Constants)

return function(ExperienceInviteOptions, Callback)
	-- upvalues: ConstantsModule (copy)
	local InviteUser = if ExperienceInviteOptions and ExperienceInviteOptions.InviteUser ~= 0 then ExperienceInviteOptions.InviteUser else nil
	local CallbackResult, CallbackResult2 = Callback(if InviteUser then ConstantsModule.Triggers.DeveloperSingle else ConstantsModule.Triggers.DeveloperMultiple, InviteUser)
	
	if not CallbackResult then
		return nil
	end
	local t = {}
	
	if CallbackResult2 and ExperienceInviteOptions then
		if ExperienceInviteOptions.InviteMessageId ~= "" then
			t.inviteMessageId = ExperienceInviteOptions.InviteMessageId
		end
		if ExperienceInviteOptions.InviteUser ~= 0 then
			t.inviteUserId = ExperienceInviteOptions.InviteUser
		end
		if ExperienceInviteOptions.PromptMessage ~= "" then
			t.promptMessage = ExperienceInviteOptions.PromptMessage
		end
		if ExperienceInviteOptions.LaunchData ~= "" then
			t.launchData = ExperienceInviteOptions.LaunchData
		end
	end
	return t
end