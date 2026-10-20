local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local TestingAnalytics = require(ProfileQRCode.Parent.SocialLuaAnalytics).TestingAnalytics
local MockAnalyticsFunction = TestingAnalytics.mockAnalytics
local MockLoggerFunction = TestingAnalytics.mockLogger
local SetupFireEventFunction = require(ProfileQRCode.Analytics).setupFireEvent

return function(p1, p2)
	-- upvalues: MockAnalyticsFunction (copy), MockLoggerFunction (copy), SetupFireEventFunction (copy)
	local Uid = if p1 and p1.uid then p1.uid else "123"
	local MockAnalyticsResult = MockAnalyticsFunction(p2)
	
	return {
		uid = Uid,
		value = {
			fireEvent = SetupFireEventFunction({
				analytics = MockAnalyticsResult,
				loggerImpl = MockLoggerFunction,
				infoForAllEvents = { uid = Uid }
			})
		},
		mockLogger = MockLoggerFunction(p2),
		analyticsMock = MockAnalyticsResult
	}
end