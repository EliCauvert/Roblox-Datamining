local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Constants)
local FFlagFixPromptGameInviteUIMissingDisplayName = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagFixPromptGameInviteUIMissingDisplayName

return function(ExperienceInviteOptions, Callback) --[[ Line: 12 ]]
	-- upvalues: ConstantsModule (copy), FFlagFixPromptGameInviteUIMissingDisplayName (copy)
	local InviteUser = if ExperienceInviteOptions and ExperienceInviteOptions.InviteUser ~= 0 then ExperienceInviteOptions.InviteUser else nil
	local CallbackResult, CallbackResult2 = Callback(if InviteUser then ConstantsModule.Triggers.DeveloperSingle else ConstantsModule.Triggers.DeveloperMultiple, InviteUser)
	
	if not CallbackResult then
		return nil
	end
	local t = {}
	
	if FFlagFixPromptGameInviteUIMissingDisplayName and InviteUser then
		t.inviteUserId = InviteUser
	end
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