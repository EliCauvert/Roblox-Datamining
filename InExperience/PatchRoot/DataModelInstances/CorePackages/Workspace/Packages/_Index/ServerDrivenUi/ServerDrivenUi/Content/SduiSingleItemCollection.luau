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
local fFlagLuaAppSduiRouteName = require(parent.SharedFlags).FFlagLuaAppSduiRouteName
local t = {}

return reactModule.memo(function(p0) --[[ line: 75 | named "SduiSingleItemCollection" ]]
	-- upvalues: reactModule (ref), cryoModule (ref), t (ref), findAnalyticsField (ref), sduiBuilder (ref), sduiCollectionAnalyticsBuilder (ref), getImpressionsTagModule (ref), impressionsTagUtility (ref), reportUnifiedLoggingImpressions (ref), fFlagSduiEdpStoreImpressionsLogging (ref), sduiParsers (ref), sendGameImpressions (ref), getSduiComponentWrapper (ref), screenSizeImpressionsTracker (ref), fFlagLuaAppSduiRouteName (ref), waitForPropWrapper (ref)
	local layoutOrder = p0.layoutOrder
	local anchorPoint = p0.anchorPoint
	local automaticSize = p0.automaticSize
	local size = p0.size
	local position = p0.position
	local sduiContext = p0.sduiContext
	local children = p0.children
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef({})
	local var9 = reactModule.useCallback(function() --[[ line: 92 ]]
		-- upvalues: var7 (ref)
		return var7.current
	end, { var7 })
	local var10 = reactModule.useMemo(function() --[[ line: 98 ]]
		-- upvalues: p0 (ref), var9 (ref), cryoModule (copy), t (copy)
		if p0.componentConfig.__isClientBinding then
			p0.analyticsContext.getCollectionData = var9
		end
		return cryoModule.Dictionary.join(p0.analyticsContext or t, { getCollectionData = var9 })
	end, {
		var9,
		p0.analyticsContext,
		p0.componentConfig.__isClientBinding
	})
	var7.current = reactModule.useMemo(function() --[[ line: 118 ]]
		-- upvalues: findAnalyticsField (copy), p0 (ref), t (copy), sduiBuilder (copy), sduiContext (ref), sduiCollectionAnalyticsBuilder (copy)
		return sduiCollectionAnalyticsBuilder.buildAndValidateCollectionAnalyticsData(sduiContext, p0.analyticsContext.ancestorAnalyticsData, p0.analyticsContext.analyticsData, findAnalyticsField("componentType", p0.analyticsContext.analyticsData or t) or sduiBuilder.getComponentType(p0.componentConfig, sduiContext), 1, 1, nil, `SingleItemCollection_{p0.index}`, p0.startRow)
	end, {
		sduiContext,
		p0.analyticsContext,
		p0.componentConfig,
		p0.index,
		p0.startRow
	})
	local var11 = getImpressionsTagModule(p0.index, var7.current, sduiContext, p0.debugName)
	local var12 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 150 ]]
		-- upvalues: impressionsTagUtility (copy), var12 (ref), var11 (ref)
		impressionsTagUtility.AddTag(var12, var11, 1)
		
		return function() --[[ line: 153 ]]
			-- upvalues: impressionsTagUtility (copy), var12 (copy), var11 (copy)
			impressionsTagUtility.RemoveTag(var12, var11, 1)
		end
	end, { var12, var11 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Content = reactModule.createElement("Frame", {
			ref = var12,
			Position = position,
			Size = size or UDim2.new(1, 0, 0, 0),
			AutomaticSize = automaticSize or Enum.AutomaticSize.Y,
			LayoutOrder = layoutOrder,
			AnchorPoint = anchorPoint,
			BackgroundTransparency = 1,
			[reactModule.Tag] = "data-testid=--sdui-single-item-collection"
		}, reactModule.useMemo(function() --[[ line: 249 ]]
			-- upvalues: p0 (ref), reactModule (copy), var10 (ref), findAnalyticsField (copy), t (copy), sduiBuilder (copy), sduiContext (ref), var8 (ref), sduiCollectionAnalyticsBuilder (copy), getSduiComponentWrapper (copy)
			local t_1 = {}
			
			if p0.children then
				for i, v in p0.children do
					t_1[i] = reactModule.cloneElement(v, { parentAnalyticsContext = var10 })
				end
			end
			assert(t_1, "result must exist")
			
			if p0.item then
				local componentType = findAnalyticsField("componentType", p0.item.analyticsData or t) or sduiBuilder.getComponentType(p0.componentConfig, sduiContext)
				local var15 = `SingleItemCollection_{componentType}`
				local t_2 = { itemPosition = 1, itemComponentType = componentType }
				var8.current[1] = sduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(sduiContext, p0.item.analyticsData, nil, t_2, componentType)
				t_1[var15] = reactModule.createElement(getSduiComponentWrapper(p0.item), {
					componentConfig = p0.item,
					sduiContext = sduiContext,
					parentAnalyticsContext = if p0.item.__isClientBinding then nil else var10,
					extraLocalProps = {
						index = 1,
						scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
						verticalScrollingFrameRef = p0.verticalScrollingFrameRef,
						pageSideMargin = p0.pageSideMargin,
						selectionOrder = if not p0.disableSelectionOrder then p0.selectionOrderBase else nil
					},
					debugName = var15,
					localAnalyticsData = t_2
				})
			end
			return t_1
		end, {
			p0.item, p0.scrollViewPositionChangedSignal, p0.verticalScrollingFrameRef,
			var7, children, sduiContext, p0.pageSideMargin, p0.disableSelectionOrder,
			p0.selectionOrderBase
		})),
		ImpressionDetector = reactModule.createElement(waitForPropWrapper, {
			waitForProp = p0.startRow,
			maxUpdatesToDelay = p0.numUpdatesToDelayImpressions,
			wrappedComponent = reactModule.createElement(screenSizeImpressionsTracker, {
				parentRef = p0.verticalScrollingFrameRef,
				pageContext = if fFlagLuaAppSduiRouteName then sduiContext.routeName or sduiContext.appPage else sduiContext.appPage,
				impressionsTag = var11,
				scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
				sendImpressions = reactModule.useCallback(function(p1) --[[ line: 160 ]]
					-- upvalues: p0 (ref), var7 (ref), reportUnifiedLoggingImpressions (copy), sduiContext (ref), var8 (ref), fFlagSduiEdpStoreImpressionsLogging (copy), var11 (ref), t (copy), cryoModule (copy), sduiParsers (copy), var10 (ref), sendGameImpressions (copy)
					if p0.item == nil then return end
					assert(p0.item, "props.item must exist")
					
					if p0.impressionEventName or not var7.current or var7.current.contentType ~= "Game" then
						reportUnifiedLoggingImpressions(sduiContext, p1, var8.current, var7.current, p0.startRow, p0.impressionEventName, p0.skipItemImpressionsLog, if fFlagSduiEdpStoreImpressionsLogging then var11 else nil)
						
						return
					elseif var7.current and (var7.current.contentType == "HeroUnit" or var7.current.contentType == "Game") and (p0.item.analyticsData and p0.item.analyticsData.universeId ~= nil) then
						local t_1 = {}
						
						for i, v in var8.current or t do
							table.insert(t_1, cryoModule.Dictionary.join(v, {
								isSponsored = sduiParsers.safeParseBoolean(v.adFlag, sduiContext, var10)
							}))
						end
						sendGameImpressions.sendFromTopicContents(sduiContext.dependencies.eventIngest, sduiContext.dependencies.appAnalytics, p1, t_1, sduiContext.appPage, tostring(var7.current.collectionId), p0.index, p0.startRow, nil, nil, 1, false, "HeroUnit", nil)
					end
					reportUnifiedLoggingImpressions(sduiContext, p1, var8.current, var7.current)
				end, {
					p0.item, p0.index, p0.startRow, sduiContext, var7, var8, var10,
					p0.impressionEventName, p0.skipItemImpressionsLog,
					if fFlagSduiEdpStoreImpressionsLogging then var11 else nil
				}),
				dataUpdatedTimestamp = p0.sduiContext.dataUpdatedTimestamp
			})
		})
	})
end)