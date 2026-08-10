local socialLuaAnalyticsModule = require(script:FindFirstAncestor("MomentsCommon").Parent.SocialLuaAnalytics)
local supportedTelemetryBackends = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local realtimeEventNamesModule = require(script.Parent.RealtimeEventNames)
local telemetry = socialLuaAnalyticsModule.Telemetry
local t = {
	watch_tab = "watch_tab",
	deeplink = "deeplink",
	profile = "profile",
	flyout_menu = "flyout_menu"
}

local function _(p0) --[[ line: 52 | named "normalizeViewSource" ]]
	-- upvalues: t (ref)
	return t[p0] or "unknown"
end

local function normalizeRequestFailureReason(p1) --[[ line: 56 ]]
	return if p1 == nil or p1 == "" then "unknown" elseif p1 == "requestFailed" or p1 == "malformedResponse" then p1 else "unknown"
end

local function normalizeMediaFailureReason(p2) --[[ line: 63 ]]
	return if p2 == nil or p2 == "" then "unknown" elseif string.find(p2, "video load errored:", 1, true) == 1 then "videoLoadErrored" elseif string.find(p2, "video load failed:", 1, true) == 1 then "videoLoadFailed" elseif string.find(p2, "screenshot load failed:", 1, true) == 1 then "screenshotLoadFailed" else "unknown"
end

local _ = function(p3, p4) --[[ line: 77 | named "formatFeedOperationInfo" ]]
	local t = { status = p3.status, feedType = p3.feedType }
	
	if p3.status == "failed" then
		t.failureReason = p4(p3.failureReason)
	end
	return t
end

return {
	[realtimeEventNamesModule.MomentsFeedLoadAttempt] = telemetry.new({
		description = "Counts Moments feed load attempts in real time, providing the denominator for feed outcome rates.",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsFeedLoadAttempt,
		lastUpdated = { 2026, 7, 30 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p5) --[[ line: 98 ]]
					return { feedType = p5.feedType }
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsFeedState] = telemetry.new({
		description = "Counts completed Moments top-of-feed outcomes in real time, dimensioned by status, feed type, and bounded failure reason.",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsFeedState,
		lastUpdated = { 2026, 7, 30 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p6) --[[ line: 115 ]]
					local t = { status = p6.status, feedType = p6.feedType }
					
					if p6.status == "failed" then
						local failureReason = p6.failureReason
						t.failureReason = if failureReason == nil or failureReason == "" then "unknown" elseif failureReason == "requestFailed" or failureReason == "malformedResponse" then failureReason else "unknown"
					end
					return t
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsFeedLoadMore] = telemetry.new({
		description = "Counts attempted and failed Moments pagination requests in real time.",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsFeedLoadMore,
		lastUpdated = { 2026, 7, 30 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p7) --[[ line: 137 ]]
					-- upvalues: normalizeRequestFailureReason (ref)
					local t = { status = p7.status, feedType = p7.feedType }
					
					if p7.status == "failed" then
						local failureReason = p7.failureReason
						t.failureReason = if failureReason == nil or failureReason == "" then "unknown" elseif failureReason == "requestFailed" or failureReason == "malformedResponse" then failureReason else "unknown"
					end
					return t
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsFeedMediaLoad] = telemetry.new({
		description = "Counts attempted and failed unique Moments media loads in the coordinator download window.",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsFeedMediaLoad,
		lastUpdated = { 2026, 7, 30 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p8) --[[ line: 152 ]]
					-- upvalues: normalizeMediaFailureReason (ref)
					local t = { status = p8.status, feedType = p8.feedType }
					
					if p8.status == "failed" then
						t.failureReason = normalizeMediaFailureReason(p8.failureReason)
					end
					return t
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsSurfaceLoadAbort] = telemetry.new({
		description = "Counts Moments surface loads that end before the first frame, dimensioned by bounded abort reason.",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsSurfaceLoadAbort,
		lastUpdated = { 2026, 7, 30 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p9) --[[ line: 167 ]]
					return { reason = p9.reason }
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsViewBegan] = telemetry.new({
		description = "Counts Moments views in real time, dimensioned by a bounded source.",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsViewBegan,
		lastUpdated = { 2026, 7, 30 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p10) --[[ line: 182 ]]
					-- upvalues: t (ref)
					return { source = t[p10.source] or "unknown" }
				end
			}
		}
	})
}