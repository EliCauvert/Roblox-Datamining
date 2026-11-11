local AppChat = script:FindFirstAncestor("AppChat")
local FFlagExpChatEnableFriendsTab = require(AppChat.Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local GetFFlagAppChatRequestedRouteModule = require(AppChat.Flags.getFFlagAppChatRequestedRoute)
game:DefineFastFlag("AppChatEnableRootedNavigation", false)

return function()
	-- upvalues: FFlagExpChatEnableFriendsTab (copy), GetFFlagAppChatRequestedRouteModule (copy)
	return game:GetFastFlag("AppChatEnableRootedNavigation") and (FFlagExpChatEnableFriendsTab and GetFFlagAppChatRequestedRouteModule())
end