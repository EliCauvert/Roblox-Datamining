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

return ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseComponentBreakpointSizeModule (copy), ReactModule (copy), SduiLoadTimer (copy), AvatarScreen (copy), GetCatalogPageRequestIdStoreModule (copy), UseSignalStateFunction (copy), FetchCatalogPageModule (copy), CatalogSduiPageContextModule (copy), SduiFeatureEntryPoint (copy), GetCatalogConfigKeyModule (copy)
	local UseComponentBreakpointSizeModuleResult, UseComponentBreakpointSizeModuleResult2 = UseComponentBreakpointSizeModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SduiLoadTimer (upval), AvatarScreen (upval)
		return SduiLoadTimer.createLoadTimer(AvatarScreen.Catalog)
	end, {})
	local LoadTimer = if Frame.loadTimer then Frame.loadTimer else UseMemoResult
	local AppPage = if Frame.appPage then Frame.appPage else AvatarScreen.Catalog
	local CatalogPageRequestIdStoreModule = GetCatalogPageRequestIdStoreModule(false)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Frame (copy)
		return { identifier = Frame.identifier }
	end, { Frame.identifier })
	ReactModule.useEffect(function()
		-- upvalues: CatalogPageRequestIdStoreModule (copy), Frame (copy), FetchCatalogPageModule (upval), UseComponentBreakpointSizeModuleResult (copy), LoadTimer (copy)
		FetchCatalogPageModule({
			requestId = CatalogPageRequestIdStoreModule.getOrCreatePageRequestId(Frame.identifier),
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
		onRetry = ReactModule.useCallback(function()
			-- upvalues: CatalogPageRequestIdStoreModule (copy), Frame (copy), FetchCatalogPageModule (upval), UseComponentBreakpointSizeModuleResult (copy), LoadTimer (copy)
			CatalogPageRequestIdStoreModule.resetPageRequestId(Frame.identifier)
			FetchCatalogPageModule({
				requestId = CatalogPageRequestIdStoreModule.getOrCreatePageRequestId(Frame.identifier),
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