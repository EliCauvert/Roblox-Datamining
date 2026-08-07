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
local t_1 = { [enumScreensModule.Groups] = true }

return function(p0, p1, p2) --[[ line: 22 ]]
	-- upvalues: isPlacementInExperience (ref), t (ref), fFlagAppChatOnConsoles (ref), t_1 (ref)
	return if isPlacementInExperience(p1) and t[p0] then false else fFlagAppChatOnConsoles and p2 == false and t_1[p0]
end