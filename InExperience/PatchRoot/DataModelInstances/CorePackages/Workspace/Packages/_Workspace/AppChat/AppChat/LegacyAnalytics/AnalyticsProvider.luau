local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactModule = require(parent.Roact)
local analytics = require(parent.Analytics).Analytics
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local roactChatAnalyticsModule = require(script.Parent.RoactChatAnalytics)
local analyticsContextModule = require(appChat.LegacyAnalytics.AnalyticsContext)

return function(p1)
	-- upvalues: analytics (ref), rbxAnalyticsService (ref), roactModule (ref), analyticsContextModule (ref), roactChatAnalyticsModule (ref)
	return roactModule.createElement(analyticsContextModule.Provider, {
		value = roactChatAnalyticsModule.new(analytics.new(rbxAnalyticsService), p1.localUserId)
	}, roactModule.oneChild(p1[roactModule.Children]))
end