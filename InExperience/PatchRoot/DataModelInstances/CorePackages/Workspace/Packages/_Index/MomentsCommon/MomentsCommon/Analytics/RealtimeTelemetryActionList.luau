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

local function _(p1)
	-- upvalues: t (ref)
	return t[p1] or "unknown"
end

local function normalizeRequestFailureReason(p1)
	return if p1 == nil or p1 == "" then "unknown" elseif p1 == "requestFailed" or p1 == "malformedResponse" then p1 else "unknown"
end

local function normalizeMediaFailureReason(p1)
	return if p1 == nil or p1 == "" then "unknown" elseif string.find(p1, "video load errored:", 1, true) == 1 then "videoLoadErrored" elseif string.find(p1, "video load failed:", 1, true) == 1 then "videoLoadFailed" elseif string.find(p1, "screenshot load failed:", 1, true) == 1 then "screenshotLoadFailed" else "unknown"
end

local t_1 = {
	reaction_add = "reaction_add",
	reaction_remove = "reaction_remove",
	share = "share",
	join = "join",
	report = "report"
}

local _ = function(p1)
	-- upvalues: t_1 (ref)
	return t_1[p1] or "unknown"
end

local t_2 = {
	create_intent = "create_intent",
	gallery_selected = "gallery_selected",
	published = "published",
	upload = "upload"
}

local _ = function(p1)
	-- upvalues: t_2 (ref)
	return t_2[p1] or "unknown"
end

local _ = function(p1)
	return if p1 == "success" or p1 == "failed" then p1 else "unknown"
end

local t_3 = {
	Moderated = "moderated",
	CaptureModerated = "moderated",
	UploadQuotaReached = "quota",
	Timeout = "timeout",
	StartUploadFailed = "startFailed",
	RegistrationFailed = "registrationFailed",
	PollError = "pollError",
	GenericFailure = "generic"
}

local _ = function(p1)
	-- upvalues: t_3 (ref)
	return t_3[p1] or "unknown"
end

local t_4 = {
	malformed = "malformed",
	duplicate = "duplicate",
	moderated = "moderated",
	deleted = "deleted"
}

local _ = function(p1)
	-- upvalues: t_4 (ref)
	return t_4[p1] or "unknown"
end

local t_5 = {
	music = "music",
	trim = "trim",
	text_overlay = "text_overlay",
	sticker = "sticker",
	description = "description"
}

local _ = function(p1)
	-- upvalues: t_5 (ref)
	return t_5[p1] or "unknown"
end

local t_6 = {
	music = "music",
	trim = "trim",
	text = "text",
	sticker = "sticker",
	generateText = "generateText"
}

local _ = function(p1)
	-- upvalues: t_6 (ref)
	return t_6[p1] or "unknown"
end

local _ = function(p1)
	return if p1 == "screenshot" or p1 == "video" then p1 else "unknown"
end

local _ = function(p1)
	return if p1 == "succeeded" or p1 == "failed" or p1 == "filtered" then p1 else "unknown"
end

local _ = function(p1, p2)
	local t = { status = p1.status, feedType = p1.feedType }
	
	if p1.status == "failed" then
		t.failureReason = p2(p1.failureReason)
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
				format = function(p1)
					return { feedType = p1.feedType }
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
				format = function(p1)
					local t = { status = p1.status, feedType = p1.feedType }
					
					if p1.status == "failed" then
						local failureReason = p1.failureReason
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
				format = function(p1)
					-- upvalues: normalizeRequestFailureReason (ref)
					local t = { status = p1.status, feedType = p1.feedType }
					
					if p1.status == "failed" then
						local failureReason = p1.failureReason
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
				format = function(p1)
					-- upvalues: normalizeMediaFailureReason (ref)
					local t = { status = p1.status, feedType = p1.feedType }
					
					if p1.status == "failed" then
						t.failureReason = normalizeMediaFailureReason(p1.failureReason)
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
				format = function(p1)
					return { reason = p1.reason }
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
				format = function(p1)
					-- upvalues: t (ref)
					return { source = t[p1.source] or "unknown" }
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
				format = function(p1)
					-- upvalues: t (ref)
					return { source = t[p1.source] or "unknown" }
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
				format = function(p1)
					-- upvalues: t (ref)
					return { source = t[p1.source] or "unknown" }
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
				format = function(p1)
					-- upvalues: t (ref)
					return { source = t[p1.source] or "unknown" }
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
				format = function(p1)
					-- upvalues: t_1 (ref)
					return { action = t_1[p1.action] or "unknown" }
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
				format = function(p1)
					-- upvalues: t_2 (ref), t_3 (ref)
					local t = { step = t_2[p1.step] or "unknown" }
					
					if p1.status ~= nil then
						local status = p1.status
						t.status = if status == "success" or status == "failed" then status else "unknown"
					end
					if p1.reason ~= nil then
						t.reason = t_3[p1.reason] or "unknown"
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
				format = function(p1)
					return { feedType = p1.feedType }
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
				format = function(p1)
					-- upvalues: t_4 (ref)
					return {
						reason = t_4[p1.reason] or "unknown",
						feedType = p1.feedType
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
				format = function(p1)
					-- upvalues: t_5 (ref)
					return { editType = t_5[p1.editType] or "unknown" }
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
				format = function(p1)
					return { bucket = p1.bucket }
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
				format = function(p1)
					local t = {}
					local captureType = p1.captureType
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
				format = function(p1)
					-- upvalues: t_6 (ref)
					return { tool = t_6[p1.tool] or "unknown" }
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
				format = function(p1)
					-- upvalues: t_6 (ref)
					return { tool = t_6[p1.tool] or "unknown" }
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
				format = function(p1)
					local t = {}
					local status = p1.status
					t.status = if status == "succeeded" or status == "failed" or status == "filtered" then status else "unknown"
					
					return t
				end
			}
		}
	})
}