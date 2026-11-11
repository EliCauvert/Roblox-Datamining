local Parent = script.Parent.Parent
local TestingAnalytics = require(Parent.dependencies).SocialLuaAnalytics.TestingAnalytics
local MockAnalyticsFunction = TestingAnalytics.mockAnalytics
local MockLoggerFunction = TestingAnalytics.mockLogger
local SetupFireEventFunction = require(Parent.Analytics).setupFireEvent

return function(p1, p2)
	-- upvalues: MockAnalyticsFunction (copy), MockLoggerFunction (copy), SetupFireEventFunction (copy)
	local Uid = if p1 and p1.uid then p1.uid else "123"
	local MockAnalyticsResult = MockAnalyticsFunction(p2 or { fn = function() end })
	
	return {
		uid = Uid,
		value = {
			fireEvent = SetupFireEventFunction({
				analytics = MockAnalyticsResult,
				loggerImpl = MockLoggerFunction,
				infoForAllEvents = { uid = Uid }
			})
		},
		mockLogger = MockLoggerFunction(p2 or { fn = function() end }),
		analyticsMock = MockAnalyticsResult
	}
end