local GetCustomizedInvitePromptUserIdModule = require(script.Parent.getCustomizedInvitePromptUserId)
local _ = require(script:FindFirstAncestor("GameInvite").gameInviteModalType)

return function(ExperienceInviteOptions, Trigger, Callback)
	-- upvalues: GetCustomizedInvitePromptUserIdModule (copy)
	local CustomizedInvitePromptUserIdModule = GetCustomizedInvitePromptUserIdModule(ExperienceInviteOptions)
	local CallbackResult, CallbackResult2 = Callback(Trigger, CustomizedInvitePromptUserIdModule)
	
	if not CallbackResult then
		return nil
	end
	local config = { trigger = Trigger }
	
	if CallbackResult2 and ExperienceInviteOptions then
		if ExperienceInviteOptions.InviteMessageId ~= "" then
			config.inviteMessageId = ExperienceInviteOptions.InviteMessageId
		end
		if CustomizedInvitePromptUserIdModule then
			config.inviteUserId = CustomizedInvitePromptUserIdModule
		end
		if ExperienceInviteOptions.PromptMessage ~= "" then
			config.promptMessage = ExperienceInviteOptions.PromptMessage
		end
		if ExperienceInviteOptions.LaunchData ~= "" then
			config.launchData = ExperienceInviteOptions.LaunchData
		end
	end
	return config
end