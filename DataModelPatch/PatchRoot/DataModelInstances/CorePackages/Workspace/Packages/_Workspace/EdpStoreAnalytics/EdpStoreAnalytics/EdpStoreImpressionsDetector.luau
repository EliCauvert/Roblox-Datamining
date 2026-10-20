local TelemetryService = game:GetService("TelemetryService")
local IXPService = game:GetService("IXPService")
local EdpStoreAnalytics = script:FindFirstAncestor("EdpStoreAnalytics")
local Parent = EdpStoreAnalytics.Parent
local ReactModule = require(Parent.React)
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local ConstantsModule = require(EdpStoreAnalytics.Constants)
local EdpStoreAnalyticsLoggerModule = require(EdpStoreAnalytics.EdpStoreAnalyticsLogger)
local Signal = require(Parent.AppCommonLib).Signal
local ScreenSizeImpressionsDetector = require(Parent.Impressions).ScreenSizeImpressionsDetector
local FFlagSduiEdpStoreImpressionsLogging = require(Parent.SharedFlags).FFlagSduiEdpStoreImpressionsLogging
local EdpStoreImpressionsDetectorThrottlingHundredthsPercent = if FFlagSduiEdpStoreImpressionsLogging then nil else game:DefineFastInt("EdpStoreImpressionsDetectorThrottlingHundredthsPercent", 0)

return function(p1)
	-- upvalues: ReactModule (copy), Signal (copy), FFlagSduiEdpStoreImpressionsLogging (copy), ConstantsModule (copy), EdpStoreAnalyticsLoggerModule (copy), EdpStoreImpressionsDetectorThrottlingHundredthsPercent (ref), TelemetryService (copy), IXPService (copy), AppUserLayers (copy), ScreenSizeImpressionsDetector (copy)
	local UseRefResult = ReactModule.useRef(Signal.new())
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult (copy)
		if p1.scrollViewPositionChangedSignal.current then
			p1.scrollViewPositionChangedSignal.current:connect(function()
				-- upvalues: UseRefResult (upval)
				UseRefResult.current:fire()
			end)
		end
	end, { p1.scrollViewPositionChangedSignal })
	
	return ReactModule.createElement(ScreenSizeImpressionsDetector, {
		parentRef = p1.parentRef,
		onRequestImpressionsSignal = UseRefResult.current,
		onImpressionsDetected = ReactModule.useCallback(function(Entry)
			-- upvalues: UseRefResult1 (copy), p1 (copy), FFlagSduiEdpStoreImpressionsLogging (upval), ConstantsModule (upval), EdpStoreAnalyticsLoggerModule (upval), EdpStoreImpressionsDetectorThrottlingHundredthsPercent (upval), TelemetryService (upval), IXPService (upval), AppUserLayers (upval)
			if #Entry == 0 or UseRefResult1.current then return end
			if p1.parameters == nil then return end
			UseRefResult1.current = true
			local Entry1 = Entry[1]
			
			if FFlagSduiEdpStoreImpressionsLogging then
				EdpStoreAnalyticsLoggerModule.logImpression({
					universeId = tonumber(p1.parameters.universeId),
					productType = p1.parameters.productType,
					actionType = ConstantsModule.StoreEnums.ActionType.Impression,
					locationType = p1.parameters.locationType,
					layoutOrder = tonumber(Entry1)
				})
				EdpStoreAnalyticsLoggerModule.logExperienceStoreExposure()
				
				return
			else
				TelemetryService:LogEvent({
					description = "Event fired from the lua app for every impression on the EDP store or preview",
					eventName = ConstantsModule.ExperienceStoreEventName,
					backends = { "EventIngest" },
					throttlingPercentage = EdpStoreImpressionsDetectorThrottlingHundredthsPercent,
					lastUpdated = { 25, 10, 23 }
				}, {
					customFields = {
						universeId = tonumber(p1.parameters.universeId),
						productType = p1.parameters.productType,
						actionType = ConstantsModule.StoreEnums.ActionType.Impression,
						locationType = p1.parameters.locationType,
						layoutOrder = tonumber(Entry1)
					}
				})
				IXPService:LogUserLayerExposure(AppUserLayers.EconomyDeveloperMonetizationEdpVirtualProductsRanking)
			end
		end, { p1.parameters }),
		impressionsTag = p1.impressionsTag
	})
end