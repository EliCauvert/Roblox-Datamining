local AppChat = script:FindFirstAncestor("AppChat")
local FFlagExpChatEnableFriendsTab = require(AppChat.Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local GetFFlagAppChatRequestedRouteModule = require(AppChat.Flags.getFFlagAppChatRequestedRoute)
game:DefineFastFlag("AppChatEnableRootedNavigation2", false)

return function()
	-- upvalues: FFlagExpChatEnableFriendsTab (copy), GetFFlagAppChatRequestedRouteModule (copy)
	return game:GetFastFlag("AppChatEnableRootedNavigation2") and (FFlagExpChatEnableFriendsTab and GetFFlagAppChatRequestedRouteModule())
end