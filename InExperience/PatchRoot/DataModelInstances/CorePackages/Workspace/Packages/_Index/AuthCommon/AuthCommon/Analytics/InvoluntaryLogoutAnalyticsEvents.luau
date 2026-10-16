local AuthCommon = script:FindFirstAncestor("AuthCommon")
local NewResult = require(AuthCommon.dependencies).Analytics.AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")))
local EventStreamConstants = require(AuthCommon.Parent.AuthAnalytics).EventStreamConstants

return {
	sendImmediatelyPageLoadEvent = function(Origin, p1) --[[ Line: 10 ]]
		-- upvalues: EventStreamConstants (copy), NewResult (copy)
		NewResult:sendEventImmediately(EventStreamConstants.Context.InvoluntaryLogout, EventStreamConstants.AuthEventName.AuthPageLoad, {
			origin = Origin,
			state = p1 or "",
			[EventStreamConstants.EventTimingKeys.OsClock] = tostring(os.clock()),
			[EventStreamConstants.EventTimingKeys.OsTime] = tostring(os.time())
		})
	end
}