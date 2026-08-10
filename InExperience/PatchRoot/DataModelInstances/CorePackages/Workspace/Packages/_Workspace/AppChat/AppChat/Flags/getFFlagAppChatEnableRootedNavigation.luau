local appChat = script:FindFirstAncestor("AppChat")
local fFlagExpChatEnableFriendsTab = require(appChat.Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local getFFlagAppChatRequestedRouteModule = require(appChat.Flags.getFFlagAppChatRequestedRoute)
game:DefineFastFlag("AppChatEnableRootedNavigation2", false)

return function() --[[ line: 9 ]]
	-- upvalues: fFlagExpChatEnableFriendsTab (ref), getFFlagAppChatRequestedRouteModule (ref)
	return game:GetFastFlag("AppChatEnableRootedNavigation2") and (fFlagExpChatEnableFriendsTab and getFFlagAppChatRequestedRouteModule())
end