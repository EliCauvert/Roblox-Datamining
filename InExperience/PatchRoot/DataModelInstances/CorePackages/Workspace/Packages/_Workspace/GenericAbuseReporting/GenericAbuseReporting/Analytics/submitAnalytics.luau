local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local eventIngestService = game:GetService("EventIngestService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local parent = genericAbuseReporting.Parent
local eventIngest = require(parent.Analytics).AnalyticsReporters.EventIngest
local var3 = require(parent.Analytics).Analytics.new(rbxAnalyticsService)
local cryoModule = require(parent.Cryo)
local _ = require(script.Parent.AnalyticsReducer)
local var5 = require(genericAbuseReporting.Logger):new("AbuseReport Analytics")
local t = {
	ReportTimeSpent = game:DefineFastString("GenericAbuseReportingTimeSpentStat", "TimeSpent"),
	SubmittedAbuseType = game:DefineFastString("GenericAbuseReportingSubmittedAbuseTypeStat", "SubmittedAbuseType")
}
local list = { "Unspecified", "Submit", "Abandon" }

return function(p0, p1)
	-- upvalues: var3 (ref), t (ref), cryoModule (ref), list (ref), eventIngest (ref), eventIngestService (ref), var5 (ref)
	local diag = var3.Diag
	diag:reportStats(p0.context .. "_" .. t.ReportTimeSpent, p0.accumulated_time_ms)
	local text = p0.context .. "_" .. t.SubmittedAbuseType .. "_" .. p0.reason_selection
	diag:reportCounter(text, 1)
	local floored = math.floor(workspace:GetServerTimeNow() * 1000 - p0.accumulated_time_ms)
	eventIngest.new(eventIngestService):sendEventDeferred(p0.context, p0.event_type, cryoModule.Dictionary.union(p0, {
		accumulated_time_ms = floored,
		interaction_type = (table.find(list, p1) or 1) - 1
	}))
	var5:info("Submitted. context: {} interaction_type: {} abuseTypeCategory: {} timeSpent (ms): {}", p0.context, p1, text, floored)
end