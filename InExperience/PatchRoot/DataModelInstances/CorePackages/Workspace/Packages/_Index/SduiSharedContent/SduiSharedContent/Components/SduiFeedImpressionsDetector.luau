local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local _ = require(parent.AppCommonLib)
local screenSizeImpressionsTracker = require(parent.Impressions).ScreenSizeImpressionsTracker
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local findAnalyticsField = sduiCoreSystemModule.findAnalyticsField
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sendSduiFeedImpressions = require(parent.UnifiedLogging).sendSduiFeedImpressions

return function(p1)
	-- upvalues: reactModule (ref), sduiErrorType (ref), findAnalyticsField (ref), sduiBuilder (ref), sendSduiFeedImpressions (ref), screenSizeImpressionsTracker (ref)
	local var1 = reactModule.useRef(p1.feedItems)
	var1.current = p1.feedItems
	local sduiContext = p1.sduiContext
	
	return reactModule.createElement(screenSizeImpressionsTracker, {
		pageContext = sduiContext.routeName or sduiContext.appPage,
		parentRef = p1.parentRef,
		impressionsTag = p1.impressionsTag,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		sendImpressions = reactModule.useCallback(function(p2)
			-- upvalues: var1 (ref), sduiContext (ref), sduiErrorType (copy), findAnalyticsField (copy), sduiBuilder (copy), sendSduiFeedImpressions (copy)
			if not p2 or #p2 == 0 then return end
			local current = var1.current
			local t = {}
			local t_1 = {}
			local t_2 = {}
			
			for i, v in p2 do
				if v > 0 then
					local var2 = current and current[v]
					
					if var2 == nil then
						sduiContext.dependencies.logger.reportError(sduiErrorType.FailedToLogFeedImpressions, {
							name = "SduiFeedImpressionsDetector",
							message = `feed item index {v} detected with no matching componentConfig`
						}, sduiContext.appPage)
					else
						local componentType = findAnalyticsField("componentType", var2.analyticsData) or (sduiBuilder.getComponentType(var2, sduiContext) or "unknown")
						local var3 = findAnalyticsField("collectionId", var2.analyticsData)
						local var4 = if var3 ~= nil then "" else tostring(var3)
						table.insert(t, v)
						table.insert(t_1, var4)
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