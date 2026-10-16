local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppCommonLib)
local ScreenSizeImpressionsTracker = require(Parent.Impressions).ScreenSizeImpressionsTracker
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local FindAnalyticsFieldFunction = SduiCoreSystemModule.findAnalyticsField
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SendSduiFeedImpressionsFunction = require(Parent.UnifiedLogging).sendSduiFeedImpressions

return function(p1) --[[ Line: 29 | Named "SduiFeedImpressionsDetector" ]]
	-- upvalues: ReactModule (copy), SduiErrorType (copy), FindAnalyticsFieldFunction (copy), SduiBuilder (copy), SendSduiFeedImpressionsFunction (copy), ScreenSizeImpressionsTracker (copy)
	local UseRefResult = ReactModule.useRef(p1.feedItems)
	UseRefResult.current = p1.feedItems
	local SduiContext = p1.sduiContext
	
	return ReactModule.createElement(ScreenSizeImpressionsTracker, {
		pageContext = SduiContext.routeName or SduiContext.appPage,
		parentRef = p1.parentRef,
		impressionsTag = p1.impressionsTag,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		sendImpressions = ReactModule.useCallback(function(List) --[[ Line: 37 ]]
			-- upvalues: UseRefResult (copy), SduiContext (copy), SduiErrorType (upval), FindAnalyticsFieldFunction (upval), SduiBuilder (upval), SendSduiFeedImpressionsFunction (upval)
			if not List or #List == 0 then return end
			local Current = UseRefResult.current
			local List1 = {}
			local List2 = {}
			local List3 = {}
			
			for _, value in List do
				if value > 0 then
					local CurrentEntry = Current and Current[value]
					
					if CurrentEntry == nil then
						SduiContext.dependencies.logger.reportError(SduiErrorType.FailedToLogFeedImpressions, {
							name = "SduiFeedImpressionsDetector",
							message = `feed item index {value} detected with no matching componentConfig`
						}, SduiContext.appPage)
					else
						local ComponentType = FindAnalyticsFieldFunction("componentType", CurrentEntry.analyticsData) or (SduiBuilder.getComponentType(CurrentEntry, SduiContext) or "unknown")
						local CollectionId = FindAnalyticsFieldFunction("collectionId", CurrentEntry.analyticsData)
						local Text: string = if CollectionId == nil then "" else tostring(CollectionId)
						table.insert(List1, value)
						table.insert(List2, Text)
						table.insert(List3, (tostring(ComponentType)))
					end
				end
			end
			if #List1 > 0 then
				SendSduiFeedImpressionsFunction(List1, List2, List3, SduiContext.appPage)
			end
		end, { SduiContext }),
		dataUpdatedTimestamp = SduiContext.dataUpdatedTimestamp
	})
end