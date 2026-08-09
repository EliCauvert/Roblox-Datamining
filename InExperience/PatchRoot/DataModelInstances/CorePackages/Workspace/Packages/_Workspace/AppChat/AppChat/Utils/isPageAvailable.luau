local appChat = script:FindFirstAncestor("AppChat")
local enumScreensModule = require(appChat.EnumScreens)
local isPlacementInExperience = require(appChat.Contexts.ChatPlacementContext).isPlacementInExperience
local t = {
	[enumScreensModule.AddFriends] = true,
	[enumScreensModule.PrivacySettings] = true,
	[enumScreensModule.GameDetail] = true,
	[enumScreensModule.ViewUserProfile] = true,
	[enumScreensModule.Groups] = true
}

return function(p0, p1) --[[ line: 15 ]]
	-- upvalues: isPlacementInExperience (ref), t (ref)
	return isPlacementInExperience(p1) and t[p0]
end