local telemetryService = game:GetService("TelemetryService")
local IXPService = game:GetService("IXPService")
local edpStoreAnalytics = script:FindFirstAncestor("EdpStoreAnalytics")
local appUserLayers = require(edpStoreAnalytics.Parent.ExperimentLayers).AppUserLayers
local constantsModule = require(edpStoreAnalytics.Constants)
local edpStoreClicksDetectorThrottlingHundredthsPercent = game:DefineFastInt("EdpStoreClicksDetectorThrottlingHundredthsPercent", 0)
local edpStoreImpressionsDetectorThrottlingHundredthsPercent = game:DefineFastInt("EdpStoreImpressionsDetectorThrottlingHundredthsPercent", 0)
local t = {}

local function sendLogEvent(p0) --[[ line: 17 ]]
	-- upvalues: edpStoreClicksDetectorThrottlingHundredthsPercent (ref), telemetryService (ref)
	telemetryService:LogEvent({
		eventName = "experienceStoreProducts",
		description = "Event fired from the lua app for click events on the EDP store",
		backends = { "EventIngest" },
		throttlingPercentage = edpStoreClicksDetectorThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 23 }
	}, { customFields = p0 })
end

local function sendImpressionLogEvent(p1) --[[ line: 32 ]]
	-- upvalues: constantsModule (ref), edpStoreImpressionsDetectorThrottlingHundredthsPercent (ref), telemetryService (ref)
	telemetryService:LogEvent({
		description = "Event fired from the lua app for every impression on the EDP store or preview",
		eventName = constantsModule.ExperienceStoreEventName,
		backends = { "EventIngest" },
		throttlingPercentage = edpStoreImpressionsDetectorThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 23 }
	}, { customFields = p1 })
end

function t.logEvent(p2, p3, p4, p5, p6, p7, _) --[[ line: 45 ]]
	-- upvalues: sendLogEvent (ref)
	sendLogEvent({
		actionType = p2,
		productType = p3,
		locationType = p4,
		universeId = p5,
		productId = p6,
		itemId = p7
	})
end

function t.logImpression(p8) --[[ line: 69 ]]
	-- upvalues: sendImpressionLogEvent (ref)
	sendImpressionLogEvent(p8)
end

function t.logExperienceStoreExposure() --[[ line: 75 ]]
	-- upvalues: IXPService (ref), appUserLayers (ref)
	IXPService:LogUserLayerExposure(appUserLayers.EconomyDeveloperMonetizationEdpVirtualProductsRanking)
end

return t