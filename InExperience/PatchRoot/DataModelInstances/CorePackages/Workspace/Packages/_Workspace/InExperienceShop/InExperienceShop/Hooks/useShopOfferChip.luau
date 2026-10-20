local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableUserOffers = SharedFlagsModule.FFlagEnableUserOffers
local FFlagHideOfferNotificationsWhenShopEmpty = SharedFlagsModule.FFlagHideOfferNotificationsWhenShopEmpty
local InExperienceOffersModule = require(Parent.InExperienceOffers)
local UseOffersForKeyFunction = InExperienceOffersModule.Hooks.useOffersForKey
local SelectActiveOfferFunction = InExperienceOffersModule.Utils.selectActiveOffer
local UseRemainingTimeTextFunction = InExperienceOffersModule.Hooks.useRemainingTimeText
local UseShopHasItemsFunction = InExperienceOffersModule.Hooks.useShopHasItems
local OfferDialogStateModule = require(InExperienceShop.Components.OfferDialogs.OfferDialogState)
local UseCloseOnCoreMenuModule = require(InExperienceShop.Hooks.useCloseOnCoreMenu)
local UseOfferModalTextModule = require(InExperienceShop.Hooks.useOfferModalText)
local FFlagShopCloseOfferDialogOnCoreMenuModule = require(InExperienceShop.Flags.FFlagShopCloseOfferDialogOnCoreMenu)
local FFlagShowLargerOfferBannerOnDesktop2Module = require(InExperienceShop.Flags.FFlagShowLargerOfferBannerOnDesktop2)

return function(p1, p2)
	-- upvalues: UseOffersForKeyFunction (copy), ReactModule (copy), SelectActiveOfferFunction (copy), UseRemainingTimeTextFunction (copy), FFlagHideOfferNotificationsWhenShopEmpty (copy), UseShopHasItemsFunction (copy), FFlagEnableUserOffers (copy), UseLocalizationFunction (copy), FFlagShowLargerOfferBannerOnDesktop2Module (copy), UseOfferModalTextModule (copy), OfferDialogStateModule (copy), FFlagShopCloseOfferDialogOnCoreMenuModule (copy), UseCloseOnCoreMenuModule (copy)
	local UseOffersForKeyResult = UseOffersForKeyFunction(p1)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SelectActiveOfferFunction (upval), UseOffersForKeyResult (copy)
		return SelectActiveOfferFunction(UseOffersForKeyResult, "banner")
	end, { UseOffersForKeyResult })
	local Banner = if UseMemoResult == nil then nil else UseMemoResult.presentationData.banner
	local UseRemainingTimeTextResult = UseRemainingTimeTextFunction(UseMemoResult and UseMemoResult.expirationTimeInUTC or nil)
	local Inverted: boolean = FFlagHideOfferNotificationsWhenShopEmpty and not UseShopHasItemsFunction()
	local HasUseRemainingTimeTextResult = if FFlagEnableUserOffers then not Inverted and (UseMemoResult ~= nil and UseRemainingTimeTextResult ~= nil) else not Inverted and FFlagEnableUserOffers
	local UseLocalizationResult = UseLocalizationFunction({
		offerEndTime = {
			"Feature.InExperienceShop.Label.OfferEndTime",
			offer = if Banner == nil then "" else Banner.title,
			timeRemaining = UseRemainingTimeTextResult or ""
		}
	})
	local Title = nil
	local Icon = nil
	
	if HasUseRemainingTimeTextResult and Banner ~= nil then
		Title = if p2 then Banner.title else UseLocalizationResult.offerEndTime
		Icon = Banner.icon
	end
	local Modal = if Banner == nil then nil else Banner.modal
	local ExpirationTimeInUTC = if UseMemoResult == nil then nil else UseMemoResult.expirationTimeInUTC
	local UseOfferModalTextModuleResult = if FFlagShowLargerOfferBannerOnDesktop2Module then UseOfferModalTextModule(if Modal then Modal.body else "", if Modal then UseRemainingTimeTextResult else nil) else {
		viewTermsText = "",
		bodyText = if Modal then Modal.body else ""
	}
	local UseStateResult, UseStateResult2 = ReactModule.useState(OfferDialogStateModule.None)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), OfferDialogStateModule (upval)
		UseStateResult2(OfferDialogStateModule.Details)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), OfferDialogStateModule (upval)
		UseStateResult2(OfferDialogStateModule.Terms)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), OfferDialogStateModule (upval)
		UseStateResult2(OfferDialogStateModule.None)
	end, {})
	
	if FFlagShopCloseOfferDialogOnCoreMenuModule then
		UseCloseOnCoreMenuModule(UseResult2)
	end
	return {
		showOfferChip = HasUseRemainingTimeTextResult,
		offerChipText = Title,
		offerChipIcon = Icon,
		offerModal = Modal,
		offerExpirationTimeInUTC = ExpirationTimeInUTC,
		offerBodyText = UseOfferModalTextModuleResult.bodyText,
		offerViewTermsText = UseOfferModalTextModuleResult.viewTermsText,
		offerDialog = UseStateResult,
		onOfferChipActivated = UseResult,
		onOfferViewTerms = UseResult1,
		onOfferShopNow = UseResult2,
		onOfferDetailsClose = UseResult2,
		onOfferTermsClose = UseResult2
	}
end