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
local var4 = game:DefineFastInt("SduiOmniFeedItemLogDelayMs", 500) / 1000
local useSduiItemCollectionSignalModule = require(serverDrivenUi.DataStore.useSduiItemCollectionSignal)

return reactModule.memo(function(p0)
	-- upvalues: omniFeedPropsKey (ref), fFlagLuaAppCompositionAlways (ref), argCheckModule (ref), reactModule (ref), usePageSideMargin (ref), appPage (ref), useSduiItemCollectionSignalModule (ref), var4 (ref), sduiErrors (ref), getSduiComponentWrapper (ref), fIntLuaAppDelayImpressionsMaxUpdates (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref)
	local appPage_1 = p0[omniFeedPropsKey].appPage
	local feedItemStartRow = p0[omniFeedPropsKey].feedItemStartRow
	local verticalScrollingFrameRef = p0[omniFeedPropsKey].verticalScrollingFrameRef
	local scrollViewPositionChangedSignal = p0[omniFeedPropsKey].scrollViewPositionChangedSignal
	local sduiContext = p0[omniFeedPropsKey].sduiContext
	local selectionOrderBase = p0[omniFeedPropsKey].selectionOrderBase
	local var6 = if fFlagLuaAppCompositionAlways then true else p0[omniFeedPropsKey].appCompositionEnabled
	argCheckModule.assert(appPage_1 ~= nil, "appPage must exist")
	argCheckModule.assert(p0.topicId ~= nil, "topicId id must exist")
	argCheckModule.assert(p0.sortIndex ~= nil, "sortIndex id must exist")
	local var7 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref)
		var7.current = true
		
		return function()
			-- upvalues: var7 (copy)
			var7.current = false
		end
	end, {})
	local var8 = if not fFlagLuaAppCompositionAlways then usePageSideMargin(verticalScrollingFrameRef.current) else nil
	local var9 = useSduiItemCollectionSignalModule(appPage_1, p0.topicId, p0.sortIndex, reactModule.useMemo(function()
		-- upvalues: appPage_1 (ref), appPage (copy), p0 (ref)
		return if appPage_1 == appPage.SearchPage and p0.searchUuid then `{appPage_1}_{p0.searchUuid}` else nil
	end, { appPage_1, p0.searchUuid }))
	local var10 = if var9 then var9.sduiConfig else nil
	local var11 = reactModule.useMemo(function()
		-- upvalues: p0 (ref)
		return { collectionPosition = p0.sortIndex }
	end, { p0.sortIndex })
	local topicId = `SduiOmniFeedItem-{p0.topicId}`
	local var13 = reactModule.useRef(var10)
	var13.current = var10
	
	if var10 == nil then
		task.delay(var4, function()
			-- upvalues: var7 (ref), var13 (ref), sduiContext (ref), sduiErrors (copy), topicId (ref), p0 (ref)
			if var7.current and var13.current == nil then
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentConfig, {
					name = topicId,
					message = `Unable to render omni feed item for sdui. CollectionId: {p0.topicId}`
				}, sduiContext.appPage)
			end
		end)
	end
	return reactModule.useMemo(function()
		-- upvalues: var10 (ref), getSduiComponentWrapper (copy), reactModule (copy), topicId (ref), sduiContext (ref), scrollViewPositionChangedSignal (ref), verticalScrollingFrameRef (ref), p0 (ref), var6 (ref), var8 (ref), feedItemStartRow (ref), fIntLuaAppDelayImpressionsMaxUpdates (copy), selectionOrderBase (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), omniFeedPropsKey (copy), var11 (ref)
		return if var10 == nil then nil else reactModule.createElement(getSduiComponentWrapper(var10), {
			debugName = topicId,
			componentConfig = var10,
			sduiContext = sduiContext,
			extraLocalProps = {
				scrollViewPositionChangedSignal = scrollViewPositionChangedSignal,
				verticalScrollingFrameRef = verticalScrollingFrameRef,
				index = p0.sortIndex,
				collectionPosition = p0.sortIndex,
				pageSideMargin = if var6 then nil else var8,
				startRow = feedItemStartRow,
				numUpdatesToDelayImpressions = fIntLuaAppDelayImpressionsMaxUpdates,
				selectionOrderBase = selectionOrderBase,
				appCompositionEnabled = var6,
				onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p0[omniFeedPropsKey].onTileImageLoaded else nil
			},
			localAnalyticsData = var11
		})
	end, {
		var10, topicId, var11, feedItemStartRow, var8, p0.topicId, p0.sortIndex,
		scrollViewPositionChangedSignal, verticalScrollingFrameRef, sduiContext,
		selectionOrderBase,
		if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p0[omniFeedPropsKey].onTileImageLoaded else nil
	})
end)