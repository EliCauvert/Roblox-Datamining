local Parent = script:FindFirstAncestor("AvatarExperienceServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local AppCommonLibModule = require(Parent.AppCommonLib)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local FindAnalyticsFieldFunction = SduiCoreSystemModule.findAnalyticsField
local GetSduiComponentWrapperFunction = SduiCoreSystemModule.getSduiComponentWrapper
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiErrors = SduiCoreSystemModule.SduiErrors
local VirtualizedFeed = require(Parent.AvatarExperienceUIKit).FeedComponents.VirtualizedFeed
local CATALOGRESULTSHORIZONTALMARGIN = require(Parent.AvatarExperienceCatalog).Constants.CATALOG_RESULTS_HORIZONTAL_MARGIN
local FFlagAXFixSduiCatalogRowJump = require(Parent.AvatarExperienceFlags).FFlagAXFixSduiCatalogRowJump
local t = {}

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), CATALOGRESULTSHORIZONTALMARGIN (copy), ReactModule (copy), AppCommonLibModule (copy), FFlagAXFixSduiCatalogRowJump (copy), FindAnalyticsFieldFunction (copy), t (copy), SduiBuilder (copy), SduiErrors (copy), GetSduiComponentWrapperFunction (copy), VirtualizedFeed (copy)
	local AnalyticsContext = p1.analyticsContext
	local SduiContext = p1.sduiContext
	local FeedItems = p1.feedItems
	local DebugName = p1.debugName
	local UseTokensResult = UseTokensFunction()
	local HorizontalPadding = if p1.horizontalPadding then p1.horizontalPadding else CATALOGRESULTSHORIZONTALMARGIN
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: AppCommonLibModule (upval)
		return AppCommonLibModule.Signal.new()
	end, {})
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(_)
		-- upvalues: UseMemoResult (copy)
		UseMemoResult:fire()
	end, {})
	local Largest: number? = nil
	local UseResult1 = nil
	
	if FFlagAXFixSduiCatalogRowJump then
		local UseStateResult, UseStateResult2 = ReactModule.useState(0)
		local UseRefResult1 = ReactModule.useRef(0)
		UseResult1 = ReactModule.useCallback(function(Current)
			-- upvalues: UseRefResult1 (copy), UseStateResult2 (copy)
			if UseRefResult1.current ~= Current then
				UseRefResult1.current = Current
				UseStateResult2(Current)
				
				return
			end
		end, {})
		
		if UseStateResult > 0 then
			Largest = math.max(0, UseStateResult - HorizontalPadding * 2)
		end
	end
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: FindAnalyticsFieldFunction (upval), t (upval), SduiBuilder (upval), SduiContext (copy), SduiErrors (upval), DebugName (copy), GetSduiComponentWrapperFunction (upval), UseMemoResult (copy), FFlagAXFixSduiCatalogRowJump (upval), Largest (ref), ReactModule (upval), AnalyticsContext (copy)
		local Item = p2.item
		local Index = p2.index
		local ComponentType = FindAnalyticsFieldFunction("componentType", Item.analyticsData or t) or SduiBuilder.getComponentType(Item, SduiContext)
		
		if ComponentType then
			return ReactModule.createElement(GetSduiComponentWrapperFunction(Item), {
				debugName = `catalogVirtualizedFeedItem{Index}`,
				componentConfig = Item,
				sduiContext = SduiContext,
				localAnalyticsData = {
					feedItemPosition = Index,
					itemComponentType = ComponentType,
					componentType = ComponentType
				},
				extraLocalProps = {
					startRow = 1,
					scrollViewPositionChangedSignal = UseMemoResult,
					layoutOrder = if Item.props and Item.props.layoutOrder ~= nil then Item.props.layoutOrder else Index,
					feedRowWidth = if FFlagAXFixSduiCatalogRowJump then Largest else nil
				},
				parentAnalyticsContext = if Item.__isClientBinding then nil else AnalyticsContext
			})
		else
			SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilComponentType, {
				componentType = "CatalogVirtualizedFeed",
				name = DebugName,
				message = `Nil componentType in CatalogVirtualizedFeed at feedItem index {Index}`
			}, SduiContext.appPage)
			
			return nil
		end
	end, {
		FeedItems, DebugName, UseMemoResult, SduiContext, AnalyticsContext,
		if FFlagAXFixSduiCatalogRowJump then Largest else nil
	})
	
	return if FeedItems == nil then nil else ReactModule.createElement(VirtualizedFeed, {
		data = FeedItems,
		renderItem = UseResult2,
		flatListRef = UseRefResult,
		horizontalPadding = HorizontalPadding,
		verticalPadding = if p1.verticalPadding == nil then UseTokensResult.Padding.Small else p1.verticalPadding,
		windowSize = p1.windowSize,
		initialNumToRender = p1.initialNumToRender,
		maxToRenderPerBatch = p1.maxToRenderPerBatch,
		updateCellsBatchingPeriod = p1.updateCellsBatchingPeriod,
		scrollEventThrottle = p1.scrollEventThrottle,
		onScroll = UseResult,
		onContainerWidthChanged = UseResult1,
		onEndReached = p1.onScrollToEnd,
		onEndReachedThreshold = p1.onEndReachedThreshold,
		isLoading = p1.isLoading,
		isEndOfList = p1.isEndOfList,
		scrollToTopLabel = p1.scrollToTopLabel,
		endOfListBottomPadding = p1.endOfListBottomPadding,
		LayoutOrder = p1.layoutOrder,
		Size = p1.Size,
		backgroundColor = p1.backgroundColor,
		backgroundTransparency = p1.backgroundTransparency
	})
end)