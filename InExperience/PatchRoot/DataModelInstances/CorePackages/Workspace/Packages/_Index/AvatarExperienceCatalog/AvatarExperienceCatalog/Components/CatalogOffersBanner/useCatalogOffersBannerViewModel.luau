local HttpService = game:GetService("HttpService")
local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local UseNetworkingFunction = require(Parent.AvatarExperienceCommon).Hooks.useNetworking
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local SendUnifiedEventLogFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLog
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UnifiedLoggingElementNameEnums = AvatarExperienceAnalyticsModule.Enums.UnifiedLoggingElementNameEnums
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local _ = require(AvatarExperienceCatalog.Api.GetMarketplaceOffersBanner.MarketplaceOffersBannerTypes)
local MarketplaceOffersBannerDisplayModule = require(AvatarExperienceCatalog.Api.GetMarketplaceOffersBanner.marketplaceOffersBannerDisplay)
local UseAXCatalogStoreContextModule = require(AvatarExperienceCatalog.Context.useAXCatalogStoreContext)
local _ = require(AvatarExperienceCatalog.Stores.createCatalogOffersBannerStore)
local CatalogOffersBannerImpressionsStoreModule = require(AvatarExperienceCatalog.Stores.catalogOffersBannerImpressionsStore)
local UseCatalogOffersBannerDismissHydrationModule = require(AvatarExperienceCatalog.Hooks.useCatalogOffersBannerDismissHydration)
local UseCatalogOffersBannerOffersFetchModule = require(AvatarExperienceCatalog.Hooks.useCatalogOffersBannerOffersFetch)
local CatalogOffersBannerAppStorageModule = require(AvatarExperienceCatalog.Utils.catalogOffersBannerAppStorage)
local _ = require(script.Parent.CatalogOffersBannerView)
local CatalogOffersBannerOfferModalsModule = require(script.Parent.CatalogOffersBannerOfferModals)
local GetMarketplaceOffersBannerOfferDisplayIdFunction = MarketplaceOffersBannerDisplayModule.getMarketplaceOffersBannerOfferDisplayId
local GetMarketplaceOffersBannerOfferDisplayTitleFunction = MarketplaceOffersBannerDisplayModule.getMarketplaceOffersBannerOfferDisplayTitle
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXCatalogOffersAutoOpenFTUXSheet = AvatarExperienceFlagsModule.FFlagAXCatalogOffersAutoOpenFTUXSheet
local FFlagAXUpdateOffersEndsUIWithBadge = AvatarExperienceFlagsModule.FFlagAXUpdateOffersEndsUIWithBadge

local function blendShiftFillForOpaqueGuiObject(Shift, SurfaceColor): Color3
	local v1 = 1 - math.clamp(Shift.Transparency, 0, 1)
	
	return Color3.new(Shift.Color3.R * v1 + SurfaceColor.R * (1 - v1), Shift.Color3.G * v1 + SurfaceColor.G * (1 - v1), Shift.Color3.B * v1 + SurfaceColor.B * (1 - v1))
end

return function(p1)
	-- upvalues: UseAXCatalogStoreContextModule (copy), UseNetworkingFunction (copy), UseTokensFunction (copy), ReactModule (copy), UseLocalizationFunction (copy), CatalogOffersBannerAppStorageModule (copy), GetMarketplaceOffersBannerOfferDisplayIdFunction (copy), UseSignalStateFunction (copy), FFlagAXCatalogOffersAutoOpenFTUXSheet (copy), UseCatalogOffersBannerDismissHydrationModule (copy), UseCatalogOffersBannerOffersFetchModule (copy), GetMarketplaceOffersBannerOfferDisplayTitleFunction (copy), CatalogOffersBannerImpressionsStoreModule (copy), SendUnifiedEventLogFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingSurface (copy), UnifiedLoggingElementNameEnums (copy), HttpService (copy), CatalogOffersBannerOfferModalsModule (copy), FFlagAXUpdateOffersEndsUIWithBadge (copy), blendShiftFillForOpaqueGuiObject (copy)
	local CatalogOffersBannerStore = UseAXCatalogStoreContextModule().catalogOffersBannerStore
	local UseNetworkingResult = UseNetworkingFunction()
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseLocalizationResult = UseLocalizationFunction({ okModalButton = "CommonUI.Controls.Action.OK" })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_3 (copy), UseStateResult2_2 (copy), UseStateResult2_1 (copy)
		UseStateResult2_3(false)
		UseStateResult2_2(false)
		UseStateResult2_1(nil)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), CatalogOffersBannerAppStorageModule (upval), GetMarketplaceOffersBannerOfferDisplayIdFunction (upval), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		if UseStateResult and UseStateResult.modal then
			CatalogOffersBannerAppStorageModule.writeSeenOfferSheetForCurrentOffer(GetMarketplaceOffersBannerOfferDisplayIdFunction(UseStateResult))
			UseStateResult2_1(UseStateResult.modal)
			UseStateResult2_2(true)
		end
	end, { UseStateResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(true)
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(false)
	end, {})
	local UseSignalStateResult = UseSignalStateFunction(CatalogOffersBannerStore.getPayload)
	local UseSignalStateResult1 = UseSignalStateFunction(CatalogOffersBannerStore.getDismissed)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseSignalStateResult (copy), CatalogOffersBannerAppStorageModule (upval), UseStateResult2 (copy)
		UseStateResult2(if UseSignalStateResult == nil then nil else CatalogOffersBannerAppStorageModule.resolveVisibleOffer(UseSignalStateResult))
	end, { UseSignalStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseStateResult1 (copy), GetMarketplaceOffersBannerOfferDisplayIdFunction (upval), FFlagAXCatalogOffersAutoOpenFTUXSheet (upval), CatalogOffersBannerAppStorageModule (upval), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		if UseStateResult == nil or UseStateResult.modal == nil then return end
		if UseStateResult1 ~= nil then return end
		local MarketplaceOffersBannerOfferDisplayId = GetMarketplaceOffersBannerOfferDisplayIdFunction(UseStateResult)
		
		if FFlagAXCatalogOffersAutoOpenFTUXSheet and CatalogOffersBannerAppStorageModule.shouldAutoOpenOfferSheetForCurrentOffer(MarketplaceOffersBannerOfferDisplayId) then
			CatalogOffersBannerAppStorageModule.writeSeenOfferSheetForCurrentOffer(MarketplaceOffersBannerOfferDisplayId)
			UseStateResult2_1(UseStateResult.modal)
			UseStateResult2_2(true)
		end
	end, {
		UseStateResult1,
		UseStateResult,
		if UseStateResult then GetMarketplaceOffersBannerOfferDisplayIdFunction(UseStateResult) else nil
	})
	UseCatalogOffersBannerDismissHydrationModule(CatalogOffersBannerStore, UseSignalStateResult)
	UseCatalogOffersBannerOffersFetchModule(CatalogOffersBannerStore, UseNetworkingResult)
	local MarketplaceOffersBannerOfferDisplayTitle = if UseStateResult == nil then nil else GetMarketplaceOffersBannerOfferDisplayTitleFunction(UseStateResult)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), MarketplaceOffersBannerOfferDisplayTitle (copy), UseSignalStateResult1 (copy)
		local OnBannerVisibleChangedFunction: (any) -> () = p1.onBannerVisibleChanged
		
		if OnBannerVisibleChangedFunction then
			OnBannerVisibleChangedFunction(MarketplaceOffersBannerOfferDisplayTitle ~= nil and not UseSignalStateResult1)
		end
	end, {
		UseSignalStateResult1,
		MarketplaceOffersBannerOfferDisplayTitle,
		p1.onBannerVisibleChanged
	})
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult1 (copy), UseStateResult (copy), MarketplaceOffersBannerOfferDisplayTitle (copy), CatalogOffersBannerImpressionsStoreModule (upval), SendUnifiedEventLogFunction (upval), UnifiedEventLogEnums (upval), UnifiedLoggingSurface (upval), UnifiedLoggingElementNameEnums (upval), HttpService (upval)
		if not UseSignalStateResult1 and UseStateResult and MarketplaceOffersBannerOfferDisplayTitle and UseStateResult.offerId and not CatalogOffersBannerImpressionsStoreModule.hasSeenOfferId(UseStateResult.offerId) then
			CatalogOffersBannerImpressionsStoreModule.addOfferId(UseStateResult.offerId)
			SendUnifiedEventLogFunction({
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_IMPRESSION,
				surface = UnifiedLoggingSurface.CATALOG,
				elementName = UnifiedLoggingElementNameEnums.CATALOG_OFFERS_BANNER,
				elementMetadata = HttpService:JSONEncode({ offerId = UseStateResult.offerId })
			})
		end
	end, {
		UseSignalStateResult1,
		UseStateResult,
		MarketplaceOffersBannerOfferDisplayTitle
	})
	
	if UseSignalStateResult1 or UseSignalStateResult == nil or UseStateResult == nil or MarketplaceOffersBannerOfferDisplayTitle == nil then
		return { status = "hidden" }
	else
		local HasModal = UseStateResult.modal ~= nil
		local Config = if FFlagAXUpdateOffersEndsUIWithBadge then {
			Transparency = 0,
			Color3 = blendShiftFillForOpaqueGuiObject(UseTokensResult.Color.Shift.Shift_200, UseTokensResult.Color.Surface.Surface_0.Color3)
		} else nil
		
		return {
			status = "visible",
			viewProps = {
				rootTags = if FFlagAXUpdateOffersEndsUIWithBadge then "col auto-y size-full-0" else "col auto-y size-full-0 bg-shift-200",
				backgroundStyle = if FFlagAXUpdateOffersEndsUIWithBadge then Config else nil,
				Size = p1.Size,
				Position = p1.Position,
				iconName = UseStateResult.icon,
				expirationTimeInUTC = if FFlagAXUpdateOffersEndsUIWithBadge then UseStateResult.expirationTimeInUTC else nil,
				iconEmphasisStyle = UseTokensResult.Color.System.Emphasis,
				titleContentEmphasisStyle = UseTokensResult.Color.Content.Emphasis,
				titleText = MarketplaceOffersBannerOfferDisplayTitle,
				onCloseActivated = function()
					-- upvalues: CatalogOffersBannerAppStorageModule (upval), GetMarketplaceOffersBannerOfferDisplayIdFunction (upval), UseStateResult (copy), UseSignalStateResult (copy), UseStateResult2 (copy), CatalogOffersBannerStore (copy)
					CatalogOffersBannerAppStorageModule.writeDismissedForCurrentOffer(GetMarketplaceOffersBannerOfferDisplayIdFunction(UseStateResult))
					local ResolveVisibleOfferResult = CatalogOffersBannerAppStorageModule.resolveVisibleOffer(UseSignalStateResult)
					UseStateResult2(ResolveVisibleOfferResult)
					
					if ResolveVisibleOfferResult == nil then
						CatalogOffersBannerStore.setDismissed(true)
					end
				end,
				offerModalTapAreaEnabled = HasModal,
				onOfferBannerActivated = if HasModal then UseResult1 else nil
			},
			modals = if UseStateResult1 then ReactModule.createElement(CatalogOffersBannerOfferModalsModule, {
				modal = UseStateResult1,
				offersModalOpen = UseStateResult3,
				termsModalOpen = UseStateResult4,
				okButtonText = UseLocalizationResult.okModalButton,
				onCloseOffersModal = UseResult,
				onOpenTermsModal = UseResult2,
				onCloseTermsModal = UseResult3
			}) else nil
		}
	end
end