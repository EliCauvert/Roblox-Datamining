local GameInvite = script:FindFirstAncestor("GameInvite")
local GameInviteConstantsModule = require(GameInvite.GameInviteConstants)
local _ = require(GameInvite.gameInviteModalType)
local GetCustomizedInvitePromptUserIdModule = require(script.Parent.getCustomizedInvitePromptUserId)

return function(p1) --[[ Line: 7 ]]
	-- upvalues: GetCustomizedInvitePromptUserIdModule (copy), GameInviteConstantsModule (copy)
	return GetCustomizedInvitePromptUserIdModule(p1) and GameInviteConstantsModule.Triggers.DeveloperSingle or GameInviteConstantsModule.Triggers.DeveloperMultiple
end