local inGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local eventIngestService = game:GetService("EventIngestService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local parent = inGameAssetReporting.Parent
local eventIngest = require(parent.Analytics).AnalyticsReporters.EventIngest
local var1 = require(parent.Analytics).Analytics.new(rbxAnalyticsService)
local cryoModule = require(parent.Cryo)
local _ = require(inGameAssetReporting.InGameAssetReportUI.Resources.Types)
local t = {
	ReportTimeSpent = game:DefineFastString("InGameAssetReportingTimeSpentStat", "TimeSpent"),
	SubmittedAbuseType = game:DefineFastString("InGameAssetReportingSubmittedAbuseTypeStat", "SubmittedAbuseType")
}

function submitAnalytics(p1, p2)
	-- upvalues: eventIngest (ref), eventIngestService (ref), var1 (ref), cryoModule (ref), t (ref)
	local var2 = eventIngest.new(eventIngestService)
	local diag = var1.Diag
	local floored = math.floor(workspace:GetServerTimeNow() * 1000 - p1.accumulated_time_ms)
	local var3 = cryoModule.Dictionary.join(p1, { accumulated_time_ms = floored, interaction_type = p2 })
	local text = p1.context .. "_" .. t.SubmittedAbuseType .. "_" .. p0.reason_selection
	diag:reportStats(p1.context .. "_" .. t.ReportTimeSpent, floored)
	diag:reportCounter(text, 1)
	var2:sendEventDeferred(p1.context, p1.event_type, var3)
end

return submitAnalytics