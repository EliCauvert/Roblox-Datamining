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
local var1 = if not fFlagSduiEdpStoreImpressionsLogging then game:DefineFastInt("EdpStoreImpressionsDetectorThrottlingHundredthsPercent", 0) else nil

return function(p1)
	-- upvalues: reactModule (ref), signal (ref), fFlagSduiEdpStoreImpressionsLogging (ref), constantsModule (ref), edpStoreAnalyticsLoggerModule (ref), var1 (write), telemetryService (ref), IXPService (ref), appUserLayers (ref), screenSizeImpressionsDetector (ref)
	local var2 = reactModule.useRef(signal.new())
	local var3 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		if p1.scrollViewPositionChangedSignal.current then
			p1.scrollViewPositionChangedSignal.current:connect(function()
				-- upvalues: var2 (copy)
				var2.current:fire()
			end)
		end
	end, { p1.scrollViewPositionChangedSignal })
	
	return reactModule.createElement(screenSizeImpressionsDetector, {
		parentRef = p1.parentRef,
		onRequestImpressionsSignal = var2.current,
		onImpressionsDetected = reactModule.useCallback(function(p2)
			-- upvalues: var3 (ref), p1 (ref), fFlagSduiEdpStoreImpressionsLogging (copy), constantsModule (copy), edpStoreAnalyticsLoggerModule (copy), var1 (copy), telemetryService (copy), IXPService (copy), appUserLayers (copy)
			if #p2 == 0 or var3.current then return end
			if p1.parameters == nil then return end
			var3.current = true
			local var4 = p2[1]
			
			if fFlagSduiEdpStoreImpressionsLogging then
				edpStoreAnalyticsLoggerModule.logImpression({
					universeId = tonumber(p1.parameters.universeId),
					productType = p1.parameters.productType,
					actionType = constantsModule.StoreEnums.ActionType.Impression,
					locationType = p1.parameters.locationType,
					layoutOrder = tonumber(var4)
				})
				edpStoreAnalyticsLoggerModule.logExperienceStoreExposure()
				
				return
			end
			telemetryService:LogEvent({
				description = "Event fired from the lua app for every impression on the EDP store or preview",
				eventName = constantsModule.ExperienceStoreEventName,
				backends = { "EventIngest" },
				throttlingPercentage = var1,
				lastUpdated = { 25, 10, 23 }
			}, {
				customFields = {
					universeId = tonumber(p1.parameters.universeId),
					productType = p1.parameters.productType,
					actionType = constantsModule.StoreEnums.ActionType.Impression,
					locationType = p1.parameters.locationType,
					layoutOrder = tonumber(var4)
				}
			})
			IXPService:LogUserLayerExposure(appUserLayers.EconomyDeveloperMonetizationEdpVirtualProductsRanking)
		end, { p1.parameters }),
		impressionsTag = p1.impressionsTag
	})
end