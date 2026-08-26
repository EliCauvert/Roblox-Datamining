local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local eventIngestService = game:GetService("EventIngestService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local parent = genericAbuseReporting.Parent
local eventIngest = require(parent.Analytics).AnalyticsReporters.EventIngest
local var1 = require(parent.Analytics).Analytics.new(rbxAnalyticsService)
local cryoModule = require(parent.Cryo)
local _ = require(script.Parent.AnalyticsReducer)
local var2 = require(genericAbuseReporting.Logger):new("AbuseReport Analytics")
local t = {
	ReportTimeSpent = game:DefineFastString("GenericAbuseReportingTimeSpentStat", "TimeSpent"),
	SubmittedAbuseType = game:DefineFastString("GenericAbuseReportingSubmittedAbuseTypeStat", "SubmittedAbuseType")
}
local list = { "Unspecified", "Submit", "Abandon" }

return function(p1, p2)
	-- upvalues: var1 (ref), t (ref), cryoModule (ref), list (ref), eventIngest (ref), eventIngestService (ref), var2 (ref)
	local diag = var1.Diag
	diag:reportStats(p1.context .. "_" .. t.ReportTimeSpent, p1.accumulated_time_ms)
	local text = p1.context .. "_" .. t.SubmittedAbuseType .. "_" .. p0.reason_selection
	diag:reportCounter(text, 1)
	local floored = math.floor(workspace:GetServerTimeNow() * 1000 - p1.accumulated_time_ms)
	eventIngest.new(eventIngestService):sendEventDeferred(p1.context, p1.event_type, cryoModule.Dictionary.union(p1, {
		accumulated_time_ms = floored,
		interaction_type = (table.find(list, p2) or 1) - 1
	}))
	var2:info("Submitted. context: {} interaction_type: {} abuseTypeCategory: {} timeSpent (ms): {}", p1.context, p2, text, floored)
end