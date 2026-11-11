local CorePackages = game:GetService("CorePackages")
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local FFlagLuaAppEdpBackendV2LogUniverseIdForEvents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2LogUniverseIdForEvents
local ApiFetchExperienceDetailsPageThrottlingHundredthsPercent = game:DefineFastInt("ApiFetchExperienceDetailsPageThrottlingHundredthsPercent", 0)
local ApiFetchExperienceDetailsPageCounterThrottlingHundredthsPercent = game:DefineFastInt("ApiFetchExperienceDetailsPageCounterThrottlingHundredthsPercent", 0)
local LuaAppEdpBackendV2LogMissingFetchEventData3 = game:DefineFastFlag("LuaAppEdpBackendV2LogMissingFetchEventData3", false)
local config = {
	ParseFailure = {
		eventName = "experienceDetailsParseFailure",
		description = "\"Failed to parse data from API response\"",
		links = "https://roblox.atlassian.net/wiki/x/q4Ji4w",
		backends = if LuaAppEdpBackendV2LogMissingFetchEventData3 then {
			Default.TelemetryBackends.EventIngest,
			Default.TelemetryBackends.Points
		} else { Default.TelemetryBackends.Counter },
		throttlingPercentage = ApiFetchExperienceDetailsPageThrottlingHundredthsPercent,
		lastUpdated = { 25, 8, 7 }
	},
	MissingData = {
		eventName = "experienceDetailsMissingData",
		description = "\"Data missing from API response\"",
		links = "https://roblox.atlassian.net/wiki/x/q4Ji4w",
		backends = if LuaAppEdpBackendV2LogMissingFetchEventData3 then {
			Default.TelemetryBackends.EventIngest,
			Default.TelemetryBackends.Points
		} else { Default.TelemetryBackends.Counter },
		throttlingPercentage = ApiFetchExperienceDetailsPageThrottlingHundredthsPercent,
		lastUpdated = { 25, 8, 7 }
	},
	InvalidData = {
		eventName = "experienceDetailsInvalidData",
		description = "\"Invalid data found in API response\"",
		links = "https://roblox.atlassian.net/wiki/x/q4Ji4w",
		backends = if LuaAppEdpBackendV2LogMissingFetchEventData3 then {
			Default.TelemetryBackends.EventIngest,
			Default.TelemetryBackends.Points
		} else { Default.TelemetryBackends.Counter },
		throttlingPercentage = ApiFetchExperienceDetailsPageThrottlingHundredthsPercent,
		lastUpdated = { 25, 8, 7 }
	},
	SduiLayoutOrderConflict = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then {
		eventName = "experienceDetailsSduiLayoutOrderConflict",
		description = "\"SDUI component layout order conflicts with existing EDP layout order\"",
		links = "https://roblox.atlassian.net/wiki/x/q4Ji4w",
		backends = {
			Default.TelemetryBackends.EventIngest,
			Default.TelemetryBackends.Points
		},
		throttlingPercentage = ApiFetchExperienceDetailsPageThrottlingHundredthsPercent,
		lastUpdated = { 25, 8, 28 }
	} else nil,
	FetchRequest = {
		eventName = "experienceDetailsFetchRequest",
		description = "\"Experience details page fetch request\"",
		links = "https://roblox.atlassian.net/wiki/x/q4Ji4w",
		backends = if LuaAppEdpBackendV2LogMissingFetchEventData3 then {
			Default.TelemetryBackends.EventIngest,
			Default.TelemetryBackends.Points
		} else { Default.TelemetryBackends.Counter },
		throttlingPercentage = if LuaAppEdpBackendV2LogMissingFetchEventData3 then ApiFetchExperienceDetailsPageCounterThrottlingHundredthsPercent else ApiFetchExperienceDetailsPageThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 29 }
	},
	FetchRequestEvent = if LuaAppEdpBackendV2LogMissingFetchEventData3 then {
		eventName = "experienceDetailsFetchRequestEvent",
		description = "Experience details page fetch request",
		links = "https://roblox.atlassian.net/wiki/x/q4Ji4w",
		backends = {
			Default.TelemetryBackends.EventIngest,
			Default.TelemetryBackends.Points
		},
		throttlingPercentage = ApiFetchExperienceDetailsPageCounterThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 29 }
	} else nil,
	FetchMissingData = {
		eventName = "experienceDetailsFetchMissingData",
		description = "\"Data missing during fetch request\"",
		links = "https://roblox.atlassian.net/wiki/x/q4Ji4w",
		backends = if LuaAppEdpBackendV2LogMissingFetchEventData3 then {
			Default.TelemetryBackends.EventIngest,
			Default.TelemetryBackends.Points
		} else { Default.TelemetryBackends.Counter },
		throttlingPercentage = ApiFetchExperienceDetailsPageThrottlingHundredthsPercent,
		lastUpdated = { 25, 8, 7 }
	},
	FetchSuccess = if FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure then {
		eventName = "experienceDetailsFetchSuccess",
		description = "\"Fetch request succeeded\"",
		links = "https://roblox.atlassian.net/wiki/x/q4Ji4w",
		backends = { Default.TelemetryBackends.Counter },
		throttlingPercentage = if LuaAppEdpBackendV2LogMissingFetchEventData3 then ApiFetchExperienceDetailsPageCounterThrottlingHundredthsPercent else ApiFetchExperienceDetailsPageThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 29 }
	} else nil,
	FetchSuccessEvent = if FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure then {
		eventName = "experienceDetailsFetchSuccessEvent",
		description = "Fetch request succeeded",
		links = "https://roblox.atlassian.net/wiki/x/q4Ji4w",
		backends = {
			Default.TelemetryBackends.EventIngest,
			Default.TelemetryBackends.Points
		},
		throttlingPercentage = ApiFetchExperienceDetailsPageCounterThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 29 }
	} else nil,
	FetchFailure = if FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure then {
		eventName = "experienceDetailsFetchFailure",
		description = "\"Fetch request failed\"",
		links = "https://roblox.atlassian.net/wiki/x/q4Ji4w",
		backends = {
			Default.TelemetryBackends.Counter,
			Default.TelemetryBackends.Points
		},
		throttlingPercentage = ApiFetchExperienceDetailsPageCounterThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 29 }
	} else nil,
	FetchFailureEvent = if FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure then {
		eventName = "experienceDetailsFetchFailureEvent",
		description = "Fetch request failed",
		links = "https://roblox.atlassian.net/wiki/x/q4Ji4w",
		backends = {
			Default.TelemetryBackends.EventIngest,
			Default.TelemetryBackends.Points
		},
		throttlingPercentage = ApiFetchExperienceDetailsPageCounterThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 29 }
	} else nil,
	VisibilityVariables = {
		eventName = "experienceDetailsVisibilityVariables",
		description = "\"Visibility variables\"",
		links = "https://roblox.atlassian.net/wiki/x/q4Ji4w",
		backends = { Default.TelemetryBackends.Points },
		throttlingPercentage = ApiFetchExperienceDetailsPageThrottlingHundredthsPercent,
		lastUpdated = { 25, 11, 12 }
	}
}

function config.logParseFailure(DataType, p1)
	-- upvalues: LuaAppEdpBackendV2LogMissingFetchEventData3 (copy), Default (copy), config (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy)
	if LuaAppEdpBackendV2LogMissingFetchEventData3 then
		Default:logRobloxTelemetryEvent(config.ParseFailure, {}, {
			dataType = DataType,
			universeId = if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then p1 else nil
		})
		
		return
	else
		Default:logRobloxTelemetryCounter(config.ParseFailure, 1, { dataType = DataType })
	end
end

function config.logMissingData(DataType, p1)
	-- upvalues: LuaAppEdpBackendV2LogMissingFetchEventData3 (copy), Default (copy), config (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy)
	if LuaAppEdpBackendV2LogMissingFetchEventData3 then
		Default:logRobloxTelemetryEvent(config.MissingData, {}, {
			dataType = DataType,
			universeId = if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then p1 else nil
		})
		
		return
	else
		Default:logRobloxTelemetryCounter(config.MissingData, 1, { dataType = DataType })
	end
end

function config.logInvalidData(DataType, p1)
	-- upvalues: LuaAppEdpBackendV2LogMissingFetchEventData3 (copy), Default (copy), config (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy)
	if LuaAppEdpBackendV2LogMissingFetchEventData3 then
		Default:logRobloxTelemetryEvent(config.InvalidData, {}, {
			dataType = DataType,
			universeId = if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then p1 else nil
		})
		
		return
	else
		Default:logRobloxTelemetryCounter(config.InvalidData, 1, { dataType = DataType })
	end
end

function config.logFetchRequest(RequestType, p1)
	-- upvalues: LuaAppEdpBackendV2LogMissingFetchEventData3 (copy), config (copy), Default (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy)
	if LuaAppEdpBackendV2LogMissingFetchEventData3 and config.FetchRequestEvent then
		Default:logRobloxTelemetryEvent(config.FetchRequest, {}, {
			requestType = RequestType,
			universeId = if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then p1 else nil
		})
		Default:logRobloxTelemetryEvent(config.FetchRequestEvent, {}, {
			requestType = RequestType,
			universeId = if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then p1 else nil
		})
		
		return
	else
		Default:logRobloxTelemetryCounter(config.FetchRequest, 1, { requestType = RequestType })
	end
end

function config.logFetchMissingData(DataType, p1)
	-- upvalues: LuaAppEdpBackendV2LogMissingFetchEventData3 (copy), Default (copy), config (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy)
	if LuaAppEdpBackendV2LogMissingFetchEventData3 then
		Default:logRobloxTelemetryEvent(config.FetchMissingData, {}, {
			dataType = DataType,
			universeId = if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then p1 else nil
		})
		
		return
	else
		Default:logRobloxTelemetryCounter(config.FetchMissingData, 1, { dataType = DataType })
	end
end

if FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure and config.FetchSuccess and config.FetchSuccessEvent then
	function config.logFetchSuccess(p1)
		-- upvalues: LuaAppEdpBackendV2LogMissingFetchEventData3 (copy), Default (copy), config (copy), FFlagLuaAppEdpBackendV2LogUniverseIdForEvents (copy)
		if LuaAppEdpBackendV2LogMissingFetchEventData3 then
			Default:logRobloxTelemetryEvent(config.FetchSuccessEvent, {}, {
				universeId = if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then p1 else nil
			})
			Default:logRobloxTelemetryCounter(config.FetchSuccess, 1, {
				universeId = if FFlagLuaAppEdpBackendV2LogUniverseIdForEvents then p1 else nil
			})
			
			return
		else
			Default:logRobloxTelemetryCounter(config.FetchSuccess, 1)
		end
	end
end
if FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure and config.FetchFailure and config.FetchFailureEvent then
	function config.logFetchFailure(UniverseId, ErrorCode, ErrorMessage)
		-- upvalues: Default (copy), config (copy)
		Default:logRobloxTelemetryEvent(config.FetchFailureEvent, {}, {
			universeId = UniverseId,
			errorCode = ErrorCode,
			errorMessage = ErrorMessage
		})
		Default:logRobloxTelemetryCounter(config.FetchFailure, 1, {
			universeId = UniverseId,
			errorCode = ErrorCode,
			errorMessage = ErrorMessage
		})
	end
end
if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp) and config.SduiLayoutOrderConflict then
	function config.logSduiLayoutOrderConflict(p1)
		-- upvalues: Default (copy), config (copy)
		Default:logRobloxTelemetryEvent(config.SduiLayoutOrderConflict, {}, p1)
	end
end
if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp) and config.VisibilityVariables then
	function config.logVisibilityVariables(PresentVarsString)
		-- upvalues: Default (copy), config (copy)
		Default:logRobloxTelemetryEvent(config.VisibilityVariables, {}, { presentVarsString = PresentVarsString })
	end
end
return config