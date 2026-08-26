local parent = script:FindFirstAncestor("AppChat").Parent
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local cryoModule = require(parent.Cryo)
local list = { "addSessionInfo", "addOSInfo" }
local appChatExcludeStandardizedFieldsFromCounters = game:DefineFastFlag("AppChatExcludeStandardizedFieldsFromCounters", false)

local function _(_, p1)
	return {
		placement = p1.placement,
		entryPoint = p1.entryPoint,
		hasActiveParty = p1.currentSquadId ~= nil
	}
end

local function namedCounterConfigurationAndFormat(p1, p2)
	-- upvalues: socialLuaAnalyticsModule (ref), cryoModule (ref), appChatExcludeStandardizedFieldsFromCounters (ref), list (ref)
	return {
		throttlingThousandths = nil,
		type = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.RobloxTelemetryCounter,
		overrideName = function()
			-- upvalues: p1 (ref)
			return p1
		end,
		format = function(p3, p4)
			-- upvalues: cryoModule (copy), p2 (ref)
			return cryoModule.Dictionary.join({
				placement = p4.placement,
				entryPoint = p4.entryPoint,
				hasActiveParty = p4.currentSquadId ~= nil
			}, p2(p3, p4))
		end,
		standardizedFields = if appChatExcludeStandardizedFieldsFromCounters then nil else list
	}
end

local function namedCounterConfigurationNoEmittedInfo(p1)
	-- upvalues: namedCounterConfigurationAndFormat (ref)
	return namedCounterConfigurationAndFormat(p1, function(_, _)
		return {}
	end)
end

local _ = function(_, p1)
	return {
		placement = p1.placement,
		entryPoint = p1.entryPoint,
		hasActiveParty = p1.currentSquadId ~= nil
	}
end

local function namedStatConfigurationAndFormat(p1, p2)
	-- upvalues: socialLuaAnalyticsModule (ref), cryoModule (ref), appChatExcludeStandardizedFieldsFromCounters (ref), list (ref)
	return {
		throttlingThousandths = nil,
		type = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.RobloxTelemetryStat,
		overrideName = function()
			-- upvalues: p1 (ref)
			return p1
		end,
		format = function(p3, p4)
			-- upvalues: cryoModule (copy), p2 (ref)
			return cryoModule.Dictionary.join({
				placement = p4.placement,
				entryPoint = p4.entryPoint,
				hasActiveParty = p4.currentSquadId ~= nil
			}, p2(p3, p4))
		end,
		standardizedFields = if appChatExcludeStandardizedFieldsFromCounters then nil else list
	}
end

local _ = function(_, p1)
	return p1
end

local function eventIngestWithFormatFunction(p1)
	-- upvalues: socialLuaAnalyticsModule (ref), list (ref), cryoModule (ref)
	return {
		overrideName = nil,
		throttlingThousandths = nil,
		type = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.EventIngest,
		standardizedFields = list,
		format = function(p2, p3)
			-- upvalues: cryoModule (copy), p1 (ref)
			return cryoModule.Dictionary.join(p3, p1(p2, p3))
		end
	}
end

return {
	namedCounterConfigurationAndFormat = namedCounterConfigurationAndFormat,
	namedCounterConfigurationNoEmittedInfo = namedCounterConfigurationNoEmittedInfo,
	namedStatConfigurationAndFormat = namedStatConfigurationAndFormat,
	eventIngestWithFormatFunction = eventIngestWithFormatFunction,
	EVENT_INGEST_NO_EMITTED_INFO = eventIngestWithFormatFunction(function(_, _)
		return {}
	end),
	STANDARDIZED_FIELDS = list
}