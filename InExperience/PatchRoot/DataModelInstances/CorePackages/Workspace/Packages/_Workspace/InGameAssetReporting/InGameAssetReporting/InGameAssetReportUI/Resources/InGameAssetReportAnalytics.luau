local inGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local eventIngestService = game:GetService("EventIngestService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local parent = inGameAssetReporting.Parent
local eventIngest = require(parent.Analytics).AnalyticsReporters.EventIngest
local var3 = require(parent.Analytics).Analytics.new(rbxAnalyticsService)
local cryoModule = require(parent.Cryo)
local _ = require(inGameAssetReporting.InGameAssetReportUI.Resources.Types)
local t = {
	ReportTimeSpent = game:DefineFastString("InGameAssetReportingTimeSpentStat", "TimeSpent"),
	SubmittedAbuseType = game:DefineFastString("InGameAssetReportingSubmittedAbuseTypeStat", "SubmittedAbuseType")
}

function submitAnalytics(p0, p1)
	-- upvalues: eventIngest (ref), eventIngestService (ref), var3 (ref), cryoModule (ref), t (ref)
	local var6 = eventIngest.new(eventIngestService)
	local diag = var3.Diag
	local floored = math.floor(workspace:GetServerTimeNow() * 1000 - p0.accumulated_time_ms)
	local var8 = cryoModule.Dictionary.join(p0, { accumulated_time_ms = floored, interaction_type = p1 })
	local text = p0.context .. "_" .. t.SubmittedAbuseType .. "_" .. p0.reason_selection
	diag:reportStats(p0.context .. "_" .. t.ReportTimeSpent, floored)
	diag:reportCounter(text, 1)
	var6:sendEventDeferred(p0.context, p0.event_type, var8)
end

return submitAnalytics