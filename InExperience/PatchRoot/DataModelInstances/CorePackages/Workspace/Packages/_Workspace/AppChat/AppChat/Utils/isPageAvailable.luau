local AppChat = script:FindFirstAncestor("AppChat")
local EnumScreensModule = require(AppChat.EnumScreens)
local IsPlacementInExperienceFunction = require(AppChat.Contexts.ChatPlacementContext).isPlacementInExperience
local FFlagAppChatOnConsoles = require(AppChat.Parent.SharedFlags).FFlagAppChatOnConsoles
local config = {
	[EnumScreensModule.AddFriends] = true,
	[EnumScreensModule.PrivacySettings] = true,
	[EnumScreensModule.GameDetail] = true,
	[EnumScreensModule.ViewUserProfile] = true,
	[EnumScreensModule.Groups] = true
}
local config1 = {
	[EnumScreensModule.Groups] = true,
	[EnumScreensModule.PrivacySettings] = require(AppChat.Flags.FFlagAppChatHidePrivacySettingsWithoutWebView)
}

return function(p1, p2, Enabled): boolean
	-- upvalues: IsPlacementInExperienceFunction (copy), config (copy), FFlagAppChatOnConsoles (copy), config1 (copy)
	return (not IsPlacementInExperienceFunction(p2) or not config[p1]) and (not FFlagAppChatOnConsoles or Enabled ~= false or not config1[p1])
end