local playersService = game:GetService("Players")
local appChat = script:FindFirstAncestor("AppChat")
local analytics = require(appChat.Parent.Analytics).Analytics
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local roactChatAnalyticsModule = require(appChat.LegacyAnalytics.RoactChatAnalytics)
local filterForLinksWithPolicyModule = require(appChat.Components.ChatConversation.Utils.filterForLinksWithPolicy)
local enumMessageTypesModule = require(appChat.Components.ChatConversation.EnumMessageTypes)

return function(p1, p2, p3)
	-- upvalues: analytics (ref), rbxAnalyticsService (ref), playersService (ref), roactChatAnalyticsModule (ref), enumMessageTypesModule (ref), filterForLinksWithPolicyModule (ref)
	local var1 = p3 or roactChatAnalyticsModule.new(analytics.new(rbxAnalyticsService), tostring(playersService.LocalPlayer.UserId))
	
	if p1.messageType == enumMessageTypesModule.PlainText then
		for i, v in pairs(filterForLinksWithPolicyModule(p1)) do
			if v.messageType == enumMessageTypesModule.Link then
				var1:loadGameLinkCardInChat(p2, v.placeId)
			end
		end
		return
	elseif p1.messageType == enumMessageTypesModule.Link then
		var1:loadGameLinkCardInChat(p2, p1.gameLink.universeId)
	end
end