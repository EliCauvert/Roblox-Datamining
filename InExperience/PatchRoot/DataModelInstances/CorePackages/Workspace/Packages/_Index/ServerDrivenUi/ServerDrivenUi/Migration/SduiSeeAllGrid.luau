local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local ReactModule = require(Parent.React)
local TutilsModule = require(Parent.tutils)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiComponentType = SduiCoreSystemModule.SduiComponentType
local SduiConfigReducerModule = require(ServerDrivenUi.Rodux.SduiConfigReducer)
local SduiComponent = SduiCoreSystemModule.SduiComponent
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiParsers = SduiCoreSystemModule.SduiParsers
local UseSduiContextModule = require(ServerDrivenUi.System.useSduiContext)
local UseCollectionLayoutConfigFunction = require(Parent.CollectionViews).useCollectionLayoutConfig
local FIntLuaAppDelayImpressionsMaxUpdates = require(Parent.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates
local FFlagLuaAppLayoutParamsInContext = require(Parent.SharedFlags).FFlagLuaAppLayoutParamsInContext

return ReactModule.memo(function(p1) --[[ Line: 50 | Named "SduiSeeAllGrid" ]]
	-- upvalues: ArgCheckModule (copy), UseSelectorFunction (copy), SduiConfigReducerModule (copy), TutilsModule (copy), FFlagLuaAppLayoutParamsInContext (copy), UseCollectionLayoutConfigFunction (copy), UseSduiContextModule (copy), ReactModule (copy), SduiErrors (copy), SduiBuilder (copy), SduiParsers (copy), SduiComponentType (copy), SduiComponent (copy), FIntLuaAppDelayImpressionsMaxUpdates (copy)
	local LayoutOrder = p1.layoutOrder
	local VerticalScrollingFrameRef = p1.verticalScrollingFrameRef
	local ScrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal
	ArgCheckModule.assert(p1.collectionId ~= nil, "collectionId id must exist")
	ArgCheckModule.assert(p1.collectionIndex ~= nil, "collectionIndex id must exist")
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 60 ]]
		-- upvalues: SduiConfigReducerModule (upval), p1 (copy)
		local t = {}
		local PersonalizationEntry = p2.Personalization[SduiConfigReducerModule.key][p1.appPage]
		
		if PersonalizationEntry then
			for _, itemCollection in PersonalizationEntry.itemCollections do
				if tostring(p1.collectionId) == tostring(itemCollection.sduiConfig.analyticsData.collectionId) then
					t.feedItemData = itemCollection
					break
				end
			end
			t.templates = PersonalizationEntry.rootConfig and PersonalizationEntry.rootConfig.templates or nil
		end
		return t
	end, TutilsModule.shallowEqual)
	local UseCollectionLayoutConfigResult = if FFlagLuaAppLayoutParamsInContext then UseCollectionLayoutConfigFunction(p1.contentFrame, 0) else nil
	local UseSduiContextModuleResult = UseSduiContextModule({
		appPage = p1.appPage,
		templates = UseSelectorResult.templates,
		dataUpdatedTimestamp = UseSelectorResult.feedItemData and UseSelectorResult.feedItemData.dataUpdatedTimestamp,
		pageLayoutConfig = if FFlagLuaAppLayoutParamsInContext then UseCollectionLayoutConfigResult else nil
	})
	local FeedItemData = UseSelectorResult.feedItemData
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 91 ]]
		-- upvalues: FeedItemData (copy), UseSduiContextModuleResult (copy), SduiErrors (upval), p1 (copy), SduiBuilder (upval), SduiParsers (upval), SduiComponentType (upval)
		if not FeedItemData or not FeedItemData.sduiConfig then
			UseSduiContextModuleResult.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilComponentConfig, {
				name = "SduiSeeAllGrid",
				message = `Missing component config client-driven SDUI grid for see-all. CollectionId: {p1.collectionId}`
			}, UseSduiContextModuleResult.appPage)
			
			return nil
		end
		if not FeedItemData.sduiConfig.props then
			UseSduiContextModuleResult.dependencies.logger.reportError(SduiErrors.SduiErrorType.InvalidComponentConfig, {
				name = "SduiSeeAllGrid",
				message = `Missing props for component config for client-driven SDUI grid for see-all. CollectionId: {p1.collectionId}`
			}, UseSduiContextModuleResult.appPage)
			
			return nil
		end
		local SduiConfig = FeedItemData.sduiConfig
		local ItemHeightFromWidth = nil
		
		if SduiConfig.props.items and #SduiConfig.props.items > 0 and SduiConfig.props.itemHeightFromWidth == nil then
			local Item = SduiConfig.props.items[1]
			
			if SduiConfig.props.itemTemplateKey and Item.templateKey == nil then
				Item.templateKey = SduiConfig.props.itemTemplateKey
			end
			if not SduiBuilder.getComponentType(Item, UseSduiContextModuleResult) then
				UseSduiContextModuleResult.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilComponentType, {
					name = "SduiSeeAllGrid",
					message = `Missing componentType for first item. CollectionId: {p1.collectionId}`
				}, UseSduiContextModuleResult.appPage)
				
				return nil
			end
			local Scale: number? = nil
			
			if Item then
				local SafeParseNumberResult = Item.props and (Item.props.imageAspectRatio and SduiParsers.safeParseNumber(Item.props.imageAspectRatio, UseSduiContextModuleResult, {}))
				
				if SafeParseNumberResult and SafeParseNumberResult > 0 then
					Scale = 1 / SafeParseNumberResult
				end
			end
			if not Scale then
				Scale = if SduiConfig.props.collectionItemSize == "Medium" or SduiConfig.props.collectionItemSize == "Large" then 0.5625 else 1
			end
			ItemHeightFromWidth = UDim.new(Scale, if Item then (Item.props and Item.props.titleLines or 1) * 20 + 20 + 8 else nil)
		else
			ItemHeightFromWidth = SduiConfig.props.itemHeightFromWidth
		end
		return {
			componentType = SduiComponentType.CollectionGrid,
			props = {
				items = SduiConfig.props.items,
				impressionEventName = SduiConfig.props.impressionEventName,
				skipItemImpressionsLog = SduiConfig.props.skipItemImpressionsLog,
				collectionItemSize = SduiConfig.props.collectionItemSize,
				itemTemplateKey = SduiConfig.props.itemTemplateKey,
				itemHeightFromWidth = ItemHeightFromWidth
			},
			analyticsData = SduiConfig.analyticsData
		}
	end, {
		FeedItemData and FeedItemData.sduiConfig,
		UseSduiContextModuleResult
	})
	
	return (ReactModule.useMemo(function() --[[ Line: 181 ]]
		-- upvalues: UseMemoResult (copy), UseSduiContextModuleResult (copy), SduiErrors (upval), p1 (copy), ReactModule (upval), SduiComponent (upval), FeedItemData (copy), ScrollViewPositionChangedSignal (copy), VerticalScrollingFrameRef (copy), FIntLuaAppDelayImpressionsMaxUpdates (upval), LayoutOrder (copy), FFlagLuaAppLayoutParamsInContext (upval)
		if UseMemoResult == nil then
			UseSduiContextModuleResult.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilComponentConfig, {
				name = "SduiSeeAllGrid",
				message = `Unable to generate component config for client-driven SDUI grid for see-all. CollectionId: {p1.collectionId}`
			}, UseSduiContextModuleResult.appPage)
			
			return nil
		else
			return ReactModule.createElement(SduiComponent, {
				debugName = "SeeAllGrid",
				componentConfig = UseMemoResult,
				sduiContext = UseSduiContextModuleResult,
				extraLocalProps = {
					pageSideMargin = 0,
					startRow = 1,
					disableImpressionsDetector = true,
					dataUpdatedTimestamp = FeedItemData.dataUpdatedTimestamp,
					scrollViewPositionChangedSignal = ScrollViewPositionChangedSignal,
					verticalScrollingFrameRef = VerticalScrollingFrameRef,
					index = p1.collectionIndex,
					collectionPosition = p1.collectionIndex,
					numUpdatesToDelayImpressions = FIntLuaAppDelayImpressionsMaxUpdates,
					layoutOrder = LayoutOrder,
					layoutOverrides = if FFlagLuaAppLayoutParamsInContext then nil else {
						sideMargin = 0,
						fractionalItemAmount = 0,
						overrideLoadMoreThreshold = 1e999
					},
					impressionsTag = p1.impressionsTag,
					setLogImpressions = p1.setLogImpressions,
					sendGameImpressions = p1.sendGameImpressions,
					onCollectionViewabilityChanged = p1.onCollectionViewabilityChanged
				},
				localAnalyticsData = { seeAllFlag = 1, collectionPosition = p1.collectionIndex }
			})
		end
	end, {
		UseMemoResult, LayoutOrder,
		FeedItemData and FeedItemData.dataUpdatedTimestamp or nil, 1, p1.collectionId,
		p1.collectionIndex, ScrollViewPositionChangedSignal, VerticalScrollingFrameRef,
		UseSduiContextModuleResult, p1.impressionsTag, p1.setLogImpressions,
		p1.sendGameImpressions, p1.onCollectionViewabilityChanged
	}))
end)