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
local fFlagAXSduiCatalogScrollImpressions = require(parent.AvatarExperienceFlags).FFlagAXSduiCatalogScrollImpressions

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useComponentBreakpointSizeModule (ref), reactModule (ref), sduiLoadTimer (ref), avatarScreen (ref), getCatalogPageRequestIdStoreModule (ref), useSignalState (ref), fFlagAXSduiCatalogScrollImpressions (ref), fetchCatalogPageModule (ref), catalogSduiPageContextModule (ref), sduiFeatureEntryPoint (ref), getCatalogConfigKeyModule (ref)
	local var1, var2 = useComponentBreakpointSizeModule()
	local var3 = if p1.loadTimer then p1.loadTimer else reactModule.useMemo(function()
		-- upvalues: sduiLoadTimer (copy), avatarScreen (copy)
		return sduiLoadTimer.createLoadTimer(avatarScreen.Catalog)
	end, {})
	local var4 = if p1.appPage then p1.appPage else avatarScreen.Catalog
	local var5 = getCatalogPageRequestIdStoreModule(false)
	local var6 = reactModule.useMemo(function()
		-- upvalues: fFlagAXSduiCatalogScrollImpressions (copy), p1 (ref)
		return if fFlagAXSduiCatalogScrollImpressions then {
			identifier = p1.identifier,
			onScroll = p1.onScroll,
			requestImpressionsSignal = p1.requestImpressionsSignal
		} else { identifier = p1.identifier }
	end, if fFlagAXSduiCatalogScrollImpressions then { p1.identifier, p1.onScroll, p1.requestImpressionsSignal } else { p1.identifier })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), p1 (ref), fetchCatalogPageModule (copy), var1 (ref), var3 (ref)
		fetchCatalogPageModule({
			requestId = var5.getOrCreatePageRequestId(p1.identifier),
			context = p1.context,
			screenSize = var1
		}, var3)
	end, {
		var3, var1, p1.context, p1.identifier,
		useSignalState(var5.getPageRequestIdMap)[p1.identifier], var5
	})
	
	return reactModule.createElement(catalogSduiPageContextModule.Provider, { value = var6 }, reactModule.createElement(sduiFeatureEntryPoint, {
		configKey = getCatalogConfigKeyModule(p1.context, var1),
		identifier = p1.identifier,
		appPage = var4,
		loadTimer = var3,
		Size = p1.Size,
		AutomaticSize = p1.AutomaticSize,
		Position = p1.Position,
		onAbsoluteSizeChange = var2,
		onRetry = reactModule.useCallback(function()
			-- upvalues: var5 (ref), p1 (ref), fetchCatalogPageModule (copy), var1 (ref), var3 (ref)
			var5.resetPageRequestId(p1.identifier)
			fetchCatalogPageModule({
				requestId = var5.getOrCreatePageRequestId(p1.identifier),
				context = p1.context,
				screenSize = var1
			}, var3, { forceRefresh = true })
		end, {
			var3,
			var1,
			p1.context,
			p1.identifier,
			var5
		}),
		shouldDisplayLoading = p1.shouldDisplayLoading,
		shouldDisplayError = p1.shouldDisplayError,
		loadingSlot = p1.loadingSlot,
		errorSlot = p1.errorSlot,
		ref = p2
	}))
end)