local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local eventIngestService = game:GetService("EventIngestService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local parent = chatLineReporting.Parent
local eventIngest = require(parent.Analytics).AnalyticsReporters.EventIngest
local var1 = require(parent.Analytics).Analytics.new(rbxAnalyticsService)
local cryoModule = require(parent.Cryo)
local _ = require(chatLineReporting.Common.Types)
local t = {
	ReportTimeSpent = game:DefineFastString("ChatLineReportingTimeSpentStat", "TimeSpent"),
	SubmittedAbuseType = game:DefineFastString("ChatLineReportingSubmittedAbuseTypeStat", "SubmittedAbuseType")
}

function submitAnalytics(p1, p2, p3)
	-- upvalues: eventIngest (ref), eventIngestService (ref), var1 (ref), cryoModule (ref), t (ref)
	local var2 = eventIngest.new(eventIngestService)
	local diag = var1.Diag
	local floored = math.floor(workspace:GetServerTimeNow() * 1000 - p1.accumulated_time_ms)
	local var3 = cryoModule.Dictionary.join(p1, {
		accumulated_time_ms = floored,
		interaction_type = p2,
		mute_button_clicked = p3
	})
	local text = p1.context .. "_" .. t.SubmittedAbuseType .. "_" .. p0.reason_selection
	diag:reportStats(p1.context .. "_" .. t.ReportTimeSpent, floored)
	diag:reportCounter(text, 1)
	var2:sendEventDeferred(p1.context, p1.event_type, var3)
end

return submitAnalytics