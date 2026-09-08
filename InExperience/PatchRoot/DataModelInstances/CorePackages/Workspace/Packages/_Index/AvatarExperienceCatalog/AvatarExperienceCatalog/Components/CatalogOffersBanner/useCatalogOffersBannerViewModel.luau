local httpService = game:GetService("HttpService")
local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local useNetworking = require(parent.AvatarExperienceCommon).Hooks.useNetworking
local useLocalization = require(parent.Localization).Hooks.useLocalization
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local sendUnifiedEventLog = avatarExperienceAnalyticsModule.sendUnifiedEventLog
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local unifiedLoggingElementNameEnums = avatarExperienceAnalyticsModule.Enums.UnifiedLoggingElementNameEnums
local unifiedLoggingSurface = avatarExperienceNavigationModule.Enums.UnifiedLoggingSurface
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
local AXSendImpressionsForCatalogOffersBanner = game:DefineFastFlag("AXSendImpressionsForCatalogOffersBanner", false)

return function(p1)
	-- upvalues: useAXCatalogStoreContextModule (ref), useNetworking (ref), useTokens (ref), reactModule (ref), useLocalization (ref), catalogOffersBannerAppStorageModule (ref), getMarketplaceOffersBannerOfferDisplayId (ref), useSignalState (ref), fFlagAXCatalogOffersAutoOpenFTUXSheet (ref), useCatalogOffersBannerDismissHydrationModule (ref), useCatalogOffersBannerOffersFetchModule (ref), getMarketplaceOffersBannerOfferDisplayTitle (ref), AXSendImpressionsForCatalogOffersBanner (ref), sendUnifiedEventLog (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), unifiedLoggingElementNameEnums (ref), httpService (ref), catalogOffersBannerOfferModalsModule (ref)
	local catalogOffersBannerStore = useAXCatalogStoreContextModule().catalogOffersBannerStore
	local var1 = useNetworking()
	local var2 = useTokens()
	local var3, var4 = reactModule.useState(nil)
	local var5, var6 = reactModule.useState(nil)
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState(false)
	local var11 = useLocalization({ okModalButton = "CommonUI.Controls.Action.OK" })
	local var12 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), var8 (ref), var6 (ref)
		var10(false)
		var8(false)
		var6(nil)
	end, {})
	local var13 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), catalogOffersBannerAppStorageModule (copy), getMarketplaceOffersBannerOfferDisplayId (copy), var6 (ref), var8 (ref)
		if var3 and var3.modal then
			catalogOffersBannerAppStorageModule.writeSeenOfferSheetForCurrentOffer(getMarketplaceOffersBannerOfferDisplayId(var3))
			var6(var3.modal)
			var8(true)
		end
	end, { var3 })
	local var14 = reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10(true)
	end, {})
	local var15 = reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10(false)
	end, {})
	local var16 = useSignalState(catalogOffersBannerStore.getPayload)
	local var17 = useSignalState(catalogOffersBannerStore.getDismissed)
	reactModule.useLayoutEffect(function()
		-- upvalues: var16 (ref), catalogOffersBannerAppStorageModule (copy), var4 (ref)
		var4(if var16 == nil then nil else catalogOffersBannerAppStorageModule.resolveVisibleOffer(var16))
	end, { var16 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var5 (ref), getMarketplaceOffersBannerOfferDisplayId (copy), fFlagAXCatalogOffersAutoOpenFTUXSheet (copy), catalogOffersBannerAppStorageModule (copy), var6 (ref), var8 (ref)
		if var3 == nil or var3.modal == nil then return end
		if var5 ~= nil then return end
		local var18 = getMarketplaceOffersBannerOfferDisplayId(var3)
		
		if fFlagAXCatalogOffersAutoOpenFTUXSheet and catalogOffersBannerAppStorageModule.shouldAutoOpenOfferSheetForCurrentOffer(var18) then
			catalogOffersBannerAppStorageModule.writeSeenOfferSheetForCurrentOffer(var18)
			var6(var3.modal)
			var8(true)
		end
	end, {
		var5,
		var3,
		if var3 then getMarketplaceOffersBannerOfferDisplayId(var3) else nil
	})
	useCatalogOffersBannerDismissHydrationModule(catalogOffersBannerStore, var16)
	useCatalogOffersBannerOffersFetchModule(catalogOffersBannerStore, var1)
	local var18 = if var3 ~= nil then nil else getMarketplaceOffersBannerOfferDisplayTitle(var3)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var18 (ref), var17 (ref)
		local onBannerVisibleChanged = p1.onBannerVisibleChanged
		
		if onBannerVisibleChanged then
			onBannerVisibleChanged(var18 ~= nil and not var17)
		end
	end, { var17, var18, p1.onBannerVisibleChanged })
	
	if AXSendImpressionsForCatalogOffersBanner then
		reactModule.useEffect(function()
			-- upvalues: var17 (ref), var3 (ref), var18 (ref), sendUnifiedEventLog (copy), unifiedEventLogEnums (copy), unifiedLoggingSurface (copy), unifiedLoggingElementNameEnums (copy), httpService (copy)
			if not var17 and var3 and var18 then
				sendUnifiedEventLog({
					action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_IMPRESSION,
					surface = unifiedLoggingSurface.CATALOG,
					elementName = unifiedLoggingElementNameEnums.CATALOG_OFFERS_BANNER,
					elementMetadata = httpService:JSONEncode({ offerId = var3.offerId })
				})
			end
		end, { var17, var3, var18 })
	end
	if var17 or var16 == nil or (var3 == nil or var18 == nil) then
		return { status = "hidden" }
	end
	local var19 = var3.modal ~= nil
	
	return {
		status = "visible",
		viewProps = {
			rootTags = "col auto-y size-full-0 bg-shift-200",
			Size = p1.Size,
			Position = p1.Position,
			iconName = var3.icon,
			iconEmphasisStyle = var2.Color.System.Emphasis,
			titleContentEmphasisStyle = var2.Color.Content.Emphasis,
			titleText = var18,
			onCloseActivated = function()
				-- upvalues: catalogOffersBannerAppStorageModule (copy), getMarketplaceOffersBannerOfferDisplayId (copy), var3 (ref), var16 (ref), var4 (ref), catalogOffersBannerStore (ref)
				catalogOffersBannerAppStorageModule.writeDismissedForCurrentOffer(getMarketplaceOffersBannerOfferDisplayId(var3))
				local var20 = catalogOffersBannerAppStorageModule.resolveVisibleOffer(var16)
				var4(var20)
				
				if var20 == nil then
					catalogOffersBannerStore.setDismissed(true)
				end
			end,
			offerModalTapAreaEnabled = var19,
			onOfferBannerActivated = if var19 then var13 else nil
		},
		modals = if var5 then reactModule.createElement(catalogOffersBannerOfferModalsModule, {
			modal = var5,
			offersModalOpen = var7,
			termsModalOpen = var9,
			okButtonText = var11.okModalButton,
			onCloseOffersModal = var12,
			onOpenTermsModal = var14,
			onCloseTermsModal = var15
		}) else nil
	}
end