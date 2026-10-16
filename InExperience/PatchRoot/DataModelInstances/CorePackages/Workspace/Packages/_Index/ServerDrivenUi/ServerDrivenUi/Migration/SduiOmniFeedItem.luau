local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local ReactModule = require(Parent.React)
local OmniFeedPropsKey = require(Parent.DiscoveryTypes).OmniFeedPropsKey
local UsePageSideMarginFunction = require(Parent.CollectionViews).usePageSideMargin
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrors = SduiCoreSystemModule.SduiErrors
local GetSduiComponentWrapperFunction = SduiCoreSystemModule.getSduiComponentWrapper
local FIntLuaAppDelayImpressionsMaxUpdates = require(Parent.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways
local SduiOmniFeedItemLogDelayMsRatio = game:DefineFastInt("SduiOmniFeedItemLogDelayMs", 500) / 1000
local UseSduiItemCollectionSignalModule = require(ServerDrivenUi.DataStore.useSduiItemCollectionSignal)

return ReactModule.memo(function(p1) --[[ Line: 46 | Named "SduiOmniFeedItem" ]]
	-- upvalues: OmniFeedPropsKey (copy), FFlagLuaAppCompositionAlways (copy), ArgCheckModule (copy), ReactModule (copy), UsePageSideMarginFunction (copy), AppPage (copy), UseSduiItemCollectionSignalModule (copy), SduiOmniFeedItemLogDelayMsRatio (copy), SduiErrors (copy), GetSduiComponentWrapperFunction (copy), FIntLuaAppDelayImpressionsMaxUpdates (copy)
	local AppPage1 = p1[OmniFeedPropsKey].appPage
	local FeedItemStartRow = p1[OmniFeedPropsKey].feedItemStartRow
	local VerticalScrollingFrameRef = p1[OmniFeedPropsKey].verticalScrollingFrameRef
	local ScrollViewPositionChangedSignal = p1[OmniFeedPropsKey].scrollViewPositionChangedSignal
	local SduiContext = p1[OmniFeedPropsKey].sduiContext
	local SelectionOrderBase = p1[OmniFeedPropsKey].selectionOrderBase
	local AppCompositionEnabled = if FFlagLuaAppCompositionAlways then true else p1[OmniFeedPropsKey].appCompositionEnabled
	ArgCheckModule.assert(AppPage1 ~= nil, "appPage must exist")
	ArgCheckModule.assert(p1.topicId ~= nil, "topicId id must exist")
	ArgCheckModule.assert(p1.sortIndex ~= nil, "sortIndex id must exist")
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 62 ]]
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = true
		
		return function() --[[ Line: 64 ]]
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end
	end, {})
	local UsePageSideMarginResult = if FFlagLuaAppCompositionAlways then nil else UsePageSideMarginFunction(VerticalScrollingFrameRef.current)
	local UseSduiItemCollectionSignalModuleResult = UseSduiItemCollectionSignalModule(AppPage1, p1.topicId, p1.sortIndex, (ReactModule.useMemo(function() --[[ Line: 72 ]]
		-- upvalues: AppPage1 (copy), AppPage (upval), p1 (copy)
		return if AppPage1 == AppPage.SearchPage and p1.searchUuid then `{AppPage1}_{p1.searchUuid}` else nil
	end, { AppPage1, p1.searchUuid })))
	local SduiConfig = UseSduiItemCollectionSignalModuleResult and UseSduiItemCollectionSignalModuleResult.sduiConfig or nil
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 83 ]]
		-- upvalues: p1 (copy)
		return { collectionPosition = p1.sortIndex }
	end, { p1.sortIndex })
	local SduiOmniFeedItemName: string = `SduiOmniFeedItem-{p1.topicId}`
	local UseRefResult1 = ReactModule.useRef(SduiConfig)
	UseRefResult1.current = SduiConfig
	
	if SduiConfig == nil then
		task.delay(SduiOmniFeedItemLogDelayMsRatio, function() --[[ Line: 94 ]]
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), SduiContext (copy), SduiErrors (upval), SduiOmniFeedItemName (copy), p1 (copy)
			if UseRefResult.current and UseRefResult1.current == nil then
				SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilComponentConfig, {
					name = SduiOmniFeedItemName,
					message = `Unable to render omni feed item for sdui. CollectionId: {p1.topicId}`
				}, SduiContext.appPage)
			end
		end)
	end
	return (ReactModule.useMemo(function() --[[ Line: 106 ]]
		-- upvalues: SduiConfig (copy), GetSduiComponentWrapperFunction (upval), ReactModule (upval), SduiOmniFeedItemName (copy), SduiContext (copy), ScrollViewPositionChangedSignal (copy), VerticalScrollingFrameRef (copy), p1 (copy), AppCompositionEnabled (copy), UsePageSideMarginResult (copy), FeedItemStartRow (copy), FIntLuaAppDelayImpressionsMaxUpdates (upval), SelectionOrderBase (copy), UseMemoResult (copy)
		return if SduiConfig == nil then nil else ReactModule.createElement(GetSduiComponentWrapperFunction(SduiConfig), {
			debugName = SduiOmniFeedItemName,
			componentConfig = SduiConfig,
			sduiContext = SduiContext,
			extraLocalProps = {
				scrollViewPositionChangedSignal = ScrollViewPositionChangedSignal,
				verticalScrollingFrameRef = VerticalScrollingFrameRef,
				index = p1.sortIndex,
				collectionPosition = p1.sortIndex,
				pageSideMargin = if AppCompositionEnabled then nil else UsePageSideMarginResult,
				startRow = FeedItemStartRow,
				numUpdatesToDelayImpressions = FIntLuaAppDelayImpressionsMaxUpdates,
				selectionOrderBase = SelectionOrderBase,
				appCompositionEnabled = AppCompositionEnabled
			},
			localAnalyticsData = UseMemoResult
		})
	end, {
		SduiConfig, SduiOmniFeedItemName, UseMemoResult, FeedItemStartRow,
		UsePageSideMarginResult, p1.topicId, p1.sortIndex,
		ScrollViewPositionChangedSignal, VerticalScrollingFrameRef, SduiContext,
		SelectionOrderBase
	}))
end)