local TelemetryService = game:GetService("TelemetryService")
local IXPService = game:GetService("IXPService")
local EdpStoreAnalytics = script:FindFirstAncestor("EdpStoreAnalytics")
local AppUserLayers = require(EdpStoreAnalytics.Parent.ExperimentLayers).AppUserLayers
local ConstantsModule = require(EdpStoreAnalytics.Constants)
local FFlagEnableDynamicEdpStorePreviewExposureLoggingModule = require(EdpStoreAnalytics.Flags.FFlagEnableDynamicEdpStorePreviewExposureLogging)
local FStringEdpStorePreviewIXPLayersCommaSeparatedModule = require(EdpStoreAnalytics.Flags.FStringEdpStorePreviewIXPLayersCommaSeparated)
local EdpStoreClicksDetectorThrottlingHundredthsPercent = game:DefineFastInt("EdpStoreClicksDetectorThrottlingHundredthsPercent", 0)
local EdpStoreImpressionsDetectorThrottlingHundredthsPercent = game:DefineFastInt("EdpStoreImpressionsDetectorThrottlingHundredthsPercent", 0)

local function sendLogEvent(CustomFields)
	-- upvalues: EdpStoreClicksDetectorThrottlingHundredthsPercent (copy), TelemetryService (copy)
	TelemetryService:LogEvent({
		eventName = "experienceStoreProducts",
		description = "Event fired from the lua app for click events on the EDP store",
		backends = { "EventIngest" },
		throttlingPercentage = EdpStoreClicksDetectorThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 23 }
	}, { customFields = CustomFields })
end

local function sendImpressionLogEvent(CustomFields)
	-- upvalues: ConstantsModule (copy), EdpStoreImpressionsDetectorThrottlingHundredthsPercent (copy), TelemetryService (copy)
	TelemetryService:LogEvent({
		description = "Event fired from the lua app for every impression on the EDP store or preview",
		eventName = ConstantsModule.ExperienceStoreEventName,
		backends = { "EventIngest" },
		throttlingPercentage = EdpStoreImpressionsDetectorThrottlingHundredthsPercent,
		lastUpdated = { 25, 10, 23 }
	}, { customFields = CustomFields })
end

return {
	logEvent = function(ActionType, ProductType, LocationType, UniverseId, ProductId, ItemId, _)
		-- upvalues: sendLogEvent (copy)
		sendLogEvent({
			actionType = ActionType,
			productType = ProductType,
			locationType = LocationType,
			universeId = UniverseId,
			productId = ProductId,
			itemId = ItemId
		})
	end,
	logImpression = function(CustomFields)
		-- upvalues: sendImpressionLogEvent (copy)
		sendImpressionLogEvent(CustomFields)
	end,
	logExperienceStoreExposure = function()
		-- upvalues: FFlagEnableDynamicEdpStorePreviewExposureLoggingModule (copy), FStringEdpStorePreviewIXPLayersCommaSeparatedModule (copy), IXPService (copy), AppUserLayers (copy)
		if not FFlagEnableDynamicEdpStorePreviewExposureLoggingModule then
			IXPService:LogUserLayerExposure(AppUserLayers.EconomyDeveloperMonetizationEdpVirtualProductsRanking)
			
			return
		end
		for _, value in string.split(FStringEdpStorePreviewIXPLayersCommaSeparatedModule, ",") do
			local Match: string? = string.match(value, "^%s*(.-)%s*$")
			
			if Match ~= nil and Match ~= "" then
				IXPService:LogUserLayerExposure(Match)
			end
		end
	end
}