local parent = script:FindFirstAncestor("AppChat").Parent
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local cryoModule = require(parent.Cryo)
local list = { "addSessionInfo", "addOSInfo" }
local appChatExcludeStandardizedFieldsFromCounters = game:DefineFastFlag("AppChatExcludeStandardizedFieldsFromCounters", false)

local function _(_, p0)
	return {
		placement = p0.placement,
		entryPoint = p0.entryPoint,
		hasActiveParty = p0.currentSquadId ~= nil
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

local function namedCounterConfigurationNoEmittedInfo(p5)
	-- upvalues: namedCounterConfigurationAndFormat (ref)
	return namedCounterConfigurationAndFormat(p5, function(_, _)
		return {}
	end)
end

local _ = function(_, p6)
	return {
		placement = p6.placement,
		entryPoint = p6.entryPoint,
		hasActiveParty = p6.currentSquadId ~= nil
	}
end

local function namedStatConfigurationAndFormat(p7, p8)
	-- upvalues: socialLuaAnalyticsModule (ref), cryoModule (ref), appChatExcludeStandardizedFieldsFromCounters (ref), list (ref)
	return {
		throttlingThousandths = nil,
		type = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.RobloxTelemetryStat,
		overrideName = function()
			-- upvalues: p7 (ref)
			return p7
		end,
		format = function(p9, p10)
			-- upvalues: cryoModule (copy), p8 (ref)
			return cryoModule.Dictionary.join({
				placement = p10.placement,
				entryPoint = p10.entryPoint,
				hasActiveParty = p10.currentSquadId ~= nil
			}, p8(p9, p10))
		end,
		standardizedFields = if appChatExcludeStandardizedFieldsFromCounters then nil else list
	}
end

local _ = function(_, p11)
	return p11
end

local function eventIngestWithFormatFunction(p12)
	-- upvalues: socialLuaAnalyticsModule (ref), list (ref), cryoModule (ref)
	return {
		overrideName = nil,
		throttlingThousandths = nil,
		type = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.EventIngest,
		standardizedFields = list,
		format = function(p13, p14)
			-- upvalues: cryoModule (copy), p12 (ref)
			return cryoModule.Dictionary.join(p14, p12(p13, p14))
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