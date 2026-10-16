local EdpStoreAnalytics = script:FindFirstAncestor("EdpStoreAnalytics")
local Parent = EdpStoreAnalytics.Parent
local ReactModule = require(Parent.React)
local ConstantsModule = require(EdpStoreAnalytics.Constants)
local EdpStoreAnalyticsLoggerModule = require(EdpStoreAnalytics.EdpStoreAnalyticsLogger)
local Signal = require(Parent.AppCommonLib).Signal
local ScreenSizeImpressionsDetector = require(Parent.Impressions).ScreenSizeImpressionsDetector

return function(p1) --[[ Line: 21 ]]
	-- upvalues: ReactModule (copy), Signal (copy), ConstantsModule (copy), EdpStoreAnalyticsLoggerModule (copy), ScreenSizeImpressionsDetector (copy)
	local UseRefResult = ReactModule.useRef(Signal.new())
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 25 ]]
		-- upvalues: p1 (copy), UseRefResult (copy)
		if p1.scrollViewPositionChangedSignal.current then
			p1.scrollViewPositionChangedSignal.current:connect(function() --[[ Line: 27 ]]
				-- upvalues: UseRefResult (upval)
				UseRefResult.current:fire()
			end)
		end
	end, { p1.scrollViewPositionChangedSignal })
	
	return ReactModule.createElement(ScreenSizeImpressionsDetector, {
		parentRef = p1.parentRef,
		onRequestImpressionsSignal = UseRefResult.current,
		onImpressionsDetected = ReactModule.useCallback(function(Entry) --[[ Line: 33 ]]
			-- upvalues: UseRefResult1 (copy), p1 (copy), ConstantsModule (upval), EdpStoreAnalyticsLoggerModule (upval)
			if #Entry == 0 or UseRefResult1.current then return end
			if p1.parameters ~= nil then
				UseRefResult1.current = true
				EdpStoreAnalyticsLoggerModule.logImpression({
					universeId = tonumber(p1.parameters.universeId),
					productType = p1.parameters.productType,
					actionType = ConstantsModule.StoreEnums.ActionType.Impression,
					locationType = p1.parameters.locationType,
					layoutOrder = tonumber(Entry[1])
				})
				EdpStoreAnalyticsLoggerModule.logExperienceStoreExposure()
				
				return
			end
		end, { p1.parameters }),
		impressionsTag = p1.impressionsTag
	})
end