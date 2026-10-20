local Parent = script:FindFirstAncestor("AppChat").Parent
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local CryoModule = require(Parent.Cryo)
local StandardizedFields = { "addSessionInfo", "addOSInfo" }

local function _(_, p1)
	return {
		placement = p1.placement,
		entryPoint = p1.entryPoint,
		hasActiveParty = p1.currentSquadId ~= nil
	}
end

local function namedCounterConfigurationAndFormat(p1, Callback)
	-- upvalues: SocialLuaAnalyticsModule (copy), CryoModule (copy)
	return {
		throttlingThousandths = nil,
		type = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.RobloxTelemetryCounter,
		overrideName = function()
			-- upvalues: p1 (copy)
			return p1
		end,
		format = function(p2, p3)
			-- upvalues: CryoModule (upval), Callback (copy)
			return CryoModule.Dictionary.join({
				placement = p3.placement,
				entryPoint = p3.entryPoint,
				hasActiveParty = p3.currentSquadId ~= nil
			}, Callback(p2, p3))
		end
	}
end

local _ = function(_, p1)
	return {
		placement = p1.placement,
		entryPoint = p1.entryPoint,
		hasActiveParty = p1.currentSquadId ~= nil
	}
end

local _ = function(_, p1)
	return p1
end

local function eventIngestWithFormatFunction(Callback)
	-- upvalues: SocialLuaAnalyticsModule (copy), StandardizedFields (copy), CryoModule (copy)
	return {
		overrideName = nil,
		throttlingThousandths = nil,
		type = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.EventIngest,
		standardizedFields = StandardizedFields,
		format = function(p1, p2)
			-- upvalues: CryoModule (upval), Callback (copy)
			return CryoModule.Dictionary.join(p2, Callback(p1, p2))
		end
	}
end

return {
	namedCounterConfigurationAndFormat = namedCounterConfigurationAndFormat,
	namedCounterConfigurationNoEmittedInfo = function(p1)
		-- upvalues: namedCounterConfigurationAndFormat (copy)
		return (namedCounterConfigurationAndFormat(p1, function(_, _)
			return {}
		end))
	end,
	namedStatConfigurationAndFormat = function(p1, Callback)
		-- upvalues: SocialLuaAnalyticsModule (copy), CryoModule (copy)
		return {
			throttlingThousandths = nil,
			type = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.RobloxTelemetryStat,
			overrideName = function()
				-- upvalues: p1 (copy)
				return p1
			end,
			format = function(p2, p3)
				-- upvalues: CryoModule (upval), Callback (copy)
				return CryoModule.Dictionary.join({
					placement = p3.placement,
					entryPoint = p3.entryPoint,
					hasActiveParty = p3.currentSquadId ~= nil
				}, Callback(p2, p3))
			end
		}
	end,
	eventIngestWithFormatFunction = eventIngestWithFormatFunction,
	EVENT_INGEST_NO_EMITTED_INFO = eventIngestWithFormatFunction(function(_, _)
		return {}
	end),
	STANDARDIZED_FIELDS = StandardizedFields
}