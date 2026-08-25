local telemetryService = game:GetService("TelemetryService")
local list = { "addOSInfo", "addSessionInfo", "addSessionId" }
local list_1 = { "addOSInfo" }
local t = {
	eventName = "PlayWithRewardAdRequested",
	description = "        This is fired when a Play with Reward ad is requested.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardAdRequestedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 25, 9, 24 }
}
local t_1 = {
	eventName = "PlayWithRewardAdReceived",
	description = "        This is fired when a Play with Reward ad is received.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardAdReceivedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 25, 9, 24 }
}
local t_2 = {
	eventName = "PlayWithRewardBannerShown",
	description = "        This is fired when a Play with Reward banner is shown on an EDP.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardBannerShownTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 4, 27 }
}
local t_3 = {
	eventName = "PlayWithRewardButtonClicked",
	description = "        This is fired when a Play with Reward button is clicked on an EDP.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardButtonClickedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 25, 9, 24 }
}
local t_4 = {
	eventName = "PlayWithRewardAdPlaybackAttempted",
	description = "        This is fired when a Play with Reward ad starts playing.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardAdPlaybackAttemptedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 25, 9, 24 }
}
local t_5 = {
	eventName = "PlayWithRewardAdPlaybackStopped",
	description = "        This is fired when a Play with Reward ad stops playing.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardAdPlaybackStoppedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 25, 9, 24 }
}
local t_6 = {
	eventName = "PlayWithRewardGameJoinInitiated",
	description = "        This is fired when a Play with Reward game join is initiated from an EDP.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardGameJoinInitiatedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 25, 9, 24 }
}
local t_7 = {
	eventName = "PlayWithRewardBlackoutCurtain",
	description = "        This is fired when the Play with Reward blackout curtain state changes (shown or hidden).\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardBlackoutCurtainTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 4, 3 }
}
local t_8 = {
	eventName = "PlayWithRewardShimmerShown",
	description = "        This is fired when the Play with Reward shimmer is shown.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardShimmerShownTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 4, 28 }
}
local t_9 = {
	eventName = "PlayWithRewardCoachmark",
	description = "        This is fired when a Play with Reward coachmark is shown or dismissed on an EDP.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardCoachmarkTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 4, 21 }
}
local t_10 = {
	eventName = "PlayWithRewardAdRequestedCounter",
	description = "\t        Counter for PlayWithRewardAdRequested events.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 25, 9, 24 }
}
local t_11 = {
	eventName = "PlayWithRewardAdReceivedCounter",
	description = "\t        Counter for PlayWithRewardAdReceived events with status.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 25, 9, 24 }
}
local t_12 = {
	eventName = "PlayWithRewardBannerShownCounter",
	description = "\t        Counter for PlayWithRewardBannerShown events.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 4, 27 }
}
local t_13 = {
	eventName = "PlayWithRewardButtonClickedCounter",
	description = "\t        Counter for PlayWithRewardButtonClicked events.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 25, 9, 24 }
}
local t_14 = {
	eventName = "PlayWithRewardAdPlaybackAttemptedCounter",
	description = "\t        Counter for PlayWithRewardAdPlaybackAttempted events.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 25, 9, 24 }
}
local t_15 = {
	eventName = "PlayWithRewardAdPlaybackStoppedCounter",
	description = "\t        Counter for PlayWithRewardAdPlaybackStopped events with status.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 25, 9, 24 }
}
local t_16 = {
	eventName = "PlayWithRewardGameJoinInitiatedCounter",
	description = "\t        Counter for PlayWithRewardGameJoinInitiated events.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 25, 9, 24 }
}
local t_17 = {
	eventName = "PlayWithRewardCoachmarkCounter",
	description = "\t        Counter for PlayWithRewardCoachmark events, split by action.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 4, 21 }
}
local t_18 = {
	eventName = "PlayWithRewardAdReceivedSuccessfully",
	description = "\t        Stats for successful PlayWithRewardAdReceived events.\n\t    ",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 25, 9, 24 }
}

local function _(p0, p1, p2, p3)
	return {
		action = p0,
		playWithRewardFlowId = p1,
		universeId = p2,
		productId = p3
	}
end

return {
	logPlayWithRewardAdRequested = function(p4, p5)
		-- upvalues: telemetryService (ref), t (ref), list (ref), t_10 (ref), list_1 (ref)
		telemetryService:LogEvent(t, {
			standardizedFields = list,
			customFields = { playWithRewardFlowId = p4, universeId = p5 }
		})
		telemetryService:LogCounter(t_10, { standardizedFields = list_1, customFields = {} }, 1)
	end,
	logPlayWithRewardAdReceived = function(p6, p7, p8, p9, p10, p11)
		-- upvalues: telemetryService (ref), t_1 (ref), list (ref), t_11 (ref), list_1 (ref), t_18 (ref)
		telemetryService:LogEvent(t_1, {
			standardizedFields = list,
			customFields = {
				playWithRewardFlowId = p6,
				universeId = p7,
				isSuccessful = p8,
				adAvailabilityResult = p9,
				fetchLatencyMs = p10,
				productId = p11
			}
		})
		telemetryService:LogCounter(t_11, {
			standardizedFields = list_1,
			customFields = { isSuccessful = p8, adAvailabilityResult = p9 }
		}, 1)
		
		if p8 then
			telemetryService:LogStat(t_18, {
				standardizedFields = list_1,
				customFields = { adAvailabilityResult = p9 }
			}, p10)
		end
	end,
	logPlayWithRewardBannerShown = function(p12, p13, p14, p15, p16)
		-- upvalues: telemetryService (ref), t_2 (ref), list (ref), t_12 (ref), list_1 (ref)
		telemetryService:LogEvent(t_2, {
			standardizedFields = list,
			customFields = {
				playWithRewardFlowId = p12,
				universeId = p13,
				showState = p14,
				productId = p15,
				experimentUiVariant = p16
			}
		})
		telemetryService:LogCounter(t_12, { standardizedFields = list_1, customFields = {} }, 1)
	end,
	logPlayWithRewardButtonClicked = function(p17, p18, p19)
		-- upvalues: telemetryService (ref), t_3 (ref), list (ref), t_13 (ref), list_1 (ref)
		telemetryService:LogEvent(t_3, {
			standardizedFields = list,
			customFields = {
				playWithRewardFlowId = p17,
				universeId = p18,
				productId = p19
			}
		})
		telemetryService:LogCounter(t_13, { standardizedFields = list_1, customFields = {} }, 1)
	end,
	logPlayWithRewardAdPlaybackAttempted = function(p20, p21, p22)
		-- upvalues: telemetryService (ref), t_4 (ref), list (ref), t_14 (ref), list_1 (ref)
		telemetryService:LogEvent(t_4, {
			standardizedFields = list,
			customFields = {
				playWithRewardFlowId = p20,
				universeId = p21,
				productId = p22
			}
		})
		telemetryService:LogCounter(t_14, { standardizedFields = list_1, customFields = {} }, 1)
	end,
	logPlayWithRewardAdPlaybackStopped = function(p23, p24, p25, p26)
		-- upvalues: telemetryService (ref), t_5 (ref), list (ref), t_15 (ref), list_1 (ref)
		telemetryService:LogEvent(t_5, {
			standardizedFields = list,
			customFields = {
				playWithRewardFlowId = p23,
				universeId = p24,
				adPlaybackStatus = p25,
				productId = p26
			}
		})
		telemetryService:LogCounter(t_15, {
			standardizedFields = list_1,
			customFields = { adPlaybackStatus = p25 }
		}, 1)
	end,
	logPlayWithRewardGameJoinInitiated = function(p27, p28, p29)
		-- upvalues: telemetryService (ref), t_6 (ref), list (ref), t_16 (ref), list_1 (ref)
		telemetryService:LogEvent(t_6, {
			standardizedFields = list,
			customFields = {
				playWithRewardFlowId = p27,
				universeId = p28,
				productId = p29
			}
		})
		telemetryService:LogCounter(t_16, { standardizedFields = list_1, customFields = {} }, 1)
	end,
	logPlayWithRewardBlackoutCurtainAction = function(p30, p31, p32, p33)
		-- upvalues: telemetryService (ref), t_7 (ref), list (ref)
		telemetryService:LogEvent(t_7, {
			standardizedFields = list,
			customFields = {
				playWithRewardFlowId = p30,
				universeId = p31,
				action = p32,
				productId = p33
			}
		})
	end,
	logPlayWithRewardShimmerShown = function(p34, p35)
		-- upvalues: telemetryService (ref), t_8 (ref), list (ref)
		telemetryService:LogEvent(t_8, {
			standardizedFields = list,
			customFields = { playWithRewardFlowId = p34, universeId = p35 }
		})
	end,
	logPlayWithRewardCoachmark = function(p36, p37, p38, p39)
		-- upvalues: telemetryService (ref), t_9 (ref), list (ref), t_17 (ref), list_1 (ref)
		telemetryService:LogEvent(t_9, {
			standardizedFields = list,
			customFields = {
				action = p36,
				playWithRewardFlowId = p37,
				universeId = p38,
				productId = p39
			}
		})
		telemetryService:LogCounter(t_17, {
			standardizedFields = list_1,
			customFields = { action = p36 }
		}, 1)
	end
}