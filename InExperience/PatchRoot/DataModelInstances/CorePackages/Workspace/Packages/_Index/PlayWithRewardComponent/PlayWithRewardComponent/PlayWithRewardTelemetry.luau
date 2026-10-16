local TelemetryService = game:GetService("TelemetryService")
local FFlagSduiPlayWithRewardRefactor = require(script:FindFirstAncestor("PlayWithRewardComponent").Parent.SharedFlags).FFlagSduiPlayWithRewardRefactor
local StandardizedFields = { "addOSInfo", "addSessionInfo", "addSessionId" }
local StandardizedFields1 = { "addOSInfo" }
local config = {
	eventName = "PlayWithRewardAdRequested",
	description = "        This is fired when a Play with Reward ad is requested.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardAdRequestedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 9, 28 }
}
local config1 = {
	eventName = "PlayWithRewardAdReceived",
	description = "        This is fired when a Play with Reward ad is received.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardAdReceivedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 9, 30 }
}
local config2 = {
	eventName = "PlayWithRewardBannerShown",
	description = "        This is fired when a Play with Reward banner is shown on an EDP.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardBannerShownTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 4, 27 }
}
local config3 = {
	eventName = "PlayWithRewardButtonClicked",
	description = "        This is fired when a Play with Reward button is clicked on an EDP.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardButtonClickedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 25, 9, 24 }
}
local config4 = {
	eventName = "PlayWithRewardAdPlaybackAttempted",
	description = "        This is fired when a Play with Reward ad starts playing.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardAdPlaybackAttemptedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 25, 9, 24 }
}
local config5 = {
	eventName = "PlayWithRewardAdPlaybackStopped",
	description = "        This is fired when a Play with Reward ad stops playing.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardAdPlaybackStoppedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 25, 9, 24 }
}
local config6 = {
	eventName = "PlayWithRewardGameJoinInitiated",
	description = "        This is fired when a Play with Reward game join is initiated from an EDP.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardGameJoinInitiatedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 25, 9, 24 }
}
local config7 = {
	eventName = "PlayWithRewardBlackoutCurtain",
	description = "        This is fired when the Play with Reward blackout curtain state changes (shown or hidden).\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardBlackoutCurtainTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 4, 3 }
}
local config8 = {
	eventName = "PlayWithRewardShimmerShown",
	description = "        This is fired when the Play with Reward shimmer is shown.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardShimmerShownTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 4, 28 }
}
local config9 = {
	eventName = "PlayWithRewardCoachmark",
	description = "        This is fired when a Play with Reward coachmark is shown or dismissed on an EDP.\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("PlayWithRewardCoachmarkTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 4, 21 }
}
local config10 = {
	eventName = "PlayWithRewardAdRequestedCounter",
	description = "\t        Counter for PlayWithRewardAdRequested events.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 25, 9, 24 }
}
local config11 = {
	eventName = "PlayWithRewardAdReceivedCounter",
	description = "\t        Counter for PlayWithRewardAdReceived events with status.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 25, 9, 24 }
}
local config12 = {
	eventName = "PlayWithRewardBannerShownCounter",
	description = "\t        Counter for PlayWithRewardBannerShown events.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 4, 27 }
}
local config13 = {
	eventName = "PlayWithRewardButtonClickedCounter",
	description = "\t        Counter for PlayWithRewardButtonClicked events.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 25, 9, 24 }
}
local config14 = {
	eventName = "PlayWithRewardAdPlaybackAttemptedCounter",
	description = "\t        Counter for PlayWithRewardAdPlaybackAttempted events.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 25, 9, 24 }
}
local config15 = {
	eventName = "PlayWithRewardAdPlaybackStoppedCounter",
	description = "\t        Counter for PlayWithRewardAdPlaybackStopped events with status.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 25, 9, 24 }
}
local config16 = {
	eventName = "PlayWithRewardGameJoinInitiatedCounter",
	description = "\t        Counter for PlayWithRewardGameJoinInitiated events.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 25, 9, 24 }
}
local config17 = {
	eventName = "PlayWithRewardCoachmarkCounter",
	description = "\t        Counter for PlayWithRewardCoachmark events, split by action.\n\t    ",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 4, 21 }
}
local config18 = {
	eventName = "PlayWithRewardAdReceivedSuccessfully",
	description = "\t        Stats for successful PlayWithRewardAdReceived events.\n\t    ",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 25, 9, 24 }
}

local function _(Action, PlayWithRewardFlowId, UniverseId, ProductId) --[[ Line: 241 | Named "getCoachmarkCustomFields" ]]
	return {
		action = Action,
		playWithRewardFlowId = PlayWithRewardFlowId,
		universeId = UniverseId,
		productId = ProductId
	}
end

return {
	logPlayWithRewardAdRequested = function(PlayWithRewardFlowId, UniverseId, p1) --[[ Line: 250 ]]
		-- upvalues: FFlagSduiPlayWithRewardRefactor (copy), TelemetryService (copy), config (copy), StandardizedFields (copy), config10 (copy), StandardizedFields1 (copy)
		TelemetryService:LogEvent(config, {
			standardizedFields = StandardizedFields,
			customFields = {
				playWithRewardFlowId = PlayWithRewardFlowId,
				universeId = UniverseId,
				experimentUiVariant = if FFlagSduiPlayWithRewardRefactor then p1 else nil
			}
		})
		TelemetryService:LogCounter(config10, {
			standardizedFields = StandardizedFields1,
			customFields = {}
		}, 1)
	end,
	logPlayWithRewardAdReceived = function(PlayWithRewardFlowId, UniverseId, IsSuccessful, AdAvailabilityResult, FetchLatencyMs, ProductId, p1) --[[ Line: 275 ]]
		-- upvalues: FFlagSduiPlayWithRewardRefactor (copy), TelemetryService (copy), config1 (copy), StandardizedFields (copy), config11 (copy), StandardizedFields1 (copy), config18 (copy)
		TelemetryService:LogEvent(config1, {
			standardizedFields = StandardizedFields,
			customFields = {
				playWithRewardFlowId = PlayWithRewardFlowId,
				universeId = UniverseId,
				isSuccessful = IsSuccessful,
				adAvailabilityResult = AdAvailabilityResult,
				fetchLatencyMs = FetchLatencyMs,
				productId = ProductId,
				experimentUiVariant = if FFlagSduiPlayWithRewardRefactor then p1 else nil
			}
		})
		TelemetryService:LogCounter(config11, {
			standardizedFields = StandardizedFields1,
			customFields = {
				isSuccessful = IsSuccessful,
				adAvailabilityResult = AdAvailabilityResult
			}
		}, 1)
		
		if IsSuccessful then
			TelemetryService:LogStat(config18, {
				standardizedFields = StandardizedFields1,
				customFields = { adAvailabilityResult = AdAvailabilityResult }
			}, FetchLatencyMs)
		end
	end,
	logPlayWithRewardBannerShown = function(PlayWithRewardFlowId, UniverseId, ShowState, ProductId, ExperimentUiVariant) --[[ Line: 320 ]]
		-- upvalues: TelemetryService (copy), config2 (copy), StandardizedFields (copy), config12 (copy), StandardizedFields1 (copy)
		TelemetryService:LogEvent(config2, {
			standardizedFields = StandardizedFields,
			customFields = {
				playWithRewardFlowId = PlayWithRewardFlowId,
				universeId = UniverseId,
				showState = ShowState,
				productId = ProductId,
				experimentUiVariant = ExperimentUiVariant
			}
		})
		TelemetryService:LogCounter(config12, {
			standardizedFields = StandardizedFields1,
			customFields = {}
		}, 1)
	end,
	logPlayWithRewardButtonClicked = function(PlayWithRewardFlowId, UniverseId, ProductId) --[[ Line: 349 ]]
		-- upvalues: TelemetryService (copy), config3 (copy), StandardizedFields (copy), config13 (copy), StandardizedFields1 (copy)
		TelemetryService:LogEvent(config3, {
			standardizedFields = StandardizedFields,
			customFields = {
				playWithRewardFlowId = PlayWithRewardFlowId,
				universeId = UniverseId,
				productId = ProductId
			}
		})
		TelemetryService:LogCounter(config13, {
			standardizedFields = StandardizedFields1,
			customFields = {}
		}, 1)
	end,
	logPlayWithRewardAdPlaybackAttempted = function(PlayWithRewardFlowId, UniverseId, ProductId) --[[ Line: 370 ]]
		-- upvalues: TelemetryService (copy), config4 (copy), StandardizedFields (copy), config14 (copy), StandardizedFields1 (copy)
		TelemetryService:LogEvent(config4, {
			standardizedFields = StandardizedFields,
			customFields = {
				playWithRewardFlowId = PlayWithRewardFlowId,
				universeId = UniverseId,
				productId = ProductId
			}
		})
		TelemetryService:LogCounter(config14, {
			standardizedFields = StandardizedFields1,
			customFields = {}
		}, 1)
	end,
	logPlayWithRewardAdPlaybackStopped = function(PlayWithRewardFlowId, UniverseId, AdPlaybackStatus, ProductId) --[[ Line: 395 ]]
		-- upvalues: TelemetryService (copy), config5 (copy), StandardizedFields (copy), config15 (copy), StandardizedFields1 (copy)
		TelemetryService:LogEvent(config5, {
			standardizedFields = StandardizedFields,
			customFields = {
				playWithRewardFlowId = PlayWithRewardFlowId,
				universeId = UniverseId,
				adPlaybackStatus = AdPlaybackStatus,
				productId = ProductId
			}
		})
		TelemetryService:LogCounter(config15, {
			standardizedFields = StandardizedFields1,
			customFields = { adPlaybackStatus = AdPlaybackStatus }
		}, 1)
	end,
	logPlayWithRewardGameJoinInitiated = function(PlayWithRewardFlowId, UniverseId, ProductId) --[[ Line: 422 ]]
		-- upvalues: TelemetryService (copy), config6 (copy), StandardizedFields (copy), config16 (copy), StandardizedFields1 (copy)
		TelemetryService:LogEvent(config6, {
			standardizedFields = StandardizedFields,
			customFields = {
				playWithRewardFlowId = PlayWithRewardFlowId,
				universeId = UniverseId,
				productId = ProductId
			}
		})
		TelemetryService:LogCounter(config16, {
			standardizedFields = StandardizedFields1,
			customFields = {}
		}, 1)
	end,
	logPlayWithRewardBlackoutCurtainAction = function(PlayWithRewardFlowId, UniverseId, Action, ProductId) --[[ Line: 447 ]]
		-- upvalues: TelemetryService (copy), config7 (copy), StandardizedFields (copy)
		TelemetryService:LogEvent(config7, {
			standardizedFields = StandardizedFields,
			customFields = {
				playWithRewardFlowId = PlayWithRewardFlowId,
				universeId = UniverseId,
				action = Action,
				productId = ProductId
			}
		})
	end,
	logPlayWithRewardShimmerShown = function(PlayWithRewardFlowId, UniverseId) --[[ Line: 466 ]]
		-- upvalues: TelemetryService (copy), config8 (copy), StandardizedFields (copy)
		TelemetryService:LogEvent(config8, {
			standardizedFields = StandardizedFields,
			customFields = {
				playWithRewardFlowId = PlayWithRewardFlowId,
				universeId = UniverseId
			}
		})
	end,
	logPlayWithRewardCoachmark = function(Action, PlayWithRewardFlowId, UniverseId, ProductId) --[[ Line: 478 ]]
		-- upvalues: TelemetryService (copy), config9 (copy), StandardizedFields (copy), config17 (copy), StandardizedFields1 (copy)
		TelemetryService:LogEvent(config9, {
			standardizedFields = StandardizedFields,
			customFields = {
				action = Action,
				playWithRewardFlowId = PlayWithRewardFlowId,
				universeId = UniverseId,
				productId = ProductId
			}
		})
		TelemetryService:LogCounter(config17, {
			standardizedFields = StandardizedFields1,
			customFields = { action = Action }
		}, 1)
	end
}