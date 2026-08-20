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

return reactModule.forwardRef(function(p0, p1) --[[ line: 42 | named "CatalogSduiEntryPoint" ]]
	-- upvalues: useComponentBreakpointSizeModule (ref), reactModule (ref), sduiLoadTimer (ref), avatarScreen (ref), getCatalogPageRequestIdStoreModule (ref), useSignalState (ref), fFlagAXSduiCatalogScrollImpressions (ref), fetchCatalogPageModule (ref), catalogSduiPageContextModule (ref), sduiFeatureEntryPoint (ref), getCatalogConfigKeyModule (ref)
	local var8, var9 = useComponentBreakpointSizeModule()
	local var10 = if p0.loadTimer then p0.loadTimer else reactModule.useMemo(function() --[[ line: 56 ]]
		-- upvalues: sduiLoadTimer (copy), avatarScreen (copy)
		return sduiLoadTimer.createLoadTimer(avatarScreen.Catalog)
	end, {})
	local var11 = if p0.appPage then p0.appPage else avatarScreen.Catalog
	local var12 = getCatalogPageRequestIdStoreModule(false)
	local var13 = reactModule.useMemo(function() --[[ line: 68 ]]
		-- upvalues: fFlagAXSduiCatalogScrollImpressions (copy), p0 (ref)
		return if fFlagAXSduiCatalogScrollImpressions then {
			identifier = p0.identifier,
			onScroll = p0.onScroll,
			requestImpressionsSignal = p0.requestImpressionsSignal
		} else { identifier = p0.identifier }
	end, if fFlagAXSduiCatalogScrollImpressions then { p0.identifier, p0.onScroll, p0.requestImpressionsSignal } else { p0.identifier })
	reactModule.useEffect(function() --[[ line: 87 ]]
		-- upvalues: var12 (ref), p0 (ref), fetchCatalogPageModule (copy), var8 (ref), var10 (ref)
		fetchCatalogPageModule({
			requestId = var12.getOrCreatePageRequestId(p0.identifier),
			context = p0.context,
			screenSize = var8
		}, var10)
	end, {
		var10, var8, p0.context, p0.identifier,
		useSignalState(var12.getPageRequestIdMap)[p0.identifier], var12
	})
	
	return reactModule.createElement(catalogSduiPageContextModule.Provider, { value = var13 }, reactModule.createElement(sduiFeatureEntryPoint, {
		configKey = getCatalogConfigKeyModule(p0.context, var8),
		identifier = p0.identifier,
		appPage = var11,
		loadTimer = var10,
		Size = p0.Size,
		AutomaticSize = p0.AutomaticSize,
		Position = p0.Position,
		onAbsoluteSizeChange = var9,
		onRetry = reactModule.useCallback(function() --[[ line: 98 ]]
			-- upvalues: var12 (ref), p0 (ref), fetchCatalogPageModule (copy), var8 (ref), var10 (ref)
			var12.resetPageRequestId(p0.identifier)
			fetchCatalogPageModule({
				requestId = var12.getOrCreatePageRequestId(p0.identifier),
				context = p0.context,
				screenSize = var8
			}, var10, { forceRefresh = true })
		end, {
			var10,
			var8,
			p0.context,
			p0.identifier,
			var12
		}),
		shouldDisplayLoading = p0.shouldDisplayLoading,
		shouldDisplayError = p0.shouldDisplayError,
		loadingSlot = p0.loadingSlot,
		errorSlot = p0.errorSlot,
		ref = p1
	}))
end)