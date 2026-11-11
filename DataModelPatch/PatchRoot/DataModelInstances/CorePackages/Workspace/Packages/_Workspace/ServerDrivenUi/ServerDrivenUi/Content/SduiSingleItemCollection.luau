local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local _ = require(Parent.AppCommonLib)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local _ = require(Parent.UnifiedLogging)
local SendGameImpressions = require(Parent.GameCollections).SendGameImpressions
local WaitForPropWrapper = require(Parent.GameCollections).WaitForPropWrapper
local ImpressionsModule = require(Parent.Impressions)
local ImpressionsTagUtility = ImpressionsModule.ImpressionsTagUtility
local ScreenSizeImpressionsTracker = ImpressionsModule.ScreenSizeImpressionsTracker
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local GetImpressionsTagModule = require(ServerDrivenUi.Analytics.getImpressionsTag)
local ReportUnifiedLoggingImpressionsFunction = SduiCoreSystemModule.reportUnifiedLoggingImpressions
local SduiCollectionAnalyticsBuilder = SduiCoreSystemModule.SduiCollectionAnalyticsBuilder
local FindAnalyticsFieldFunction = SduiCoreSystemModule.findAnalyticsField
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiParsers = SduiCoreSystemModule.SduiParsers
local GetSduiComponentWrapperFunction = SduiCoreSystemModule.getSduiComponentWrapper
local FFlagSduiEdpStoreImpressionsLogging = require(Parent.SharedFlags).FFlagSduiEdpStoreImpressionsLogging
local t = {}

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), CryoModule (copy), t (copy), FindAnalyticsFieldFunction (copy), SduiBuilder (copy), SduiCollectionAnalyticsBuilder (copy), GetImpressionsTagModule (copy), ImpressionsTagUtility (copy), ReportUnifiedLoggingImpressionsFunction (copy), FFlagSduiEdpStoreImpressionsLogging (copy), SduiParsers (copy), SendGameImpressions (copy), GetSduiComponentWrapperFunction (copy), ScreenSizeImpressionsTracker (copy), WaitForPropWrapper (copy)
	local LayoutOrder = p1.layoutOrder
	local AnchorPoint = p1.anchorPoint
	local AutomaticSize = p1.automaticSize
	local Size = p1.size
	local Position = p1.position
	local SduiContext = p1.sduiContext
	local Children = p1.children
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end, { UseRefResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseResult (copy), CryoModule (upval), t (upval)
		if p1.componentConfig.__isClientBinding then
			p1.analyticsContext.getCollectionData = UseResult
		end
		return CryoModule.Dictionary.join(p1.analyticsContext or t, { getCollectionData = UseResult })
	end, {
		UseResult,
		p1.analyticsContext,
		p1.componentConfig.__isClientBinding
	})
	UseRefResult.current = ReactModule.useMemo(function()
		-- upvalues: FindAnalyticsFieldFunction (upval), p1 (copy), t (upval), SduiBuilder (upval), SduiContext (copy), SduiCollectionAnalyticsBuilder (upval)
		return SduiCollectionAnalyticsBuilder.buildAndValidateCollectionAnalyticsData(SduiContext, p1.analyticsContext.ancestorAnalyticsData, p1.analyticsContext.analyticsData, FindAnalyticsFieldFunction("componentType", p1.analyticsContext.analyticsData or t) or SduiBuilder.getComponentType(p1.componentConfig, SduiContext), 1, 1, nil, `SingleItemCollection_{p1.index}`, p1.startRow)
	end, {
		SduiContext,
		p1.analyticsContext,
		p1.componentConfig,
		p1.index,
		p1.startRow
	})
	local ImpressionsTagModule = GetImpressionsTagModule(p1.index, UseRefResult.current, SduiContext, p1.debugName)
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: ImpressionsTagUtility (upval), UseRefResult2 (copy), ImpressionsTagModule (copy)
		ImpressionsTagUtility.AddTag(UseRefResult2, ImpressionsTagModule, 1)
		
		return function()
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult2 (upval), ImpressionsTagModule (upval)
			ImpressionsTagUtility.RemoveTag(UseRefResult2, ImpressionsTagModule, 1)
		end
	end, { UseRefResult2, ImpressionsTagModule })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Content = ReactModule.createElement("Frame", {
			ref = UseRefResult2,
			Position = Position,
			Size = Size or UDim2.new(1, 0, 0, 0),
			AutomaticSize = AutomaticSize or Enum.AutomaticSize.Y,
			LayoutOrder = LayoutOrder,
			AnchorPoint = AnchorPoint,
			BackgroundTransparency = 1,
			[ReactModule.Tag] = "data-testid=--sdui-single-item-collection"
		}, (ReactModule.useMemo(function()
			-- upvalues: p1 (copy), ReactModule (upval), UseMemoResult (copy), FindAnalyticsFieldFunction (upval), t (upval), SduiBuilder (upval), SduiContext (copy), UseRefResult1 (copy), SduiCollectionAnalyticsBuilder (upval), GetSduiComponentWrapperFunction (upval)
			local CloneElementResults = {}
			
			if p1.children then
				for i, child in p1.children do
					CloneElementResults[i] = ReactModule.cloneElement(child, { parentAnalyticsContext = UseMemoResult })
				end
			end
			assert(CloneElementResults, "result must exist")
			
			if p1.item then
				local ComponentType = FindAnalyticsFieldFunction("componentType", p1.item.analyticsData or t) or SduiBuilder.getComponentType(p1.componentConfig, SduiContext)
				local SingleItemCollectionName: string = `SingleItemCollection_{ComponentType}`
				local LocalAnalyticsData = { itemPosition = 1, itemComponentType = ComponentType }
				UseRefResult1.current[1] = SduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(SduiContext, p1.item.analyticsData, nil, LocalAnalyticsData, ComponentType)
				CloneElementResults[SingleItemCollectionName] = ReactModule.createElement(GetSduiComponentWrapperFunction(p1.item), {
					componentConfig = p1.item,
					sduiContext = SduiContext,
					parentAnalyticsContext = if p1.item.__isClientBinding then nil else UseMemoResult,
					extraLocalProps = {
						index = 1,
						scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
						verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
						pageSideMargin = p1.pageSideMargin,
						selectionOrder = if p1.disableSelectionOrder then nil else p1.selectionOrderBase
					},
					debugName = SingleItemCollectionName,
					localAnalyticsData = LocalAnalyticsData
				})
			end
			return CloneElementResults
		end, {
			p1.item, p1.scrollViewPositionChangedSignal, p1.verticalScrollingFrameRef,
			UseRefResult, Children, SduiContext, p1.pageSideMargin,
			p1.disableSelectionOrder, p1.selectionOrderBase
		}))),
		ImpressionDetector = ReactModule.createElement(WaitForPropWrapper, {
			waitForProp = p1.startRow,
			maxUpdatesToDelay = p1.numUpdatesToDelayImpressions,
			wrappedComponent = ReactModule.createElement(ScreenSizeImpressionsTracker, {
				parentRef = p1.verticalScrollingFrameRef,
				pageContext = SduiContext.routeName or SduiContext.appPage,
				impressionsTag = ImpressionsTagModule,
				scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
				sendImpressions = ReactModule.useCallback(function(p2)
					-- upvalues: p1 (copy), UseRefResult (copy), ReportUnifiedLoggingImpressionsFunction (upval), SduiContext (copy), UseRefResult1 (copy), FFlagSduiEdpStoreImpressionsLogging (upval), ImpressionsTagModule (copy), t (upval), CryoModule (upval), SduiParsers (upval), UseMemoResult (copy), SendGameImpressions (upval)
					if p1.item == nil then return end
					assert(p1.item, "props.item must exist")
					
					if p1.impressionEventName or not UseRefResult.current or UseRefResult.current.contentType ~= "Game" then
						ReportUnifiedLoggingImpressionsFunction(SduiContext, p2, UseRefResult1.current, UseRefResult.current, p1.startRow, p1.impressionEventName, p1.skipItemImpressionsLog, if FFlagSduiEdpStoreImpressionsLogging then ImpressionsTagModule else nil)
						
						return
					end
					if UseRefResult.current and (UseRefResult.current.contentType == "HeroUnit" or UseRefResult.current.contentType == "Game") and (p1.item.analyticsData and p1.item.analyticsData.universeId ~= nil) then
						local JoinResults = {}
						local Current = UseRefResult1.current or t
						for _, value in Current do
							table.insert(JoinResults, (CryoModule.Dictionary.join(value, {
								isSponsored = SduiParsers.safeParseBoolean(value.adFlag, SduiContext, UseMemoResult)
							})))
						end
						SendGameImpressions.sendFromTopicContents(SduiContext.dependencies.eventIngest, SduiContext.dependencies.appAnalytics, p2, JoinResults, SduiContext.appPage, tostring(UseRefResult.current.collectionId), p1.index, p1.startRow, nil, nil, 1, false, "HeroUnit", nil)
					end
					ReportUnifiedLoggingImpressionsFunction(SduiContext, p2, UseRefResult1.current, UseRefResult.current)
				end, {
					p1.item, p1.index, p1.startRow, SduiContext, UseRefResult, UseRefResult1,
					UseMemoResult, p1.impressionEventName, p1.skipItemImpressionsLog,
					if FFlagSduiEdpStoreImpressionsLogging then ImpressionsTagModule else nil
				}),
				dataUpdatedTimestamp = p1.sduiContext.dataUpdatedTimestamp
			})
		})
	})
end)