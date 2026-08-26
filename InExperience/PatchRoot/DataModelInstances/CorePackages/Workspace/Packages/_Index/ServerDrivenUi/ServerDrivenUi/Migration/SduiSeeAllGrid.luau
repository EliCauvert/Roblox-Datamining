local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local argCheckModule = require(parent.ArgCheck)
local reactModule = require(parent.React)
local tutilsModule = require(parent.tutils)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiComponentType = sduiCoreSystemModule.SduiComponentType
local sduiConfigReducerModule = require(serverDrivenUi.Rodux.SduiConfigReducer)
local sduiComponent = sduiCoreSystemModule.SduiComponent
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiParsers = sduiCoreSystemModule.SduiParsers
local useSduiContextModule = require(serverDrivenUi.System.useSduiContext)
local useCollectionLayoutConfig = require(parent.CollectionViews).useCollectionLayoutConfig
local fIntLuaAppDelayImpressionsMaxUpdates = require(parent.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates
local fFlagLuaAppLayoutParamsInContext = require(parent.SharedFlags).FFlagLuaAppLayoutParamsInContext

return reactModule.memo(function(p1)
	-- upvalues: argCheckModule (ref), useSelector (ref), sduiConfigReducerModule (ref), tutilsModule (ref), fFlagLuaAppLayoutParamsInContext (ref), useCollectionLayoutConfig (ref), useSduiContextModule (ref), reactModule (ref), sduiErrors (ref), sduiBuilder (ref), sduiParsers (ref), sduiComponentType (ref), sduiComponent (ref), fIntLuaAppDelayImpressionsMaxUpdates (ref)
	local layoutOrder = p1.layoutOrder
	local verticalScrollingFrameRef = p1.verticalScrollingFrameRef
	local scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal
	argCheckModule.assert(p1.collectionId ~= nil, "collectionId id must exist")
	argCheckModule.assert(p1.collectionIndex ~= nil, "collectionIndex id must exist")
	local var1 = useSelector(function(p2)
		-- upvalues: sduiConfigReducerModule (copy), p1 (ref)
		local t = {}
		local appPage = p2.Personalization[sduiConfigReducerModule.key][p1.appPage]
		
		if appPage then
			for i, v in appPage.itemCollections do
				if tostring(p1.collectionId) == tostring(v.sduiConfig.analyticsData.collectionId) then
					t.feedItemData = v
					break
				end
			end
			t.templates = if appPage.rootConfig then appPage.rootConfig.templates else nil
		end
		return t
	end, tutilsModule.shallowEqual)
	local var2 = useSduiContextModule({
		appPage = p1.appPage,
		templates = var1.templates,
		dataUpdatedTimestamp = var1.feedItemData and var1.feedItemData.dataUpdatedTimestamp,
		pageLayoutConfig = if fFlagLuaAppLayoutParamsInContext then if fFlagLuaAppLayoutParamsInContext then useCollectionLayoutConfig(p1.contentFrame, 0) else nil else nil
	})
	local feedItemData = var1.feedItemData
	local var3 = reactModule.useMemo(function()
		-- upvalues: feedItemData (ref), var2 (ref), sduiErrors (copy), p1 (ref), sduiBuilder (copy), sduiParsers (copy), sduiComponentType (copy)
		if not feedItemData or not feedItemData.sduiConfig then
			var2.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentConfig, {
				name = "SduiSeeAllGrid",
				message = `Missing component config client-driven SDUI grid for see-all. CollectionId: {p1.collectionId}`
			}, var2.appPage)
			
			return nil
		elseif not feedItemData.sduiConfig.props then
			var2.dependencies.logger.reportError(sduiErrors.SduiErrorType.InvalidComponentConfig, {
				name = "SduiSeeAllGrid",
				message = `Missing props for component config for client-driven SDUI grid for see-all. CollectionId: {p1.collectionId}`
			}, var2.appPage)
			
			return nil
		end
		local itemHeightFromWidth
		local sduiConfig = feedItemData.sduiConfig
		local _ = nil
		
		if sduiConfig.props.items and #sduiConfig.props.items > 0 and sduiConfig.props.itemHeightFromWidth == nil then
			local var4 = sduiConfig.props.items[1]
			
			if sduiConfig.props.itemTemplateKey and var4.templateKey == nil then
				var4.templateKey = sduiConfig.props.itemTemplateKey
			end
			if not sduiBuilder.getComponentType(var4, var2) then
				var2.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentType, {
					name = "SduiSeeAllGrid",
					message = `Missing componentType for first item. CollectionId: {p1.collectionId}`
				}, var2.appPage)
				
				return nil
			end
			local var5 = nil
			
			if var4 then
				local imageAspectRatio = var4.props and (var4.props.imageAspectRatio and sduiParsers.safeParseNumber(var4.props.imageAspectRatio, var2, {}))
				
				if imageAspectRatio and imageAspectRatio > 0 then
					var5 = 1 / imageAspectRatio
				end
			end
			if not var5 then
				var5 = if sduiConfig.props.collectionItemSize == "Medium" or sduiConfig.props.collectionItemSize == "Large" then 0.5625 else 1
			end
			itemHeightFromWidth = UDim.new(var5, if var4 then (if var4.props then var4.props.titleLines else 1) * 20 + 20 + 8 else nil)
		else
			itemHeightFromWidth = sduiConfig.props.itemHeightFromWidth
		end
		return {
			componentType = sduiComponentType.CollectionGrid,
			props = {
				items = sduiConfig.props.items,
				impressionEventName = sduiConfig.props.impressionEventName,
				skipItemImpressionsLog = sduiConfig.props.skipItemImpressionsLog,
				collectionItemSize = sduiConfig.props.collectionItemSize,
				itemTemplateKey = sduiConfig.props.itemTemplateKey,
				itemHeightFromWidth = itemHeightFromWidth
			},
			analyticsData = sduiConfig.analyticsData
		}
	end, { feedItemData and feedItemData.sduiConfig, var2 })
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), var2 (ref), sduiErrors (copy), p1 (ref), reactModule (copy), sduiComponent (copy), feedItemData (ref), scrollViewPositionChangedSignal (ref), verticalScrollingFrameRef (ref), fIntLuaAppDelayImpressionsMaxUpdates (copy), layoutOrder (ref), fFlagLuaAppLayoutParamsInContext (copy)
		if var3 == nil then
			var2.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentConfig, {
				name = "SduiSeeAllGrid",
				message = `Unable to generate component config for client-driven SDUI grid for see-all. CollectionId: {p1.collectionId}`
			}, var2.appPage)
			
			return nil
		end
		return reactModule.createElement(sduiComponent, {
			debugName = "SeeAllGrid",
			componentConfig = var3,
			sduiContext = var2,
			extraLocalProps = {
				pageSideMargin = 0,
				startRow = 1,
				disableImpressionsDetector = true,
				dataUpdatedTimestamp = feedItemData.dataUpdatedTimestamp,
				scrollViewPositionChangedSignal = scrollViewPositionChangedSignal,
				verticalScrollingFrameRef = verticalScrollingFrameRef,
				index = p1.collectionIndex,
				collectionPosition = p1.collectionIndex,
				numUpdatesToDelayImpressions = fIntLuaAppDelayImpressionsMaxUpdates,
				layoutOrder = layoutOrder,
				layoutOverrides = if fFlagLuaAppLayoutParamsInContext then nil else {
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
	end, {
		var3, layoutOrder,
		if feedItemData then feedItemData.dataUpdatedTimestamp else nil, 1,
		p1.collectionId, p1.collectionIndex, scrollViewPositionChangedSignal,
		verticalScrollingFrameRef, var2, p1.impressionsTag, p1.setLogImpressions,
		p1.sendGameImpressions, p1.onCollectionViewabilityChanged
	})
end)