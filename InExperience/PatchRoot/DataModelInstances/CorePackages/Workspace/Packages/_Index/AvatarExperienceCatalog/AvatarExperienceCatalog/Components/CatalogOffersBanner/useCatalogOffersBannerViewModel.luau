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

return function(p0) --[[ line: 79 | named "useCatalogOffersBannerViewModel" ]]
	-- upvalues: useAXCatalogStoreContextModule (ref), useNetworking (ref), useTokens (ref), reactModule (ref), useLocalization (ref), catalogOffersBannerAppStorageModule (ref), getMarketplaceOffersBannerOfferDisplayId (ref), useSignalState (ref), fFlagAXCatalogOffersAutoOpenFTUXSheet (ref), useCatalogOffersBannerDismissHydrationModule (ref), useCatalogOffersBannerOffersFetchModule (ref), getMarketplaceOffersBannerOfferDisplayTitle (ref), AXSendImpressionsForCatalogOffersBanner (ref), sendUnifiedEventLog (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), unifiedLoggingElementNameEnums (ref), httpService (ref), catalogOffersBannerOfferModalsModule (ref)
	local catalogOffersBannerStore = useAXCatalogStoreContextModule().catalogOffersBannerStore
	local var14 = useNetworking()
	local var15 = useTokens()
	local var16, var17 = reactModule.useState(nil)
	local var18, var19 = reactModule.useState(nil)
	local var20, var21 = reactModule.useState(false)
	local var22, var23 = reactModule.useState(false)
	local var24 = useLocalization({ okModalButton = "CommonUI.Controls.Action.OK" })
	local var25 = reactModule.useCallback(function() --[[ line: 101 ]]
		-- upvalues: var23 (ref), var21 (ref), var19 (ref)
		var23(false)
		var21(false)
		var19(nil)
	end, {})
	local var26 = reactModule.useCallback(function() --[[ line: 107 ]]
		-- upvalues: var16 (ref), catalogOffersBannerAppStorageModule (copy), getMarketplaceOffersBannerOfferDisplayId (copy), var19 (ref), var21 (ref)
		if var16 and var16.modal then
			catalogOffersBannerAppStorageModule.writeSeenOfferSheetForCurrentOffer(getMarketplaceOffersBannerOfferDisplayId(var16))
			var19(var16.modal)
			var21(true)
		end
	end, { var16 })
	local var27 = reactModule.useCallback(function() --[[ line: 115 ]]
		-- upvalues: var23 (ref)
		var23(true)
	end, {})
	local var28 = reactModule.useCallback(function() --[[ line: 119 ]]
		-- upvalues: var23 (ref)
		var23(false)
	end, {})
	local var29 = useSignalState(catalogOffersBannerStore.getPayload)
	local var30 = useSignalState(catalogOffersBannerStore.getDismissed)
	reactModule.useLayoutEffect(function() --[[ line: 126 ]]
		-- upvalues: var29 (ref), catalogOffersBannerAppStorageModule (copy), var17 (ref)
		var17(if var29 == nil then nil else catalogOffersBannerAppStorageModule.resolveVisibleOffer(var29))
	end, { var29 })
	reactModule.useEffect(function() --[[ line: 134 ]]
		-- upvalues: var16 (ref), var18 (ref), getMarketplaceOffersBannerOfferDisplayId (copy), fFlagAXCatalogOffersAutoOpenFTUXSheet (copy), catalogOffersBannerAppStorageModule (copy), var19 (ref), var21 (ref)
		if var16 == nil or var16.modal == nil then return end
		if var18 ~= nil then return end
		local var33 = getMarketplaceOffersBannerOfferDisplayId(var16)
		
		if fFlagAXCatalogOffersAutoOpenFTUXSheet and catalogOffersBannerAppStorageModule.shouldAutoOpenOfferSheetForCurrentOffer(var33) then
			catalogOffersBannerAppStorageModule.writeSeenOfferSheetForCurrentOffer(var33)
			var19(var16.modal)
			var21(true)
		end
	end, {
		var18,
		var16,
		if var16 then getMarketplaceOffersBannerOfferDisplayId(var16) else nil
	})
	useCatalogOffersBannerDismissHydrationModule(catalogOffersBannerStore, var29)
	useCatalogOffersBannerOffersFetchModule(catalogOffersBannerStore, var14)
	local var31 = if var16 ~= nil then nil else getMarketplaceOffersBannerOfferDisplayTitle(var16)
	reactModule.useEffect(function() --[[ line: 158 ]]
		-- upvalues: p0 (ref), var31 (ref), var30 (ref)
		local onBannerVisibleChanged = p0.onBannerVisibleChanged
		
		if onBannerVisibleChanged then
			onBannerVisibleChanged(var31 ~= nil and not var30)
		end
	end, { var30, var31, p0.onBannerVisibleChanged })
	
	if AXSendImpressionsForCatalogOffersBanner then
		reactModule.useEffect(function() --[[ line: 167 ]]
			-- upvalues: var30 (ref), var16 (ref), var31 (ref), sendUnifiedEventLog (copy), unifiedEventLogEnums (copy), unifiedLoggingSurface (copy), unifiedLoggingElementNameEnums (copy), httpService (copy)
			if not var30 and var16 and var31 then
				sendUnifiedEventLog({
					action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_IMPRESSION,
					surface = unifiedLoggingSurface.CATALOG,
					elementName = unifiedLoggingElementNameEnums.CATALOG_OFFERS_BANNER,
					elementMetadata = httpService:JSONEncode({ offerId = var16.offerId })
				})
			end
		end, { var30, var16, var31 })
	end
	if var30 or var29 == nil or (var16 == nil or var31 == nil) then
		return { status = "hidden" }
	end
	local var32 = var16.modal ~= nil
	
	return {
		status = "visible",
		viewProps = {
			rootTags = "col auto-y size-full-0 bg-shift-200",
			Size = p0.Size,
			Position = p0.Position,
			iconName = var16.icon,
			iconEmphasisStyle = var15.Color.System.Emphasis,
			titleContentEmphasisStyle = var15.Color.Content.Emphasis,
			titleText = var31,
			onCloseActivated = function() --[[ line: 198 ]]
				-- upvalues: catalogOffersBannerAppStorageModule (copy), getMarketplaceOffersBannerOfferDisplayId (copy), var16 (ref), var29 (ref), var17 (ref), catalogOffersBannerStore (ref)
				catalogOffersBannerAppStorageModule.writeDismissedForCurrentOffer(getMarketplaceOffersBannerOfferDisplayId(var16))
				local var34 = catalogOffersBannerAppStorageModule.resolveVisibleOffer(var29)
				var17(var34)
				
				if var34 == nil then
					catalogOffersBannerStore.setDismissed(true)
				end
			end,
			offerModalTapAreaEnabled = var32,
			onOfferBannerActivated = if var32 then var26 else nil
		},
		modals = if var18 then reactModule.createElement(catalogOffersBannerOfferModalsModule, {
			modal = var18,
			offersModalOpen = var20,
			termsModalOpen = var22,
			okButtonText = var24.okModalButton,
			onCloseOffersModal = var25,
			onOpenTermsModal = var27,
			onCloseTermsModal = var28
		}) else nil
	}
end