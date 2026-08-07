local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactModule = require(parent.Roact)
local analytics = require(parent.Analytics).Analytics
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local roactChatAnalyticsModule = require(script.Parent.RoactChatAnalytics)
local analyticsContextModule = require(appChat.LegacyAnalytics.AnalyticsContext)

return function(p0) --[[ line: 17 ]]
	-- upvalues: analytics (ref), rbxAnalyticsService (ref), roactModule (ref), analyticsContextModule (ref), roactChatAnalyticsModule (ref)
	return roactModule.createElement(analyticsContextModule.Provider, {
		value = roactChatAnalyticsModule.new(analytics.new(rbxAnalyticsService), p0.localUserId)
	}, roactModule.oneChild(p0[roactModule.Children]))
end