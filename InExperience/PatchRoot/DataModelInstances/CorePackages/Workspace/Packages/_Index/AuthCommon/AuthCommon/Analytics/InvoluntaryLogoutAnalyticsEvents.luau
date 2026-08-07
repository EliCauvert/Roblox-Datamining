local authCommon = script:FindFirstAncestor("AuthCommon")
local var1 = require(authCommon.dependencies).Analytics.AnalyticsReporters.EventIngest.new(game:GetService("EventIngestService"))
local eventStreamConstants = require(authCommon.Parent.AuthAnalytics).EventStreamConstants

return {
	sendImmediatelyPageLoadEvent = function(p0, p1) --[[ line: 10 ]]
		-- upvalues: eventStreamConstants (ref), var1 (ref)
		var1:sendEventImmediately(eventStreamConstants.Context.InvoluntaryLogout, eventStreamConstants.AuthEventName.AuthPageLoad, {
			origin = p0,
			state = p1 or "",
			[eventStreamConstants.EventTimingKeys.OsClock] = tostring(os.clock()),
			[eventStreamConstants.EventTimingKeys.OsTime] = tostring(os.time())
		})
	end
}