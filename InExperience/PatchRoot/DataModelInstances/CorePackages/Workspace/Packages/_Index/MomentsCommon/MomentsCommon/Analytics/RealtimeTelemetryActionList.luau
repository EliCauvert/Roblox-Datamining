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

local function _(p0)
	-- upvalues: t (ref)
	return t[p0] or "unknown"
end

local function normalizeRequestFailureReason(p1)
	return if p1 == nil or p1 == "" then "unknown" elseif p1 == "requestFailed" or p1 == "malformedResponse" then p1 else "unknown"
end

local function normalizeMediaFailureReason(p2)
	return if p2 == nil or p2 == "" then "unknown" elseif string.find(p2, "video load errored:", 1, true) == 1 then "videoLoadErrored" elseif string.find(p2, "video load failed:", 1, true) == 1 then "videoLoadFailed" elseif string.find(p2, "screenshot load failed:", 1, true) == 1 then "screenshotLoadFailed" else "unknown"
end

local t_1 = {
	reaction_add = "reaction_add",
	reaction_remove = "reaction_remove",
	share = "share",
	join = "join",
	report = "report"
}

local _ = function(p3)
	-- upvalues: t_1 (ref)
	return t_1[p3] or "unknown"
end

local t_2 = {
	create_intent = "create_intent",
	gallery_selected = "gallery_selected",
	published = "published",
	upload = "upload"
}

local _ = function(p4)
	-- upvalues: t_2 (ref)
	return t_2[p4] or "unknown"
end

local _ = function(p5)
	return if p5 == "success" or p5 == "failed" then p5 else "unknown"
end

local t_3 = {
	malformed = "malformed",
	duplicate = "duplicate",
	moderated = "moderated",
	deleted = "deleted"
}

local _ = function(p6)
	-- upvalues: t_3 (ref)
	return t_3[p6] or "unknown"
end

local t_4 = {
	music = "music",
	trim = "trim",
	text_overlay = "text_overlay",
	sticker = "sticker",
	description = "description"
}

local _ = function(p7)
	-- upvalues: t_4 (ref)
	return t_4[p7] or "unknown"
end

local t_5 = {
	music = "music",
	trim = "trim",
	text = "text",
	sticker = "sticker",
	generateText = "generateText"
}

local _ = function(p8)
	-- upvalues: t_5 (ref)
	return t_5[p8] or "unknown"
end

local _ = function(p9)
	return if p9 == "screenshot" or p9 == "video" then p9 else "unknown"
end

local _ = function(p10)
	return if p10 == "succeeded" or p10 == "failed" or p10 == "filtered" then p10 else "unknown"
end

local _ = function(p11, p12)
	local t = { status = p11.status, feedType = p11.feedType }
	
	if p11.status == "failed" then
		t.failureReason = p12(p11.failureReason)
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
				format = function(p13)
					return { feedType = p13.feedType }
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
				format = function(p14)
					local t = { status = p14.status, feedType = p14.feedType }
					
					if p14.status == "failed" then
						local failureReason = p14.failureReason
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
				format = function(p15)
					-- upvalues: normalizeRequestFailureReason (ref)
					local t = { status = p15.status, feedType = p15.feedType }
					
					if p15.status == "failed" then
						local failureReason = p15.failureReason
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
				format = function(p16)
					-- upvalues: normalizeMediaFailureReason (ref)
					local t = { status = p16.status, feedType = p16.feedType }
					
					if p16.status == "failed" then
						t.failureReason = normalizeMediaFailureReason(p16.failureReason)
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
				format = function(p17)
					return { reason = p17.reason }
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
				format = function(p18)
					-- upvalues: t (ref)
					return { source = t[p18.source] or "unknown" }
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsSessionStarted] = telemetry.new({
		description = "Counts Moments session starts in real time, dimensioned by a bounded entry source.",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsSessionStarted,
		lastUpdated = { 2026, 8, 1 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p19)
					-- upvalues: t (ref)
					return { source = t[p19.source] or "unknown" }
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsSessionEnded] = telemetry.new({
		description = "Counts Moments session ends in real time, dimensioned by a bounded entry source.",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsSessionEnded,
		lastUpdated = { 2026, 8, 1 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p20)
					-- upvalues: t (ref)
					return { source = t[p20.source] or "unknown" }
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsSessionHeartbeat] = telemetry.new({
		description = "Counts periodic heartbeats emitted while a Moments session is active; multiply the per-second rate by the heartbeat interval to estimate concurrent sessions (CCU).",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsSessionHeartbeat,
		lastUpdated = { 2026, 8, 1 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p21)
					-- upvalues: t (ref)
					return { source = t[p21.source] or "unknown" }
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsEngagement] = telemetry.new({
		description = "Counts Moments engagement actions (reactions, shares, joins, reports, experience-detail opens) in real time, dimensioned by a bounded action.",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsEngagement,
		lastUpdated = { 2026, 8, 1 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p22)
					-- upvalues: t_1 (ref)
					return { action = t_1[p22.action] or "unknown" }
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsCreationStep] = telemetry.new({
		description = "Counts Moments creation-flow steps in real time, dimensioned by bounded step and (for upload) status.",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsCreationStep,
		lastUpdated = { 2026, 8, 1 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p23)
					-- upvalues: t_2 (ref)
					local t = { step = t_2[p23.step] or "unknown" }
					
					if p23.status ~= nil then
						local status = p23.status
						t.status = if status == "success" or status == "failed" then status else "unknown"
					end
					return t
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsFeedItemsReceived] = telemetry.new({
		description = "Counts feed items received from the backend before client-side filtering; the denominator for the filtered-item rate.",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsFeedItemsReceived,
		lastUpdated = { 2026, 8, 5 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p24)
					return { feedType = p24.feedType }
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsFeedItemFiltered] = telemetry.new({
		description = "Counts feed items the client dropped, dimensioned by bounded reason. deleted/moderated are dropped by the feed source's availability filter; malformed/duplicate are dropped by the feed store's dedupe. Denominator is MomentsFeedItemsReceived.",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsFeedItemFiltered,
		lastUpdated = { 2026, 8, 5 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p25)
					-- upvalues: t_3 (ref)
					return {
						reason = t_3[p25.reason] or "unknown",
						feedType = p25.feedType
					}
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsPublishedWithEdit] = telemetry.new({
		description = "Counts published moments carrying each edit type (one increment per edit type present), dimensioned by bounded editType.",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsPublishedWithEdit,
		lastUpdated = { 2026, 8, 5 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p26)
					-- upvalues: t_4 (ref)
					return { editType = t_4[p26.editType] or "unknown" }
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsPublishedEditCount] = telemetry.new({
		description = "Counts published moments by how many edit types they carry, dimensioned by a bounded bucket (0/1/2/3plus).",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsPublishedEditCount,
		lastUpdated = { 2026, 8, 5 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p27)
					return { bucket = p27.bucket }
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsPublishedByCaptureType] = telemetry.new({
		description = "Counts published moments by bounded capture type (screenshot/video).",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsPublishedByCaptureType,
		lastUpdated = { 2026, 8, 5 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p28)
					local t = {}
					local captureType = p28.captureType
					t.captureType = if captureType == "screenshot" or captureType == "video" then captureType else "unknown"
					
					return t
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsEditToolOpened] = telemetry.new({
		description = "Counts creation edit-tool opens, dimensioned by bounded tool (music/trim/text/sticker/generateText).",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsEditToolOpened,
		lastUpdated = { 2026, 8, 5 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p29)
					-- upvalues: t_5 (ref)
					return { tool = t_5[p29.tool] or "unknown" }
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsEditToolAbandoned] = telemetry.new({
		description = "Counts creation edit-tool cancels (Back without applying), dimensioned by bounded tool. Pairs with MomentsEditToolOpened for an open\226\134\146apply conversion.",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsEditToolAbandoned,
		lastUpdated = { 2026, 8, 5 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p30)
					-- upvalues: t_5 (ref)
					return { tool = t_5[p30.tool] or "unknown" }
				end
			}
		}
	}),
	[realtimeEventNamesModule.MomentsGenerateText] = telemetry.new({
		description = "Counts AI generate-text attempts by bounded status (succeeded/failed/filtered).",
		throttlingThousandths = 10000,
		name = realtimeEventNamesModule.MomentsGenerateText,
		lastUpdated = { 2026, 8, 17 },
		backendsList = {
			{
				incrementValue = 1,
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p31)
					local t = {}
					local status = p31.status
					t.status = if status == "succeeded" or status == "failed" or status == "filtered" then status else "unknown"
					
					return t
				end
			}
		}
	})
}