local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local Analytics = require(Parent.Analytics).Analytics
local RoactChatAnalyticsModule = require(script.Parent.Parent.RoactChatAnalytics)
local AnalyticsContextModule = require(script.Parent.Parent.AnalyticsContext)

return function(p1)
	-- upvalues: Analytics (copy), RoactModule (copy), AnalyticsContextModule (copy), RoactChatAnalyticsModule (copy)
	return RoactModule.createElement(AnalyticsContextModule.Provider, {
		value = RoactChatAnalyticsModule.new(Analytics.mock(), (tostring(math.random(999999999))))
	}, RoactModule.oneChild(p1[RoactModule.Children]))
end