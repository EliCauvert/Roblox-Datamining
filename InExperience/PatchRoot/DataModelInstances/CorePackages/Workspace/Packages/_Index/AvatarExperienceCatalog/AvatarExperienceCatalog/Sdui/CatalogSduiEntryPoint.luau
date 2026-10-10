local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiFeatureEntryPoint = sduiSharedUtilitiesModule.SduiFeatureEntryPoint
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local _ = require(parent.Foundation)
local fetchCatalogPageModule = require(script.Parent.fetchCatalogPage)
local useComponentBreakpointSizeModule = require(script.Parent.Hooks.useComponentBreakpointSize)
local getCatalogConfigKeyModule = require(script.Parent.Utils.getCatalogConfigKey)
local catalogSduiPageContextModule = require(script.Parent.CatalogSduiPageContext)
local getCatalogPageRequestIdStoreModule = require(avatarExperienceCatalog.Stores.GetCatalogPageRequestIdStore)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXSduiCatalogScrollImpressions = avatarExperienceFlagsModule.FFlagAXSduiCatalogScrollImpressions
local fFlagAXSduiFeedPublishesBreakpoint = avatarExperienceFlagsModule.FFlagAXSduiFeedPublishesBreakpoint
local fFlagAXMarketplaceBreakpointMismatchCounter = avatarExperienceFlagsModule.FFlagAXMarketplaceBreakpointMismatchCounter
local fFlagAXSduiFeedMaintainScrollOnSeeAll = avatarExperienceFlagsModule.FFlagAXSduiFeedMaintainScrollOnSeeAll
local fFlagAXSduiPageVariantRequestId = avatarExperienceFlagsModule.FFlagAXSduiPageVariantRequestId

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useComponentBreakpointSizeModule (ref), fFlagAXSduiFeedPublishesBreakpoint (ref), fFlagAXMarketplaceBreakpointMismatchCounter (ref), reactModule (ref), sduiLoadTimer (ref), avatarScreen (ref), getCatalogPageRequestIdStoreModule (ref), useSignalState (ref), fFlagAXSduiCatalogScrollImpressions (ref), fFlagAXSduiFeedMaintainScrollOnSeeAll (ref), fFlagAXSduiPageVariantRequestId (ref), fetchCatalogPageModule (ref), catalogSduiPageContextModule (ref), sduiFeatureEntryPoint (ref), getCatalogConfigKeyModule (ref)
	local var1 = nil
	var10, var9 = useComponentBreakpointSizeModule(var1, if fFlagAXSduiFeedPublishesBreakpoint or fFlagAXMarketplaceBreakpointMismatchCounter then p1.breakpointOptions else nil)
	local var2 = if p1.loadTimer then p1.loadTimer else reactModule.useMemo(function()
		-- upvalues: sduiLoadTimer (copy), avatarScreen (copy)
		return sduiLoadTimer.createLoadTimer(avatarScreen.Catalog)
	end, {})
	local var3 = if p1.appPage then p1.appPage else avatarScreen.Catalog
	local var4 = getCatalogPageRequestIdStoreModule(false)
	local var5 = reactModule.useMemo(function()
		-- upvalues: fFlagAXSduiCatalogScrollImpressions (copy), p1 (ref), fFlagAXSduiFeedMaintainScrollOnSeeAll (copy)
		return if fFlagAXSduiCatalogScrollImpressions then {
			identifier = p1.identifier,
			onScroll = p1.onScroll,
			requestImpressionsSignal = p1.requestImpressionsSignal,
			scrollPositionRef = if fFlagAXSduiFeedMaintainScrollOnSeeAll then p1.scrollPositionRef else nil,
			scrollRestoreRef = if fFlagAXSduiFeedMaintainScrollOnSeeAll then p1.scrollRestoreRef else nil
		} else {
			identifier = p1.identifier,
			scrollPositionRef = if fFlagAXSduiFeedMaintainScrollOnSeeAll then p1.scrollPositionRef else nil,
			scrollRestoreRef = if fFlagAXSduiFeedMaintainScrollOnSeeAll then p1.scrollRestoreRef else nil
		}
	end, if fFlagAXSduiCatalogScrollImpressions then {
		p1.identifier,
		p1.onScroll,
		p1.requestImpressionsSignal,
		if fFlagAXSduiFeedMaintainScrollOnSeeAll then p1.scrollPositionRef else nil,
		if fFlagAXSduiFeedMaintainScrollOnSeeAll then p1.scrollRestoreRef else nil
	} else {
		p1.identifier,
		if fFlagAXSduiFeedMaintainScrollOnSeeAll then p1.scrollPositionRef else nil,
		if fFlagAXSduiFeedMaintainScrollOnSeeAll then p1.scrollRestoreRef else nil
	})
	reactModule.useEffect(function()
		-- upvalues: fFlagAXSduiPageVariantRequestId (copy), var4 (ref), p1 (ref), var10 (ref), fetchCatalogPageModule (copy), var2 (ref)
		fetchCatalogPageModule({
			requestId = if fFlagAXSduiPageVariantRequestId then var4.activatePageVariant(p1.identifier, var10) else var4.getOrCreatePageRequestId(p1.identifier),
			context = p1.context,
			screenSize = var10
		}, var2)
	end, {
		var2, var10, p1.context, p1.identifier,
		useSignalState(var4.getPageRequestIdMap)[p1.identifier], var4
	})
	
	return reactModule.createElement(catalogSduiPageContextModule.Provider, { value = var5 }, reactModule.createElement(sduiFeatureEntryPoint, {
		configKey = getCatalogConfigKeyModule(p1.context, var10),
		identifier = p1.identifier,
		appPage = var3,
		loadTimer = var2,
		Size = p1.Size,
		AutomaticSize = p1.AutomaticSize,
		Position = p1.Position,
		onAbsoluteSizeChange = var1,
		onRetry = reactModule.useCallback(function()
			-- upvalues: fFlagAXSduiPageVariantRequestId (copy), var4 (ref), p1 (ref), var10 (ref), fetchCatalogPageModule (copy), var2 (ref)
			if fFlagAXSduiPageVariantRequestId then
				var4.resetPageVariantRequestId(p1.identifier, var10)
			else
				var4.resetPageRequestId(p1.identifier)
			end
			fetchCatalogPageModule({
				requestId = if fFlagAXSduiPageVariantRequestId then var4.activatePageVariant(p1.identifier, var10) else var4.getOrCreatePageRequestId(p1.identifier),
				context = p1.context,
				screenSize = var10
			}, var2, { forceRefresh = true })
		end, {
			var2,
			var10,
			p1.context,
			p1.identifier,
			var4
		}),
		shouldDisplayLoading = p1.shouldDisplayLoading,
		shouldDisplayError = p1.shouldDisplayError,
		loadingSlot = p1.loadingSlot,
		errorSlot = p1.errorSlot,
		ref = p2
	}))
end)