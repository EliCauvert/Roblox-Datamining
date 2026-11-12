local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local _ = require(AmpV2Wizard.Types)
local WizardEventNamesModule = require(AmpV2Wizard.WizardEventNames)
local AmpV2WizardEventThrottleHundredthsPercent = game:DefineFastInt("AmpV2WizardEventThrottleHundredthsPercent", 10000)

local function flattenParams(List)
	local t = {}
	
	if List == nil then
		return t
	end
	for i, value in List do
		local ValueType = type(value)
		
		if ValueType == "string" or ValueType == "number" or ValueType == "boolean" then
			t[i] = value
		end
	end
	return t
end

local function makeConfig(EventName)
	-- upvalues: AmpV2WizardEventThrottleHundredthsPercent (copy)
	return {
		description = "AMP v2 wizard funnel events",
		eventName = EventName,
		backends = { "EventIngest" },
		throttlingPercentage = AmpV2WizardEventThrottleHundredthsPercent,
		lastUpdated = { 2026, 8, 19 }
	}
end

local Default = require(AmpV2Wizard.Parent.LoggingProtocol).default

return {
	flattenParams = flattenParams,
	createSendWizardEvent = function(p1)
		-- upvalues: makeConfig (copy), flattenParams (copy), WizardEventNamesModule (copy)
		return function(EventName, p2)
			-- upvalues: p1 (copy), makeConfig (upval), flattenParams (upval), WizardEventNamesModule (upval)
			p1:logRobloxTelemetryEvent(makeConfig(EventName), nil, flattenParams(p2), WizardEventNamesModule.CONTEXT)
		end
	end,
	default = function(EventName, p1)
		-- upvalues: Default (copy), makeConfig (copy), flattenParams (copy), WizardEventNamesModule (copy)
		Default:logRobloxTelemetryEvent(makeConfig(EventName), nil, flattenParams(p1), WizardEventNamesModule.CONTEXT)
	end
}