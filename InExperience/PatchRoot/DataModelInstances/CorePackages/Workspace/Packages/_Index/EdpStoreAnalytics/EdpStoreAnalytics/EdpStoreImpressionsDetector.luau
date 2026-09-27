local edpStoreAnalytics = script:FindFirstAncestor("EdpStoreAnalytics")
local parent = edpStoreAnalytics.Parent
local reactModule = require(parent.React)
local appCommonLibModule = require(parent.AppCommonLib)
local constantsModule = require(edpStoreAnalytics.Constants)
local edpStoreAnalyticsLoggerModule = require(edpStoreAnalytics.EdpStoreAnalyticsLogger)
local signal = appCommonLibModule.Signal
local screenSizeImpressionsDetector = require(parent.Impressions).ScreenSizeImpressionsDetector

return function(p1)
	-- upvalues: reactModule (ref), signal (ref), constantsModule (ref), edpStoreAnalyticsLoggerModule (ref), screenSizeImpressionsDetector (ref)
	local var1 = reactModule.useRef(signal.new())
	local var2 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref)
		if p1.scrollViewPositionChangedSignal.current then
			p1.scrollViewPositionChangedSignal.current:connect(function()
				-- upvalues: var1 (copy)
				var1.current:fire()
			end)
		end
	end, { p1.scrollViewPositionChangedSignal })
	
	return reactModule.createElement(screenSizeImpressionsDetector, {
		parentRef = p1.parentRef,
		onRequestImpressionsSignal = var1.current,
		onImpressionsDetected = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref), p1 (ref), constantsModule (copy), edpStoreAnalyticsLoggerModule (copy)
			if #p2 == 0 or var2.current then return end
			if p1.parameters == nil then
				return
			end
			var2.current = true
			edpStoreAnalyticsLoggerModule.logImpression({
				universeId = tonumber(p1.parameters.universeId),
				productType = p1.parameters.productType,
				actionType = constantsModule.StoreEnums.ActionType.Impression,
				locationType = p1.parameters.locationType,
				layoutOrder = tonumber(p2[1])
			})
			edpStoreAnalyticsLoggerModule.logExperienceStoreExposure()
		end, { p1.parameters }),
		impressionsTag = p1.impressionsTag
	})
end