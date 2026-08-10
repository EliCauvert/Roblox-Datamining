local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local _ = require(parent.AppCommonLib)
local screenSizeImpressionsTracker = require(parent.Impressions).ScreenSizeImpressionsTracker
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local findAnalyticsField = sduiCoreSystemModule.findAnalyticsField
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sendSduiFeedImpressions = require(parent.UnifiedLogging).sendSduiFeedImpressions

return function(p0) --[[ line: 29 | named "SduiFeedImpressionsDetector" ]]
	-- upvalues: reactModule (ref), sduiErrorType (ref), findAnalyticsField (ref), sduiBuilder (ref), sendSduiFeedImpressions (ref), screenSizeImpressionsTracker (ref)
	local var2 = reactModule.useRef(p0.feedItems)
	var2.current = p0.feedItems
	local sduiContext = p0.sduiContext
	
	return reactModule.createElement(screenSizeImpressionsTracker, {
		pageContext = sduiContext.routeName or sduiContext.appPage,
		parentRef = p0.parentRef,
		impressionsTag = p0.impressionsTag,
		scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
		sendImpressions = reactModule.useCallback(function(p1) --[[ line: 37 ]]
			-- upvalues: var2 (ref), sduiContext (ref), sduiErrorType (copy), findAnalyticsField (copy), sduiBuilder (copy), sendSduiFeedImpressions (copy)
			if not p1 or #p1 == 0 then return end
			local current = var2.current
			local t = {}
			local t_1 = {}
			local t_2 = {}
			
			for i, v in p1 do
				if v > 0 then
					local var6 = current and current[v]
					
					if var6 == nil then
						sduiContext.dependencies.logger.reportError(sduiErrorType.FailedToLogFeedImpressions, {
							name = "SduiFeedImpressionsDetector",
							message = `feed item index {v} detected with no matching componentConfig`
						}, sduiContext.appPage)
					else
						local componentType = findAnalyticsField("componentType", var6.analyticsData) or (sduiBuilder.getComponentType(var6, sduiContext) or "unknown")
						local var8 = findAnalyticsField("collectionId", var6.analyticsData)
						local var9 = if var8 ~= nil then "" else tostring(var8)
						table.insert(t, v)
						table.insert(t_1, var9)
						table.insert(t_2, tostring(componentType))
					end
				end
			end
			if #t > 0 then
				sendSduiFeedImpressions(t, t_1, t_2, sduiContext.appPage)
			end
		end, { sduiContext }),
		dataUpdatedTimestamp = sduiContext.dataUpdatedTimestamp
	})
end