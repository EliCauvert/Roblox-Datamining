local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local EventIngestService = game:GetService("EventIngestService")
local Parent = ChatLineReporting.Parent
local EventIngest = require(Parent.Analytics).AnalyticsReporters.EventIngest
local NewResult = require(Parent.Analytics).Analytics.new((game:GetService("RbxAnalyticsService")))
local CryoModule = require(Parent.Cryo)
local _ = require(ChatLineReporting.Common.Types)
local config = {
	ReportTimeSpent = game:DefineFastString("ChatLineReportingTimeSpentStat", "TimeSpent"),
	SubmittedAbuseType = game:DefineFastString("ChatLineReportingSubmittedAbuseTypeStat", "SubmittedAbuseType")
}

function submitAnalytics(p1, Interaction_type, Mute_button_clicked) --[[ Line: 17 ]]
	-- upvalues: EventIngest (copy), EventIngestService (copy), NewResult (copy), CryoModule (copy), config (copy)
	local NewEventIngest = EventIngest.new(EventIngestService)
	local Diag = NewResult.Diag
	local Floored = math.floor(workspace:GetServerTimeNow() * 1000 - p1.accumulated_time_ms)
	local JoinResult = CryoModule.Dictionary.join(p1, {
		accumulated_time_ms = Floored,
		interaction_type = Interaction_type,
		mute_button_clicked = Mute_button_clicked
	})
	local Text = p1.context .. "_" .. config.SubmittedAbuseType .. "_" .. p1.reason_selection
	Diag:reportStats(p1.context .. "_" .. config.ReportTimeSpent, Floored)
	Diag:reportCounter(Text, 1)
	NewEventIngest:sendEventDeferred(p1.context, p1.event_type, JoinResult)
end

return submitAnalytics