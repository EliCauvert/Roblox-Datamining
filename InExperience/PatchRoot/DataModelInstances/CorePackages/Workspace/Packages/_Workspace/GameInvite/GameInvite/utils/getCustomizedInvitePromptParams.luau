local GameInvite = script:FindFirstAncestor("GameInvite")
local GetCustomizedInvitePromptUserIdModule = require(script.Parent.getCustomizedInvitePromptUserId)
local _ = require(GameInvite.gameInviteModalType)
local FFlagFixPromptGameInviteUIMissingDisplayName = require(GameInvite.Parent.SharedFlags).FFlagFixPromptGameInviteUIMissingDisplayName

return function(ExperienceInviteOptions, Trigger, Callback) --[[ Line: 12 ]]
	-- upvalues: GetCustomizedInvitePromptUserIdModule (copy), FFlagFixPromptGameInviteUIMissingDisplayName (copy)
	local CustomizedInvitePromptUserIdModule = GetCustomizedInvitePromptUserIdModule(ExperienceInviteOptions)
	local CallbackResult, CallbackResult2 = Callback(Trigger, CustomizedInvitePromptUserIdModule)
	
	if not CallbackResult then
		return nil
	end
	local config = { trigger = Trigger }
	
	if FFlagFixPromptGameInviteUIMissingDisplayName and CustomizedInvitePromptUserIdModule then
		config.inviteUserId = CustomizedInvitePromptUserIdModule
	end
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