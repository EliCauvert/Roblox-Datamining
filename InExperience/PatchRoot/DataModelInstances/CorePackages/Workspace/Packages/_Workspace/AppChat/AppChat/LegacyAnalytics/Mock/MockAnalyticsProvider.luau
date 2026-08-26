local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local analytics = require(parent.Analytics).Analytics
local roactChatAnalyticsModule = require(script.Parent.Parent.RoactChatAnalytics)
local analyticsContextModule = require(script.Parent.Parent.AnalyticsContext)

return function(p1)
	-- upvalues: analytics (ref), roactModule (ref), analyticsContextModule (ref), roactChatAnalyticsModule (ref)
	return roactModule.createElement(analyticsContextModule.Provider, {
		value = roactChatAnalyticsModule.new(analytics.mock(), tostring(math.random(999999999)))
	}, roactModule.oneChild(p1[roactModule.Children]))
end