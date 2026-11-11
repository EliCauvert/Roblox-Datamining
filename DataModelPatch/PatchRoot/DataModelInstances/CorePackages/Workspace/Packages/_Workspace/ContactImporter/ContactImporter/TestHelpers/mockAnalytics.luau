local Parent = script.Parent.Parent
local TestingAnalytics = require(Parent.dependencies).SocialLuaAnalytics.TestingAnalytics
local MockAnalyticsFunction = TestingAnalytics.mockAnalytics
local MockLoggerFunction = TestingAnalytics.mockLogger
local SetupFireAnalyticsEventsFunction = require(Parent.Analytics).setupFireAnalyticsEvents

return function(p1, p2)
	-- upvalues: MockAnalyticsFunction (copy), MockLoggerFunction (copy), SetupFireAnalyticsEventsFunction (copy)
	local Uid = if p1 and p1.uid then p1.uid else "123"
	local MockAnalyticsResult = MockAnalyticsFunction(p2)
	
	return {
		uid = Uid,
		value = {
			entryPoint = nil,
			fireAnalyticsEvent = SetupFireAnalyticsEventsFunction({
				diag = MockAnalyticsResult.Diag,
				eventStreamImpl = MockAnalyticsResult.EventStream,
				loggerImpl = MockLoggerFunction,
				infoForAllEvents = { uid = Uid }
			})
		},
		mockLogger = MockLoggerFunction(p2),
		analyticsMock = MockAnalyticsResult
	}
end