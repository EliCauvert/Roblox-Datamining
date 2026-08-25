local gameInvite = script:FindFirstAncestor("GameInvite")
local gameInviteConstantsModule = require(gameInvite.GameInviteConstants)
local _ = require(gameInvite.gameInviteModalType)
local getCustomizedInvitePromptUserIdModule = require(script.Parent.getCustomizedInvitePromptUserId)

return function(p0)
	-- upvalues: getCustomizedInvitePromptUserIdModule (ref), gameInviteConstantsModule (ref)
	return if getCustomizedInvitePromptUserIdModule(p0) then gameInviteConstantsModule.Triggers.DeveloperSingle else gameInviteConstantsModule.Triggers.DeveloperMultiple
end