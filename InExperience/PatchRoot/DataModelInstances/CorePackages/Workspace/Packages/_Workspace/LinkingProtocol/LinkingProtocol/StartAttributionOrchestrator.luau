local Parent = script.Parent
local _ = require(Parent.LinkingProtocolTypes)
local AttributionTelemetryModule = require(Parent.AttributionTelemetry)
local GetFFlagEnableStartAttributionTelemetryModule = require(Parent.Flags.getFFlagEnableStartAttributionTelemetry)
local FFlagAdConsentForwardCachedRegion = require(Parent.Parent.SharedFlags).FFlagAdConsentForwardCachedRegion
local config = {
	AT = true,
	BE = true,
	BG = true,
	CY = true,
	CZ = true,
	DE = true,
	DK = true,
	EE = true,
	ES = true,
	FI = true,
	FR = true,
	GR = true,
	HR = true,
	HU = true,
	IE = true,
	IT = true,
	LT = true,
	LU = true,
	LV = true,
	MT = true,
	NL = true,
	PL = true,
	PT = true,
	RO = true,
	SE = true,
	SI = true,
	SK = true,
	IS = true,
	LI = true,
	NO = true,
	GB = true,
	CH = true
}

local function _(Text: string): boolean --[[ Line: 90 | Named "isSubjectToGdpr" ]]
	-- upvalues: FFlagAdConsentForwardCachedRegion (copy), config (copy)
	return Text == nil or (FFlagAdConsentForwardCachedRegion and string.match(Text, "^%a%a$") == nil or config[string.upper(Text)] == true)
end

local _ = function(Consented, Text: string) --[[ Line: 103 | Named "toDmaConsent" ]]
	-- upvalues: FFlagAdConsentForwardCachedRegion (copy), config (copy)
	return {
		isSubjectToGdpr = Text == nil or (FFlagAdConsentForwardCachedRegion and string.match(Text, "^%a%a$") == nil or config[string.upper(Text)] == true),
		consented = Consented
	}
end

local StartAttributionOrchestratorModule = {
	computeDecision = function(Consented, Text: string) --[[ Line: 119 ]]
		-- upvalues: FFlagAdConsentForwardCachedRegion (copy), config (copy)
		return if Consented == nil then { applySharingFilter = true, dmaConsent = nil } else {
			applySharingFilter = not Consented,
			dmaConsent = {
				isSubjectToGdpr = Text == nil or (FFlagAdConsentForwardCachedRegion and string.match(Text, "^%a%a$") == nil or config[string.upper(Text)] == true),
				consented = Consented
			}
		}
	end
}

local _ = function(_, _): boolean --[[ Line: 132 | Named "shouldPublish" ]]
	return true
end

local _ = function(p1): boolean --[[ Line: 139 | Named "isAwaitingConsent" ]]
	return p1 == nil
end

function StartAttributionOrchestratorModule.resolveAndPublish(p1, p2, Consented, p3) --[[ Line: 155 ]]
	-- upvalues: StartAttributionOrchestratorModule (copy), GetFFlagEnableStartAttributionTelemetryModule (copy), AttributionTelemetryModule (copy)
	if Consented == nil then return end
	local Decision = StartAttributionOrchestratorModule.computeDecision(Consented, p3)
	p1:adConsentResolved(Decision)
	
	if GetFFlagEnableStartAttributionTelemetryModule() then
		AttributionTelemetryModule.logDecisionPublished(p2, Decision.applySharingFilter)
	end
end

return StartAttributionOrchestratorModule