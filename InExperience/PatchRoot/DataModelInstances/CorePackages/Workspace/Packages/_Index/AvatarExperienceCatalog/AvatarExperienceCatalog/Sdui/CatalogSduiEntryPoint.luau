local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiFeatureEntryPoint = SduiSharedUtilitiesModule.SduiFeatureEntryPoint
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local _ = require(Parent.Foundation)
local FetchCatalogPageModule = require(script.Parent.fetchCatalogPage)
local UseComponentBreakpointSizeModule = require(script.Parent.Hooks.useComponentBreakpointSize)
local GetCatalogConfigKeyModule = require(script.Parent.Utils.getCatalogConfigKey)
local CatalogSduiPageContextModule = require(script.Parent.CatalogSduiPageContext)
local GetCatalogPageRequestIdStoreModule = require(AvatarExperienceCatalog.Stores.GetCatalogPageRequestIdStore)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXSduiCatalogScrollImpressions = AvatarExperienceFlagsModule.FFlagAXSduiCatalogScrollImpressions
local FFlagAXSduiFeedPublishesBreakpoint = AvatarExperienceFlagsModule.FFlagAXSduiFeedPublishesBreakpoint
local FFlagAXMarketplaceBreakpointMismatchCounter = AvatarExperienceFlagsModule.FFlagAXMarketplaceBreakpointMismatchCounter
local FFlagAXSduiFeedMaintainScrollOnSeeAll = AvatarExperienceFlagsModule.FFlagAXSduiFeedMaintainScrollOnSeeAll
local FFlagAXSduiPageVariantRequestId = AvatarExperienceFlagsModule.FFlagAXSduiPageVariantRequestId
local FFlagAXSduiPublishRequestIdWithResponse = AvatarExperienceFlagsModule.FFlagAXSduiPublishRequestIdWithResponse

return ReactModule.forwardRef(function(Frame, Ref) --[[ Line: 50 | Named "CatalogSduiEntryPoint" ]]
	-- upvalues: UseComponentBreakpointSizeModule (copy), FFlagAXSduiFeedPublishesBreakpoint (copy), FFlagAXMarketplaceBreakpointMismatchCounter (copy), ReactModule (copy), SduiLoadTimer (copy), AvatarScreen (copy), GetCatalogPageRequestIdStoreModule (copy), UseSignalStateFunction (copy), FFlagAXSduiCatalogScrollImpressions (copy), FFlagAXSduiFeedMaintainScrollOnSeeAll (copy), FFlagAXSduiPublishRequestIdWithResponse (copy), FFlagAXSduiPageVariantRequestId (copy), FetchCatalogPageModule (copy), CatalogSduiPageContextModule (copy), SduiFeatureEntryPoint (copy), GetCatalogConfigKeyModule (copy)
	local UseComponentBreakpointSizeModuleResult, UseComponentBreakpointSizeModuleResult2 = UseComponentBreakpointSizeModule(nil, if FFlagAXSduiFeedPublishesBreakpoint or FFlagAXMarketplaceBreakpointMismatchCounter then Frame.breakpointOptions else nil)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 69 ]]
		-- upvalues: SduiLoadTimer (upval), AvatarScreen (upval)
		return SduiLoadTimer.createLoadTimer(AvatarScreen.Catalog)
	end, {})
	local LoadTimer = if Frame.loadTimer then Frame.loadTimer else UseMemoResult
	local AppPage = if Frame.appPage then Frame.appPage else AvatarScreen.Catalog
	local CatalogPageRequestIdStoreModule = GetCatalogPageRequestIdStoreModule(false)
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 81 ]]
		-- upvalues: FFlagAXSduiCatalogScrollImpressions (upval), Frame (copy), FFlagAXSduiFeedMaintainScrollOnSeeAll (upval)
		return if FFlagAXSduiCatalogScrollImpressions then {
			identifier = Frame.identifier,
			onScroll = Frame.onScroll,
			requestImpressionsSignal = Frame.requestImpressionsSignal,
			scrollPositionRef = if FFlagAXSduiFeedMaintainScrollOnSeeAll then Frame.scrollPositionRef else nil,
			scrollRestoreRef = if FFlagAXSduiFeedMaintainScrollOnSeeAll then Frame.scrollRestoreRef else nil
		} else {
			identifier = Frame.identifier,
			scrollPositionRef = if FFlagAXSduiFeedMaintainScrollOnSeeAll then Frame.scrollPositionRef else nil,
			scrollRestoreRef = if FFlagAXSduiFeedMaintainScrollOnSeeAll then Frame.scrollRestoreRef else nil
		}
	end, if FFlagAXSduiCatalogScrollImpressions then {
		Frame.identifier,
		Frame.onScroll,
		Frame.requestImpressionsSignal,
		if FFlagAXSduiFeedMaintainScrollOnSeeAll then Frame.scrollPositionRef else nil,
		if FFlagAXSduiFeedMaintainScrollOnSeeAll then Frame.scrollRestoreRef else nil
	} else {
		Frame.identifier,
		if FFlagAXSduiFeedMaintainScrollOnSeeAll then Frame.scrollPositionRef else nil,
		if FFlagAXSduiFeedMaintainScrollOnSeeAll then Frame.scrollRestoreRef else nil
	})
	ReactModule.useEffect(function() --[[ Line: 116 ]]
		-- upvalues: FFlagAXSduiPublishRequestIdWithResponse (upval), CatalogPageRequestIdStoreModule (copy), Frame (copy), UseComponentBreakpointSizeModuleResult (copy), FFlagAXSduiPageVariantRequestId (upval), FetchCatalogPageModule (upval), LoadTimer (copy)
		if FFlagAXSduiPublishRequestIdWithResponse then
			CatalogPageRequestIdStoreModule.activatePageVariant(Frame.identifier, UseComponentBreakpointSizeModuleResult)
		end
		FetchCatalogPageModule({
			requestId = if FFlagAXSduiPublishRequestIdWithResponse then CatalogPageRequestIdStoreModule.getPageVariantRequestIdToSend(Frame.identifier, UseComponentBreakpointSizeModuleResult) elseif FFlagAXSduiPageVariantRequestId then CatalogPageRequestIdStoreModule.activatePageVariant(Frame.identifier, UseComponentBreakpointSizeModuleResult) else CatalogPageRequestIdStoreModule.getOrCreatePageRequestId(Frame.identifier),
			context = Frame.context,
			screenSize = UseComponentBreakpointSizeModuleResult
		}, LoadTimer)
	end, {
		LoadTimer, UseComponentBreakpointSizeModuleResult, Frame.context,
		Frame.identifier,
		UseSignalStateFunction(CatalogPageRequestIdStoreModule.getPageRequestIdMap)[Frame.identifier],
		CatalogPageRequestIdStoreModule
	})
	
	return ReactModule.createElement(CatalogSduiPageContextModule.Provider, { value = UseMemoResult1 }, ReactModule.createElement(SduiFeatureEntryPoint, {
		configKey = GetCatalogConfigKeyModule(Frame.context, UseComponentBreakpointSizeModuleResult),
		identifier = Frame.identifier,
		appPage = AppPage,
		loadTimer = LoadTimer,
		Size = Frame.Size,
		AutomaticSize = Frame.AutomaticSize,
		Position = Frame.Position,
		onAbsoluteSizeChange = UseComponentBreakpointSizeModuleResult2,
		onRetry = ReactModule.useCallback(function() --[[ Line: 138 ]]
			-- upvalues: FFlagAXSduiPageVariantRequestId (upval), CatalogPageRequestIdStoreModule (copy), Frame (copy), UseComponentBreakpointSizeModuleResult (copy), FetchCatalogPageModule (upval), LoadTimer (copy)
			if FFlagAXSduiPageVariantRequestId then
				CatalogPageRequestIdStoreModule.resetPageVariantRequestId(Frame.identifier, UseComponentBreakpointSizeModuleResult)
			else
				CatalogPageRequestIdStoreModule.resetPageRequestId(Frame.identifier)
			end
			FetchCatalogPageModule({
				requestId = if FFlagAXSduiPageVariantRequestId then CatalogPageRequestIdStoreModule.activatePageVariant(Frame.identifier, UseComponentBreakpointSizeModuleResult) else CatalogPageRequestIdStoreModule.getOrCreatePageRequestId(Frame.identifier),
				context = Frame.context,
				screenSize = UseComponentBreakpointSizeModuleResult
			}, LoadTimer, { forceRefresh = true })
		end, {
			LoadTimer,
			UseComponentBreakpointSizeModuleResult,
			Frame.context,
			Frame.identifier,
			CatalogPageRequestIdStoreModule
		}),
		shouldDisplayLoading = Frame.shouldDisplayLoading,
		shouldDisplayError = Frame.shouldDisplayError,
		loadingSlot = Frame.loadingSlot,
		errorSlot = Frame.errorSlot,
		ref = Ref
	}))
end)