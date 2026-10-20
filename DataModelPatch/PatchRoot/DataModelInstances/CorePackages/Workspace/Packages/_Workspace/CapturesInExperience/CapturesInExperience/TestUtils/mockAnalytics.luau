local Parent = script.Parent.Parent
local MockAnalyticsFunction = require(Parent.Parent.SocialLuaAnalytics).TestingAnalytics.mockAnalytics
local SetupFireEventModule = require(Parent.Analytics.setupFireEvent)

return function(p1, p2)
	-- upvalues: MockAnalyticsFunction (copy), SetupFireEventModule (copy)
	local MockAnalyticsResult = MockAnalyticsFunction(p2)
	local Uid = if p1 and p1.uid then p1.uid else "101"
	
	return {
		analyticsMock = MockAnalyticsResult,
		fireAnalyticsEvent = SetupFireEventModule({
			analytics = MockAnalyticsResult,
			infoForAllEvents = {
				isUnder13 = false,
				pid = if p1 and p1.pid then p1.pid else "1818",
				source = if p1 and p1.source then p1.source else "mock",
				uid = Uid
			}
		}),
		uid = Uid
	}
end