local AppChat = script:FindFirstAncestor("AppChat")
local EnumScreensModule = require(AppChat.EnumScreens)
local IsPlacementInExperienceFunction = require(AppChat.Contexts.ChatPlacementContext).isPlacementInExperience
local config = {
	[EnumScreensModule.AddFriends] = true,
	[EnumScreensModule.PrivacySettings] = true,
	[EnumScreensModule.GameDetail] = true,
	[EnumScreensModule.ViewUserProfile] = true,
	[EnumScreensModule.Groups] = true
}

return function(p1, p2): boolean
	-- upvalues: IsPlacementInExperienceFunction (copy), config (copy)
	return not IsPlacementInExperienceFunction(p2) or not config[p1]
end