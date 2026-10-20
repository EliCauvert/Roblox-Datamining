local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("MomentsCommon").Parent.SocialLuaAnalytics)
local SupportedTelemetryBackends = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local RealtimeEventNamesModule = require(script.Parent.RealtimeEventNames)
local Telemetry = SocialLuaAnalyticsModule.Telemetry
local config = {
	watch_tab = "watch_tab",
	deeplink = "deeplink",
	profile = "profile",
	flyout_menu = "flyout_menu"
}

local function _(p1)
	-- upvalues: config (copy)
	return config[p1] or "unknown"
end

local function normalizeRequestFailureReason(p1)
	return if p1 == nil or p1 == "" then "unknown" elseif p1 == "requestFailed" or p1 == "malformedResponse" then p1 else "unknown"
end

local function normalizeMediaFailureReason(Text: string): string
	return if Text == nil or Text == "" then "unknown" elseif string.find(Text, "video load errored:", 1, true) == 1 then "videoLoadErrored" elseif string.find(Text, "video load failed:", 1, true) == 1 then "videoLoadFailed" elseif string.find(Text, "screenshot load failed:", 1, true) == 1 then "screenshotLoadFailed" else "unknown"
end

local config1 = {
	reaction_add = "reaction_add",
	reaction_remove = "reaction_remove",
	share = "share",
	join = "join",
	report = "report",
	report_click = "report_click"
}

local _ = function(p1)
	-- upvalues: config1 (copy)
	return config1[p1] or "unknown"
end

local config2 = {
	create_intent = "create_intent",
	gallery_selected = "gallery_selected",
	published = "published",
	upload = "upload",
	post_review = "post_review"
}

local _ = function(p1)
	-- upvalues: config2 (copy)
	return config2[p1] or "unknown"
end

local _ = function(p1)
	return if p1 == "success" or p1 == "failed" then p1 else "unknown"
end

local config3 = {
	Moderated = "moderated",
	CaptureModerated = "moderated",
	UploadQuotaReached = "quota",
	Timeout = "timeout",
	StartUploadFailed = "startFailed",
	RegistrationFailed = "registrationFailed",
	PollError = "pollError",
	NetworkError = "network",
	ServerError = "serverError",
	InvalidRequest = "invalidRequest",
	GenericFailure = "generic"
}

local _ = function(p1)
	-- upvalues: config3 (copy)
	return config3[p1] or "unknown"
end

local config4 = {
	malformed = "malformed",
	duplicate = "duplicate",
	moderated = "moderated",
	deleted = "deleted"
}

local _ = function(p1)
	-- upvalues: config4 (copy)
	return config4[p1] or "unknown"
end

local config5 = {
	music = "music",
	trim = "trim",
	text_overlay = "text_overlay",
	sticker = "sticker",
	description = "description",
	tts = "tts"
}

local _ = function(p1)
	-- upvalues: config5 (copy)
	return config5[p1] or "unknown"
end

local config6 = {
	music = "music",
	trim = "trim",
	text = "text",
	sticker = "sticker",
	generateText = "generateText",
	voice = "voice"
}

local _ = function(p1)
	-- upvalues: config6 (copy)
	return config6[p1] or "unknown"
end

local _ = function(p1)
	return if p1 == "screenshot" or p1 == "video" then p1 else "unknown"
end

local _ = function(p1)
	return if p1 == "succeeded" or p1 == "failed" or p1 == "filtered" then p1 else "unknown"
end

local _ = function(p1)
	return if p1 == "watch_tab" or p1 == "profile" then p1 else "unknown"
end

local config7 = {
	attempted = "attempted",
	succeeded = "succeeded",
	failed = "failed"
}

local _ = function(p1)
	-- upvalues: config7 (copy)
	return config7[p1] or "unknown"
end

local config8 = {
	initial = "initial",
	pagination = "pagination",
	refresh = "refresh"
}

local _ = function(p1)
	-- upvalues: config8 (copy)
	return config8[p1] or "unknown"
end

local config9 = {
	attempted = "attempted",
	success = "success",
	rejected = "rejected",
	failed = "failed",
	unknown = "unknown",
	cancelled = "cancelled"
}

local _ = function(p1)
	-- upvalues: config9 (copy)
	return config9[p1] or "unknown"
end

local _ = function(Text: string): string
	return if Text == nil or string.find(Text, "^unknown_") ~= nil then "unknown" else Text
end

local config10 = { rejected = true, failed = true, unknown = true }
local config11 = {
	attempted = "attempted",
	succeeded = "succeeded",
	failed = "failed"
}

local _ = function(p1)
	-- upvalues: config11 (copy)
	return config11[p1] or "unknown"
end

local _ = function(p1)
	return if p1 == "add" or p1 == "remove" then p1 else "unknown"
end

local _ = function(p1)
	-- upvalues: config11 (copy)
	return if p1 == "already_deleted" then p1 else config11[p1] or "unknown"
end

local _ = function(p1)
	return if p1 == "clicked" then p1 else "unknown"
end

local _ = function(p1, Callback)
	local config = { status = p1.status, feedType = p1.feedType }
	
	if p1.status == "failed" then
		config.failureReason = Callback(p1.failureReason)
	end
	return config
end

return {
	[RealtimeEventNamesModule.MomentsFeedLoadAttempt] = Telemetry.new({
		description = "Counts Moments feed load attempts in real time, providing the denominator for feed outcome rates.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsFeedLoadAttempt,
		lastUpdated = { 2026, 7, 30 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					return { feedType = p1.feedType }
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsFeedState] = Telemetry.new({
		description = "Counts completed Moments top-of-feed outcomes in real time, dimensioned by status, feed type, and bounded failure reason.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsFeedState,
		lastUpdated = { 2026, 7, 30 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					local config = { status = p1.status, feedType = p1.feedType }
					
					if p1.status == "failed" then
						local FailureReason = p1.failureReason
						config.failureReason = if FailureReason == nil or FailureReason == "" then "unknown" elseif FailureReason == "requestFailed" or FailureReason == "malformedResponse" then FailureReason else "unknown"
					end
					return config
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsFeedLoadMore] = Telemetry.new({
		description = "Counts attempted and failed Moments pagination requests in real time.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsFeedLoadMore,
		lastUpdated = { 2026, 7, 30 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: normalizeRequestFailureReason (copy)
					local config = { status = p1.status, feedType = p1.feedType }
					
					if p1.status == "failed" then
						local FailureReason = p1.failureReason
						config.failureReason = if FailureReason == nil or FailureReason == "" then "unknown" elseif FailureReason == "requestFailed" or FailureReason == "malformedResponse" then FailureReason else "unknown"
					end
					return config
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsFeedMediaLoad] = Telemetry.new({
		description = "Counts attempted and failed unique Moments media loads in the coordinator download window.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsFeedMediaLoad,
		lastUpdated = { 2026, 7, 30 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: normalizeMediaFailureReason (copy)
					local config = { status = p1.status, feedType = p1.feedType }
					
					if p1.status == "failed" then
						config.failureReason = normalizeMediaFailureReason(p1.failureReason)
					end
					return config
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsSurfaceLoadAbort] = Telemetry.new({
		description = "Counts Moments surface loads that end before the first frame, dimensioned by bounded abort reason.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsSurfaceLoadAbort,
		lastUpdated = { 2026, 7, 30 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					return { reason = p1.reason }
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsViewBegan] = Telemetry.new({
		description = "Counts Moments views in real time, dimensioned by a bounded source.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsViewBegan,
		lastUpdated = { 2026, 7, 30 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: config (copy)
					return { source = config[p1.source] or "unknown" }
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsSessionStarted] = Telemetry.new({
		description = "Counts Moments session starts in real time, dimensioned by a bounded entry source.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsSessionStarted,
		lastUpdated = { 2026, 8, 1 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: config (copy)
					return { source = config[p1.source] or "unknown" }
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsSessionEnded] = Telemetry.new({
		description = "Counts Moments session ends in real time, dimensioned by a bounded entry source.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsSessionEnded,
		lastUpdated = { 2026, 8, 1 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: config (copy)
					return { source = config[p1.source] or "unknown" }
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsSessionHeartbeat] = Telemetry.new({
		description = "Counts periodic heartbeats emitted while a Moments session is active; multiply the per-second rate by the heartbeat interval to estimate concurrent sessions (CCU).",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsSessionHeartbeat,
		lastUpdated = { 2026, 8, 1 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: config (copy)
					return { source = config[p1.source] or "unknown" }
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsEngagement] = Telemetry.new({
		description = "Counts Moments engagement actions (reactions, shares, joins, report submissions, report clicks, experience-detail opens) in real time, dimensioned by a bounded action.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsEngagement,
		lastUpdated = { 2026, 10, 2 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: config1 (copy)
					return { action = config1[p1.action] or "unknown" }
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsCreationStep] = Telemetry.new({
		description = "Counts Moments creation-flow steps in real time, dimensioned by bounded step and (for upload) status.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsCreationStep,
		lastUpdated = { 2026, 8, 1 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: config2 (copy), config3 (copy)
					local config = { step = config2[p1.step] or "unknown" }
					
					if p1.status ~= nil then
						local Status = p1.status
						config.status = if Status == "success" or Status == "failed" then Status else "unknown"
					end
					if p1.reason ~= nil then
						config.reason = config3[p1.reason] or "unknown"
					end
					return config
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsFeedItemsReceived] = Telemetry.new({
		description = "Counts feed items received from the backend before client-side filtering; the denominator for the filtered-item rate.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsFeedItemsReceived,
		lastUpdated = { 2026, 8, 5 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					return { feedType = p1.feedType }
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsFeedItemFiltered] = Telemetry.new({
		description = "Counts feed items the client dropped, dimensioned by bounded reason. deleted/moderated are dropped by the feed source's availability filter; malformed/duplicate are dropped by the feed store's dedupe. Denominator is MomentsFeedItemsReceived.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsFeedItemFiltered,
		lastUpdated = { 2026, 8, 5 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: config4 (copy)
					return {
						reason = config4[p1.reason] or "unknown",
						feedType = p1.feedType
					}
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsPublishedWithEdit] = Telemetry.new({
		description = "Counts published moments carrying each edit type (one increment per edit type present), dimensioned by bounded editType.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsPublishedWithEdit,
		lastUpdated = { 2026, 8, 5 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: config5 (copy)
					return { editType = config5[p1.editType] or "unknown" }
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsPublishedEditCount] = Telemetry.new({
		description = "Counts published moments by how many edit types they carry, dimensioned by a bounded bucket (0/1/2/3plus).",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsPublishedEditCount,
		lastUpdated = { 2026, 8, 5 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					return { bucket = p1.bucket }
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsPublishedByCaptureType] = Telemetry.new({
		description = "Counts published moments by bounded capture type (screenshot/video).",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsPublishedByCaptureType,
		lastUpdated = { 2026, 8, 5 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					local CaptureType = p1.captureType
					
					return {
						captureType = if CaptureType == "screenshot" or CaptureType == "video" then CaptureType else "unknown"
					}
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsEditToolOpened] = Telemetry.new({
		description = "Counts creation edit-tool opens, dimensioned by bounded tool (music/trim/text/sticker/generateText/voice).",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsEditToolOpened,
		lastUpdated = { 2026, 8, 5 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: config6 (copy)
					return { tool = config6[p1.tool] or "unknown" }
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsEditToolAbandoned] = Telemetry.new({
		description = "Counts creation edit-tool cancels (Back without applying), dimensioned by bounded tool. Pairs with MomentsEditToolOpened for an open→apply conversion.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsEditToolAbandoned,
		lastUpdated = { 2026, 8, 5 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: config6 (copy)
					return { tool = config6[p1.tool] or "unknown" }
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsGenerateText] = Telemetry.new({
		description = "Counts AI generate-text attempts by bounded status (succeeded/failed/filtered).",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsGenerateText,
		lastUpdated = { 2026, 8, 17 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					local Status = p1.status
					
					return {
						status = if Status == "succeeded" or Status == "failed" or Status == "filtered" then Status else "unknown"
					}
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsCommentsListLoad] = Telemetry.new({
		description = "Counts Moments comment list requests in real time by bounded status, load type, surface and (failed only) failure reason. Mirrors the product list-load events.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsCommentsListLoad,
		lastUpdated = { 2026, 9, 29 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: config7 (copy), config8 (copy)
					local Entry = config7[p1.status] or "unknown"
					local Surface = p1.surface
					local config = {
						status = Entry,
						loadType = config8[p1.loadType] or "unknown",
						surface = if Surface == "watch_tab" or Surface == "profile" then Surface else "unknown"
					}
					
					if Entry == "failed" then
						local FailureReason: string = p1.failureReason
						config.failureReason = if FailureReason == nil or string.find(FailureReason, "^unknown_") ~= nil then "unknown" else FailureReason
					end
					return config
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsCommentPost] = Telemetry.new({
		description = "Counts Moments comment post requests and outcomes in real time by bounded status, surface and (rejected/failed/unknown only) failure reason. Mirrors the product post events.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsCommentPost,
		lastUpdated = { 2026, 9, 29 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: config9 (copy), config10 (copy)
					local Entry = config9[p1.status] or "unknown"
					local Surface = p1.surface
					local config = {
						status = Entry,
						surface = if Surface == "watch_tab" or Surface == "profile" then Surface else "unknown"
					}
					
					if config10[Entry] then
						local FailureReason: string = p1.failureReason
						config.failureReason = if FailureReason == nil or string.find(FailureReason, "^unknown_") ~= nil then "unknown" else FailureReason
					end
					return config
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsCommentReaction] = Telemetry.new({
		description = "Counts Moments comment reaction requests in real time, one attempt per network request including retries, by bounded status, action (add/remove), surface and (failed only) failure reason.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsCommentReaction,
		lastUpdated = { 2026, 10, 1 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: config11 (copy)
					local Entry = config11[p1.status] or "unknown"
					local Action = p1.action
					local Action1 = if Action == "add" or Action == "remove" then Action else "unknown"
					local Surface = p1.surface
					local config = {
						status = Entry,
						action = Action1,
						surface = if Surface == "watch_tab" or Surface == "profile" then Surface else "unknown"
					}
					
					if Entry == "failed" then
						local FailureReason: string = p1.failureReason
						config.failureReason = if FailureReason == nil or string.find(FailureReason, "^unknown_") ~= nil then "unknown" else FailureReason
					end
					return config
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsCommentDelete] = Telemetry.new({
		description = "Counts Moments comment delete requests and outcomes in real time by bounded status (already_deleted = the server reported the comment gone), surface and (failed only) failure reason.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsCommentDelete,
		lastUpdated = { 2026, 10, 1 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: config11 (copy)
					local Status = p1.status
					local Status1 = if Status == "already_deleted" then Status else config11[Status] or "unknown"
					local Surface = p1.surface
					local config = {
						status = Status1,
						surface = if Surface == "watch_tab" or Surface == "profile" then Surface else "unknown"
					}
					
					if Status1 == "failed" then
						local FailureReason: string = p1.failureReason
						config.failureReason = if FailureReason == nil or string.find(FailureReason, "^unknown_") ~= nil then "unknown" else FailureReason
					end
					return config
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsCommentReport] = Telemetry.new({
		description = "Counts Moments comment report flow opens in real time by surface, including Block and Report. Counted at the same point as the product report-click event; submission happens in the host abuse-report flow.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsCommentReport,
		lastUpdated = { 2026, 10, 1 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					local Status = p1.status
					local Surface = p1.surface
					
					return {
						status = if Status == "clicked" then Status else "unknown",
						surface = if Surface == "watch_tab" or Surface == "profile" then Surface else "unknown"
					}
				end
			}
		}
	}),
	[RealtimeEventNamesModule.MomentsCommentAuthorBlock] = Telemetry.new({
		description = "Counts blocks of a comment author started from a Moments comment in real time by bounded status (attempted on confirm, then succeeded/failed) and surface.",
		throttlingThousandths = 10000,
		name = RealtimeEventNamesModule.MomentsCommentAuthorBlock,
		lastUpdated = { 2026, 10, 1 },
		backendsList = {
			{
				incrementValue = 1,
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				format = function(p1)
					-- upvalues: config11 (copy)
					local Surface = p1.surface
					
					return {
						status = config11[p1.status] or "unknown",
						surface = if Surface == "watch_tab" or Surface == "profile" then Surface else "unknown"
					}
				end
			}
		}
	})
}