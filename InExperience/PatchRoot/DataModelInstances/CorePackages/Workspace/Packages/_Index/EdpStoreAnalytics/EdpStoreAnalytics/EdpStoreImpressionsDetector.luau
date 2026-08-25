local telemetryService = game:GetService("TelemetryService")
local IXPService = game:GetService("IXPService")
local edpStoreAnalytics = script:FindFirstAncestor("EdpStoreAnalytics")
local parent = edpStoreAnalytics.Parent
local reactModule = require(parent.React)
local appCommonLibModule = require(parent.AppCommonLib)
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local constantsModule = require(edpStoreAnalytics.Constants)
local edpStoreAnalyticsLoggerModule = require(edpStoreAnalytics.EdpStoreAnalyticsLogger)
local signal = appCommonLibModule.Signal
local screenSizeImpressionsDetector = require(parent.Impressions).ScreenSizeImpressionsDetector
local fFlagSduiEdpStoreImpressionsLogging = require(parent.SharedFlags).FFlagSduiEdpStoreImpressionsLogging
local var7 = if not fFlagSduiEdpStoreImpressionsLogging then game:DefineFastInt("EdpStoreImpressionsDetectorThrottlingHundredthsPercent", 0) else nil

return function(p0)
	-- upvalues: reactModule (ref), signal (ref), fFlagSduiEdpStoreImpressionsLogging (ref), constantsModule (ref), edpStoreAnalyticsLoggerModule (ref), var7 (write), telemetryService (ref), IXPService (ref), appUserLayers (ref), screenSizeImpressionsDetector (ref)
	local var8 = reactModule.useRef(signal.new())
	local var9 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var8 (ref)
		if p0.scrollViewPositionChangedSignal.current then
			p0.scrollViewPositionChangedSignal.current:connect(function()
				-- upvalues: var8 (copy)
				var8.current:fire()
			end)
		end
	end, { p0.scrollViewPositionChangedSignal })
	
	return reactModule.createElement(screenSizeImpressionsDetector, {
		parentRef = p0.parentRef,
		onRequestImpressionsSignal = var8.current,
		onImpressionsDetected = reactModule.useCallback(function(p1)
			-- upvalues: var9 (ref), p0 (ref), fFlagSduiEdpStoreImpressionsLogging (copy), constantsModule (copy), edpStoreAnalyticsLoggerModule (copy), var7 (copy), telemetryService (copy), IXPService (copy), appUserLayers (copy)
			if #p1 == 0 or var9.current then return end
			if p0.parameters == nil then return end
			var9.current = true
			local var10 = p1[1]
			
			if fFlagSduiEdpStoreImpressionsLogging then
				edpStoreAnalyticsLoggerModule.logImpression({
					universeId = tonumber(p0.parameters.universeId),
					productType = p0.parameters.productType,
					actionType = constantsModule.StoreEnums.ActionType.Impression,
					locationType = p0.parameters.locationType,
					layoutOrder = tonumber(var10)
				})
				edpStoreAnalyticsLoggerModule.logExperienceStoreExposure()
				
				return
			end
			telemetryService:LogEvent({
				description = "Event fired from the lua app for every impression on the EDP store or preview",
				eventName = constantsModule.ExperienceStoreEventName,
				backends = { "EventIngest" },
				throttlingPercentage = var7,
				lastUpdated = { 25, 10, 23 }
			}, {
				customFields = {
					universeId = tonumber(p0.parameters.universeId),
					productType = p0.parameters.productType,
					actionType = constantsModule.StoreEnums.ActionType.Impression,
					locationType = p0.parameters.locationType,
					layoutOrder = tonumber(var10)
				}
			})
			IXPService:LogUserLayerExposure(appUserLayers.EconomyDeveloperMonetizationEdpVirtualProductsRanking)
		end, { p0.parameters }),
		impressionsTag = p0.impressionsTag
	})
end