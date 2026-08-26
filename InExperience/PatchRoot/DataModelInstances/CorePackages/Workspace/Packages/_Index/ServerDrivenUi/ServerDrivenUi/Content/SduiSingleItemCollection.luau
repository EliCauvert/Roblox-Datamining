local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local _ = require(parent.AppCommonLib)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local _ = require(parent.UnifiedLogging)
local sendGameImpressions = require(parent.GameCollections).SendGameImpressions
local waitForPropWrapper = require(parent.GameCollections).WaitForPropWrapper
local impressionsModule = require(parent.Impressions)
local impressionsTagUtility = impressionsModule.ImpressionsTagUtility
local screenSizeImpressionsTracker = impressionsModule.ScreenSizeImpressionsTracker
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local getImpressionsTagModule = require(serverDrivenUi.Analytics.getImpressionsTag)
local reportUnifiedLoggingImpressions = sduiCoreSystemModule.reportUnifiedLoggingImpressions
local sduiCollectionAnalyticsBuilder = sduiCoreSystemModule.SduiCollectionAnalyticsBuilder
local findAnalyticsField = sduiCoreSystemModule.findAnalyticsField
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiParsers = sduiCoreSystemModule.SduiParsers
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local fFlagSduiEdpStoreImpressionsLogging = require(parent.SharedFlags).FFlagSduiEdpStoreImpressionsLogging
local t = {}

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), cryoModule (ref), t (ref), findAnalyticsField (ref), sduiBuilder (ref), sduiCollectionAnalyticsBuilder (ref), getImpressionsTagModule (ref), impressionsTagUtility (ref), reportUnifiedLoggingImpressions (ref), fFlagSduiEdpStoreImpressionsLogging (ref), sduiParsers (ref), sendGameImpressions (ref), getSduiComponentWrapper (ref), screenSizeImpressionsTracker (ref), waitForPropWrapper (ref)
	local layoutOrder = p1.layoutOrder
	local anchorPoint = p1.anchorPoint
	local automaticSize = p1.automaticSize
	local size = p1.size
	local position = p1.position
	local sduiContext = p1.sduiContext
	local children = p1.children
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef({})
	local var3 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		return var1.current
	end, { var1 })
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var3 (ref), cryoModule (copy), t (copy)
		if p1.componentConfig.__isClientBinding then
			p1.analyticsContext.getCollectionData = var3
		end
		return cryoModule.Dictionary.join(p1.analyticsContext or t, { getCollectionData = var3 })
	end, {
		var3,
		p1.analyticsContext,
		p1.componentConfig.__isClientBinding
	})
	var1.current = reactModule.useMemo(function()
		-- upvalues: findAnalyticsField (copy), p1 (ref), t (copy), sduiBuilder (copy), sduiContext (ref), sduiCollectionAnalyticsBuilder (copy)
		return sduiCollectionAnalyticsBuilder.buildAndValidateCollectionAnalyticsData(sduiContext, p1.analyticsContext.ancestorAnalyticsData, p1.analyticsContext.analyticsData, findAnalyticsField("componentType", p1.analyticsContext.analyticsData or t) or sduiBuilder.getComponentType(p1.componentConfig, sduiContext), 1, 1, nil, `SingleItemCollection_{p1.index}`, p1.startRow)
	end, {
		sduiContext,
		p1.analyticsContext,
		p1.componentConfig,
		p1.index,
		p1.startRow
	})
	local var5 = getImpressionsTagModule(p1.index, var1.current, sduiContext, p1.debugName)
	local var6 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var6 (ref), var5 (ref)
		impressionsTagUtility.AddTag(var6, var5, 1)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var6 (copy), var5 (copy)
			impressionsTagUtility.RemoveTag(var6, var5, 1)
		end
	end, { var6, var5 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Content = reactModule.createElement("Frame", {
			ref = var6,
			Position = position,
			Size = size or UDim2.new(1, 0, 0, 0),
			AutomaticSize = automaticSize or Enum.AutomaticSize.Y,
			LayoutOrder = layoutOrder,
			AnchorPoint = anchorPoint,
			BackgroundTransparency = 1,
			[reactModule.Tag] = "data-testid=--sdui-single-item-collection"
		}, reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), var4 (ref), findAnalyticsField (copy), t (copy), sduiBuilder (copy), sduiContext (ref), var2 (ref), sduiCollectionAnalyticsBuilder (copy), getSduiComponentWrapper (copy)
			local t_1 = {}
			
			if p1.children then
				for i, v in p1.children do
					t_1[i] = reactModule.cloneElement(v, { parentAnalyticsContext = var4 })
				end
			end
			assert(t_1, "result must exist")
			
			if p1.item then
				local componentType = findAnalyticsField("componentType", p1.item.analyticsData or t) or sduiBuilder.getComponentType(p1.componentConfig, sduiContext)
				local var7 = `SingleItemCollection_{componentType}`
				local t_2 = { itemPosition = 1, itemComponentType = componentType }
				var2.current[1] = sduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(sduiContext, p1.item.analyticsData, nil, t_2, componentType)
				t_1[var7] = reactModule.createElement(getSduiComponentWrapper(p1.item), {
					componentConfig = p1.item,
					sduiContext = sduiContext,
					parentAnalyticsContext = if p1.item.__isClientBinding then nil else var4,
					extraLocalProps = {
						index = 1,
						scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
						verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
						pageSideMargin = p1.pageSideMargin,
						selectionOrder = if not p1.disableSelectionOrder then p1.selectionOrderBase else nil
					},
					debugName = var7,
					localAnalyticsData = t_2
				})
			end
			return t_1
		end, {
			p1.item, p1.scrollViewPositionChangedSignal, p1.verticalScrollingFrameRef,
			var1, children, sduiContext, p1.pageSideMargin, p1.disableSelectionOrder,
			p1.selectionOrderBase
		})),
		ImpressionDetector = reactModule.createElement(waitForPropWrapper, {
			waitForProp = p1.startRow,
			maxUpdatesToDelay = p1.numUpdatesToDelayImpressions,
			wrappedComponent = reactModule.createElement(screenSizeImpressionsTracker, {
				parentRef = p1.verticalScrollingFrameRef,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = var5,
				scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
				sendImpressions = reactModule.useCallback(function(p2)
					-- upvalues: p1 (ref), var1 (ref), reportUnifiedLoggingImpressions (copy), sduiContext (ref), var2 (ref), fFlagSduiEdpStoreImpressionsLogging (copy), var5 (ref), t (copy), cryoModule (copy), sduiParsers (copy), var4 (ref), sendGameImpressions (copy)
					if p1.item == nil then return end
					assert(p1.item, "props.item must exist")
					
					if p1.impressionEventName or not var1.current or var1.current.contentType ~= "Game" then
						reportUnifiedLoggingImpressions(sduiContext, p2, var2.current, var1.current, p1.startRow, p1.impressionEventName, p1.skipItemImpressionsLog, if fFlagSduiEdpStoreImpressionsLogging then var5 else nil)
						
						return
					elseif var1.current and (var1.current.contentType == "HeroUnit" or var1.current.contentType == "Game") and (p1.item.analyticsData and p1.item.analyticsData.universeId ~= nil) then
						local t_1 = {}
						
						for i, v in var2.current or t do
							table.insert(t_1, cryoModule.Dictionary.join(v, {
								isSponsored = sduiParsers.safeParseBoolean(v.adFlag, sduiContext, var4)
							}))
						end
						sendGameImpressions.sendFromTopicContents(sduiContext.dependencies.eventIngest, sduiContext.dependencies.appAnalytics, p2, t_1, sduiContext.appPage, tostring(var1.current.collectionId), p1.index, p1.startRow, nil, nil, 1, false, "HeroUnit", nil)
					end
					reportUnifiedLoggingImpressions(sduiContext, p2, var2.current, var1.current)
				end, {
					p1.item, p1.index, p1.startRow, sduiContext, var1, var2, var4,
					p1.impressionEventName, p1.skipItemImpressionsLog,
					if fFlagSduiEdpStoreImpressionsLogging then var5 else nil
				}),
				dataUpdatedTimestamp = p1.sduiContext.dataUpdatedTimestamp
			})
		})
	})
end)