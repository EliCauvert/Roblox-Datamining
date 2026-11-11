local Players = game:GetService("Players")
local AppChat = script:FindFirstAncestor("AppChat")
local Analytics = require(AppChat.Parent.Analytics).Analytics
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RoactChatAnalyticsModule = require(AppChat.LegacyAnalytics.RoactChatAnalytics)
local FilterForLinksWithPolicyModule = require(AppChat.Components.ChatConversation.Utils.filterForLinksWithPolicy)
local EnumMessageTypesModule = require(AppChat.Components.ChatConversation.EnumMessageTypes)

return function(p1, p2, p3)
	-- upvalues: Analytics (copy), RbxAnalyticsService (copy), Players (copy), RoactChatAnalyticsModule (copy), EnumMessageTypesModule (copy), FilterForLinksWithPolicyModule (copy)
	local NewRoactChatAnalytics = if p3 then p3 else RoactChatAnalyticsModule.new(Analytics.new(RbxAnalyticsService), (tostring(Players.LocalPlayer.UserId)))
	
	if p1.messageType == EnumMessageTypesModule.PlainText then
		for _, value in pairs(FilterForLinksWithPolicyModule(p1)) do
			if value.messageType == EnumMessageTypesModule.Link then
				NewRoactChatAnalytics:loadGameLinkCardInChat(p2, value.placeId)
			end
		end
		return
	elseif p1.messageType == EnumMessageTypesModule.Link then
		NewRoactChatAnalytics:loadGameLinkCardInChat(p2, p1.gameLink.universeId)
	end
end