local playersService = game:GetService("Players")
local appChat = script:FindFirstAncestor("AppChat")
local analytics = require(appChat.Parent.Analytics).Analytics
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local roactChatAnalyticsModule = require(appChat.LegacyAnalytics.RoactChatAnalytics)
local filterForLinksWithPolicyModule = require(appChat.Components.ChatConversation.Utils.filterForLinksWithPolicy)
local enumMessageTypesModule = require(appChat.Components.ChatConversation.EnumMessageTypes)

return function(p0, p1, p2)
	-- upvalues: analytics (ref), rbxAnalyticsService (ref), playersService (ref), roactChatAnalyticsModule (ref), enumMessageTypesModule (ref), filterForLinksWithPolicyModule (ref)
	local var6 = p2 or roactChatAnalyticsModule.new(analytics.new(rbxAnalyticsService), tostring(playersService.LocalPlayer.UserId))
	
	if p0.messageType == enumMessageTypesModule.PlainText then
		for i, v in pairs(filterForLinksWithPolicyModule(p0)) do
			if v.messageType == enumMessageTypesModule.Link then
				var6:loadGameLinkCardInChat(p1, v.placeId)
			end
		end
		return
	elseif p0.messageType == enumMessageTypesModule.Link then
		var6:loadGameLinkCardInChat(p1, p0.gameLink.universeId)
	end
end