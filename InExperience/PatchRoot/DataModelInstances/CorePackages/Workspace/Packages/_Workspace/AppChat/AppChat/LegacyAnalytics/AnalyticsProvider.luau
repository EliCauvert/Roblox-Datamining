local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local Analytics = require(Parent.Analytics).Analytics
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RoactChatAnalyticsModule = require(script.Parent.RoactChatAnalytics)
local AnalyticsContextModule = require(AppChat.LegacyAnalytics.AnalyticsContext)

return function(p1) --[[ Line: 17 ]]
	-- upvalues: Analytics (copy), RbxAnalyticsService (copy), RoactModule (copy), AnalyticsContextModule (copy), RoactChatAnalyticsModule (copy)
	return RoactModule.createElement(AnalyticsContextModule.Provider, {
		value = RoactChatAnalyticsModule.new(Analytics.new(RbxAnalyticsService), p1.localUserId)
	}, RoactModule.oneChild(p1[RoactModule.Children]))
end