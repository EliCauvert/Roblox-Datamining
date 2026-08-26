local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local argCheckModule = require(parent.ArgCheck)
local reactModule = require(parent.React)
local omniFeedPropsKey = require(parent.DiscoveryTypes).OmniFeedPropsKey
local usePageSideMargin = require(parent.CollectionViews).usePageSideMargin
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrors = sduiCoreSystemModule.SduiErrors
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local fIntLuaAppDelayImpressionsMaxUpdates = require(parent.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local var1 = game:DefineFastInt("SduiOmniFeedItemLogDelayMs", 500) / 1000
local useSduiItemCollectionSignalModule = require(serverDrivenUi.DataStore.useSduiItemCollectionSignal)

return reactModule.memo(function(p1)
	-- upvalues: omniFeedPropsKey (ref), fFlagLuaAppCompositionAlways (ref), argCheckModule (ref), reactModule (ref), usePageSideMargin (ref), appPage (ref), useSduiItemCollectionSignalModule (ref), var1 (ref), sduiErrors (ref), getSduiComponentWrapper (ref), fIntLuaAppDelayImpressionsMaxUpdates (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref)
	local appPage_1 = p1[omniFeedPropsKey].appPage
	local feedItemStartRow = p1[omniFeedPropsKey].feedItemStartRow
	local verticalScrollingFrameRef = p1[omniFeedPropsKey].verticalScrollingFrameRef
	local scrollViewPositionChangedSignal = p1[omniFeedPropsKey].scrollViewPositionChangedSignal
	local sduiContext = p1[omniFeedPropsKey].sduiContext
	local selectionOrderBase = p1[omniFeedPropsKey].selectionOrderBase
	local var2 = if fFlagLuaAppCompositionAlways then true else p1[omniFeedPropsKey].appCompositionEnabled
	argCheckModule.assert(appPage_1 ~= nil, "appPage must exist")
	argCheckModule.assert(p1.topicId ~= nil, "topicId id must exist")
	argCheckModule.assert(p1.sortIndex ~= nil, "sortIndex id must exist")
	local var3 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		var3.current = true
		
		return function()
			-- upvalues: var3 (copy)
			var3.current = false
		end
	end, {})
	local var4 = if not fFlagLuaAppCompositionAlways then usePageSideMargin(verticalScrollingFrameRef.current) else nil
	local var5 = useSduiItemCollectionSignalModule(appPage_1, p1.topicId, p1.sortIndex, reactModule.useMemo(function()
		-- upvalues: appPage_1 (ref), appPage (copy), p1 (ref)
		return if appPage_1 == appPage.SearchPage and p1.searchUuid then `{appPage_1}_{p1.searchUuid}` else nil
	end, { appPage_1, p1.searchUuid }))
	local var6 = if var5 then var5.sduiConfig else nil
	local var7 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return { collectionPosition = p1.sortIndex }
	end, { p1.sortIndex })
	local topicId = `SduiOmniFeedItem-{p1.topicId}`
	local var8 = reactModule.useRef(var6)
	var8.current = var6
	
	if var6 == nil then
		task.delay(var1, function()
			-- upvalues: var3 (ref), var8 (ref), sduiContext (ref), sduiErrors (copy), topicId (ref), p1 (ref)
			if var3.current and var8.current == nil then
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentConfig, {
					name = topicId,
					message = `Unable to render omni feed item for sdui. CollectionId: {p1.topicId}`
				}, sduiContext.appPage)
			end
		end)
	end
	return reactModule.useMemo(function()
		-- upvalues: var6 (ref), getSduiComponentWrapper (copy), reactModule (copy), topicId (ref), sduiContext (ref), scrollViewPositionChangedSignal (ref), verticalScrollingFrameRef (ref), p1 (ref), var2 (ref), var4 (ref), feedItemStartRow (ref), fIntLuaAppDelayImpressionsMaxUpdates (copy), selectionOrderBase (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), omniFeedPropsKey (copy), var7 (ref)
		return if var6 == nil then nil else reactModule.createElement(getSduiComponentWrapper(var6), {
			debugName = topicId,
			componentConfig = var6,
			sduiContext = sduiContext,
			extraLocalProps = {
				scrollViewPositionChangedSignal = scrollViewPositionChangedSignal,
				verticalScrollingFrameRef = verticalScrollingFrameRef,
				index = p1.sortIndex,
				collectionPosition = p1.sortIndex,
				pageSideMargin = if var2 then nil else var4,
				startRow = feedItemStartRow,
				numUpdatesToDelayImpressions = fIntLuaAppDelayImpressionsMaxUpdates,
				selectionOrderBase = selectionOrderBase,
				appCompositionEnabled = var2,
				onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1[omniFeedPropsKey].onTileImageLoaded else nil
			},
			localAnalyticsData = var7
		})
	end, {
		var6, topicId, var7, feedItemStartRow, var4, p1.topicId, p1.sortIndex,
		scrollViewPositionChangedSignal, verticalScrollingFrameRef, sduiContext,
		selectionOrderBase,
		if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1[omniFeedPropsKey].onTileImageLoaded else nil
	})
end)