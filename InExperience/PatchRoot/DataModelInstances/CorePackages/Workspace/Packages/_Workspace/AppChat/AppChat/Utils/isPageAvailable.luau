local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
local isPlacementInExperience = require(appChat.Contexts.ChatPlacementContext).isPlacementInExperience
local fFlagAppChatOnConsoles = require(parent.SharedFlags).FFlagAppChatOnConsoles
local t = {
	[enumScreensModule.AddFriends] = true,
	[enumScreensModule.PrivacySettings] = true,
	[enumScreensModule.GameDetail] = true,
	[enumScreensModule.ViewUserProfile] = true,
	[enumScreensModule.Groups] = true
}
local t_1 = {
	[enumScreensModule.Groups] = true,
	[enumScreensModule.PrivacySettings] = require(appChat.Flags.FFlagAppChatHidePrivacySettingsWithoutWebView)
}

return function(p1, p2, p3)
	-- upvalues: isPlacementInExperience (ref), t (ref), fFlagAppChatOnConsoles (ref), t_1 (ref)
	return if isPlacementInExperience(p2) and t[p1] then false else fFlagAppChatOnConsoles and p3 == false and t_1[p1]
end