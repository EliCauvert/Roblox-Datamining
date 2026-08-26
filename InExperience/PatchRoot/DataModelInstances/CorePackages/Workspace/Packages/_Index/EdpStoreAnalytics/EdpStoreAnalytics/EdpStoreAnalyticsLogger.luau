local telemetryService = game:GetService("TelemetryService")
local IXPService = game:GetService("IXPService")
local edpStoreAnalytics = script:FindFirstAncestor("EdpStoreAnalytics")
local appUserLayers = require(edpStoreAnalytics.Parent.ExperimentLayers).AppUserLayers
local constantsModule = require(edpStoreAnalytics.Constants)
local edpStoreClicksDetectorThrottlingHundredthsPercent = game:DefineFastInt("EdpStoreClicksDetectorThrottlingHundredthsPercent", 0)
local edpStoreImpressionsDetectorThrottlingHundredthsPercent = game:DefineFastInt("EdpStoreImpressionsDetectorThrottlingHundredthsPercent", 0)
local t = {}

local function sendLogEvent(p1)
	-- upvalues: edpStoreClicksDetectorThrottlingHundredthsPercent (ref), telemetryService (ref)
	telemetryService:LogEvent({
		eventName = "experienceStoreProducts",
		description = "Event fired from the lua app for click events on the EDP store",
		backends = { "EventIngest" },
		throttlingPercentage = edpStoreClicksDetectorThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 23 }
	}, { customFields = p1 })
end

local function sendImpressionLogEvent(p1)
	-- upvalues: constantsModule (ref), edpStoreImpressionsDetectorThrottlingHundredthsPercent (ref), telemetryService (ref)
	telemetryService:LogEvent({
		description = "Event fired from the lua app for every impression on the EDP store or preview",
		eventName = constantsModule.ExperienceStoreEventName,
		backends = { "EventIngest" },
		throttlingPercentage = edpStoreImpressionsDetectorThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 23 }
	}, { customFields = p1 })
end

function t.logEvent(p1, p2, p3, p4, p5, p6, _)
	-- upvalues: sendLogEvent (ref)
	sendLogEvent({
		actionType = p1,
		productType = p2,
		locationType = p3,
		universeId = p4,
		productId = p5,
		itemId = p6
	})
end

function t.logImpression(p1)
	-- upvalues: sendImpressionLogEvent (ref)
	sendImpressionLogEvent(p1)
end

function t.logExperienceStoreExposure()
	-- upvalues: IXPService (ref), appUserLayers (ref)
	IXPService:LogUserLayerExposure(appUserLayers.EconomyDeveloperMonetizationEdpVirtualProductsRanking)
end

return t