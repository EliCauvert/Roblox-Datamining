local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local EventIngestService = game:GetService("EventIngestService")
local Parent = GenericAbuseReporting.Parent
local EventIngest = require(Parent.Analytics).AnalyticsReporters.EventIngest
local NewResult = require(Parent.Analytics).Analytics.new((game:GetService("RbxAnalyticsService")))
local CryoModule = require(Parent.Cryo)
local _ = require(script.Parent.AnalyticsReducer)
local AbuseReportAnalytics = require(GenericAbuseReporting.Logger):new("AbuseReport Analytics")
local config = {
	ReportTimeSpent = game:DefineFastString("GenericAbuseReportingTimeSpentStat", "TimeSpent"),
	SubmittedAbuseType = game:DefineFastString("GenericAbuseReportingSubmittedAbuseTypeStat", "SubmittedAbuseType")
}
local List = { "Unspecified", "Submit", "Abandon" }

return function(p1, Value) --[[ Line: 22 | Named "submitAnalytics" ]]
	-- upvalues: NewResult (copy), config (copy), CryoModule (copy), List (copy), EventIngest (copy), EventIngestService (copy), AbuseReportAnalytics (copy)
	local Diag = NewResult.Diag
	Diag:reportStats(p1.context .. "_" .. config.ReportTimeSpent, p1.accumulated_time_ms)
	local Text = p1.context .. "_" .. config.SubmittedAbuseType .. "_" .. p1.reason_selection
	Diag:reportCounter(Text, 1)
	local Floored = math.floor(workspace:GetServerTimeNow() * 1000 - p1.accumulated_time_ms)
	EventIngest.new(EventIngestService):sendEventDeferred(p1.context, p1.event_type, (CryoModule.Dictionary.union(p1, {
		accumulated_time_ms = Floored,
		interaction_type = (table.find(List, Value) or 1) - 1
	})))
	AbuseReportAnalytics:info("Submitted. context: {} interaction_type: {} abuseTypeCategory: {} timeSpent (ms): {}", p1.context, Value, Text, Floored)
end