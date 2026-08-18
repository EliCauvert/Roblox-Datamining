local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local useNetworking = require(parent.AvatarExperienceCommon).Hooks.useNetworking
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(avatarExperienceCatalog.Api.GetMarketplaceOffersBanner.MarketplaceOffersBannerTypes)
local marketplaceOffersBannerDisplayModule = require(avatarExperienceCatalog.Api.GetMarketplaceOffersBanner.marketplaceOffersBannerDisplay)
local useAXCatalogStoreContextModule = require(avatarExperienceCatalog.Context.useAXCatalogStoreContext)
local _ = require(avatarExperienceCatalog.Stores.createCatalogOffersBannerStore)
local useCatalogOffersBannerDismissHydrationModule = require(avatarExperienceCatalog.Hooks.useCatalogOffersBannerDismissHydration)
local useCatalogOffersBannerOffersFetchModule = require(avatarExperienceCatalog.Hooks.useCatalogOffersBannerOffersFetch)
local catalogOffersBannerAppStorageModule = require(avatarExperienceCatalog.Utils.catalogOffersBannerAppStorage)
local _ = require(script.Parent.CatalogOffersBannerView)
local catalogOffersBannerOfferModalsModule = require(script.Parent.CatalogOffersBannerOfferModals)
local getMarketplaceOffersBannerOfferDisplayId = marketplaceOffersBannerDisplayModule.getMarketplaceOffersBannerOfferDisplayId
local getMarketplaceOffersBannerOfferDisplayTitle = marketplaceOffersBannerDisplayModule.getMarketplaceOffersBannerOfferDisplayTitle
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = signalsReactModule.useSignalState
local fFlagAXCatalogOffersAutoOpenFTUXSheet = require(parent.AvatarExperienceFlags).FFlagAXCatalogOffersAutoOpenFTUXSheet

return function(p0) --[[ line: 68 | named "useCatalogOffersBannerViewModel" ]]
	-- upvalues: useAXCatalogStoreContextModule (ref), useNetworking (ref), useTokens (ref), reactModule (ref), useLocalization (ref), catalogOffersBannerAppStorageModule (ref), getMarketplaceOffersBannerOfferDisplayId (ref), useSignalState (ref), fFlagAXCatalogOffersAutoOpenFTUXSheet (ref), useCatalogOffersBannerDismissHydrationModule (ref), useCatalogOffersBannerOffersFetchModule (ref), getMarketplaceOffersBannerOfferDisplayTitle (ref), catalogOffersBannerOfferModalsModule (ref)
	local catalogOffersBannerStore = useAXCatalogStoreContextModule().catalogOffersBannerStore
	local var10 = useNetworking()
	local var11 = useTokens()
	local var12, var13 = reactModule.useState(nil)
	local var14, var15 = reactModule.useState(nil)
	local var16, var17 = reactModule.useState(false)
	local var18, var19 = reactModule.useState(false)
	local var20 = useLocalization({ okModalButton = "CommonUI.Controls.Action.OK" })
	local var21 = reactModule.useCallback(function() --[[ line: 90 ]]
		-- upvalues: var19 (ref), var17 (ref), var15 (ref)
		var19(false)
		var17(false)
		var15(nil)
	end, {})
	local var22 = reactModule.useCallback(function() --[[ line: 96 ]]
		-- upvalues: var12 (ref), catalogOffersBannerAppStorageModule (copy), getMarketplaceOffersBannerOfferDisplayId (copy), var15 (ref), var17 (ref)
		if var12 and var12.modal then
			catalogOffersBannerAppStorageModule.writeSeenOfferSheetForCurrentOffer(getMarketplaceOffersBannerOfferDisplayId(var12))
			var15(var12.modal)
			var17(true)
		end
	end, { var12 })
	local var23 = reactModule.useCallback(function() --[[ line: 104 ]]
		-- upvalues: var19 (ref)
		var19(true)
	end, {})
	local var24 = reactModule.useCallback(function() --[[ line: 108 ]]
		-- upvalues: var19 (ref)
		var19(false)
	end, {})
	local var25 = useSignalState(catalogOffersBannerStore.getPayload)
	local var26 = useSignalState(catalogOffersBannerStore.getDismissed)
	reactModule.useLayoutEffect(function() --[[ line: 115 ]]
		-- upvalues: var25 (ref), catalogOffersBannerAppStorageModule (copy), var13 (ref)
		var13(if var25 == nil then nil else catalogOffersBannerAppStorageModule.resolveVisibleOffer(var25))
	end, { var25 })
	reactModule.useEffect(function() --[[ line: 123 ]]
		-- upvalues: var12 (ref), var14 (ref), getMarketplaceOffersBannerOfferDisplayId (copy), fFlagAXCatalogOffersAutoOpenFTUXSheet (copy), catalogOffersBannerAppStorageModule (copy), var15 (ref), var17 (ref)
		if var12 == nil or var12.modal == nil then return end
		if var14 ~= nil then return end
		local var29 = getMarketplaceOffersBannerOfferDisplayId(var12)
		
		if fFlagAXCatalogOffersAutoOpenFTUXSheet and catalogOffersBannerAppStorageModule.shouldAutoOpenOfferSheetForCurrentOffer(var29) then
			catalogOffersBannerAppStorageModule.writeSeenOfferSheetForCurrentOffer(var29)
			var15(var12.modal)
			var17(true)
		end
	end, {
		var14,
		var12,
		if var12 then getMarketplaceOffersBannerOfferDisplayId(var12) else nil
	})
	useCatalogOffersBannerDismissHydrationModule(catalogOffersBannerStore, var25)
	useCatalogOffersBannerOffersFetchModule(catalogOffersBannerStore, var10)
	local var27 = if var12 ~= nil then nil else getMarketplaceOffersBannerOfferDisplayTitle(var12)
	reactModule.useEffect(function() --[[ line: 147 ]]
		-- upvalues: p0 (ref), var27 (ref), var26 (ref)
		local onBannerVisibleChanged = p0.onBannerVisibleChanged
		
		if onBannerVisibleChanged then
			onBannerVisibleChanged(var27 ~= nil and not var26)
		end
	end, { var26, var27, p0.onBannerVisibleChanged })
	
	if var26 or var25 == nil or (var12 == nil or var27 == nil) then
		return { status = "hidden" }
	end
	local var28 = var12.modal ~= nil
	
	return {
		status = "visible",
		viewProps = {
			rootTags = "col auto-y size-full-0 bg-shift-200",
			Size = p0.Size,
			Position = p0.Position,
			iconName = var12.icon,
			iconEmphasisStyle = var11.Color.System.Emphasis,
			titleContentEmphasisStyle = var11.Color.Content.Emphasis,
			titleText = var27,
			onCloseActivated = function() --[[ line: 172 ]]
				-- upvalues: catalogOffersBannerAppStorageModule (copy), getMarketplaceOffersBannerOfferDisplayId (copy), var12 (ref), var25 (ref), var13 (ref), catalogOffersBannerStore (ref)
				catalogOffersBannerAppStorageModule.writeDismissedForCurrentOffer(getMarketplaceOffersBannerOfferDisplayId(var12))
				local var30 = catalogOffersBannerAppStorageModule.resolveVisibleOffer(var25)
				var13(var30)
				
				if var30 == nil then
					catalogOffersBannerStore.setDismissed(true)
				end
			end,
			offerModalTapAreaEnabled = var28,
			onOfferBannerActivated = if var28 then var22 else nil
		},
		modals = if var14 then reactModule.createElement(catalogOffersBannerOfferModalsModule, {
			modal = var14,
			offersModalOpen = var16,
			termsModalOpen = var18,
			okButtonText = var20.okModalButton,
			onCloseOffersModal = var21,
			onOpenTermsModal = var23,
			onCloseTermsModal = var24
		}) else nil
	}
end