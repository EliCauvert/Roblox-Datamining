local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagEnableUserOffers = require(parent.SharedFlags).FFlagEnableUserOffers
local inExperienceOffersModule = require(parent.InExperienceOffers)
local useOffersForKey = inExperienceOffersModule.Hooks.useOffersForKey
local selectActiveOffer = inExperienceOffersModule.Utils.selectActiveOffer
local useRemainingTimeText = inExperienceOffersModule.Hooks.useRemainingTimeText
local offerDialogStateModule = require(inExperienceShop.Components.OfferDialogs.OfferDialogState)
local useCloseOnCoreMenuModule = require(inExperienceShop.Hooks.useCloseOnCoreMenu)
local useOfferModalTextModule = require(inExperienceShop.Hooks.useOfferModalText)
local fFlagShopCloseOfferDialogOnCoreMenuModule = require(inExperienceShop.Flags.FFlagShopCloseOfferDialogOnCoreMenu)
local fFlagShowLargerOfferBannerOnDesktopModule = require(inExperienceShop.Flags.FFlagShowLargerOfferBannerOnDesktop)

return function(p1, p2)
	-- upvalues: useOffersForKey (ref), reactModule (ref), selectActiveOffer (ref), useRemainingTimeText (ref), fFlagEnableUserOffers (ref), useLocalization (ref), fFlagShowLargerOfferBannerOnDesktopModule (ref), useOfferModalTextModule (ref), offerDialogStateModule (ref), fFlagShopCloseOfferDialogOnCoreMenuModule (ref), useCloseOnCoreMenuModule (ref)
	local var1 = useOffersForKey(p1)
	local var2 = reactModule.useMemo(function()
		-- upvalues: selectActiveOffer (copy), var1 (ref)
		return selectActiveOffer(var1, "banner")
	end, { var1 })
	local var3 = if var2 ~= nil then nil else var2.presentationData.banner
	local var4 = useRemainingTimeText(if var2 then var2.expirationTimeInUTC else nil)
	local var5 = fFlagEnableUserOffers and (var2 ~= nil and var4 ~= nil)
	local var6 = useLocalization({
		offerEndTime = {
			"Feature.InExperienceShop.Label.OfferEndTime",
			offer = if var3 ~= nil then "" else var3.title,
			timeRemaining = var4 or ""
		}
	})
	local var7 = nil
	local icon = nil
	
	if var5 and var3 ~= nil then
		var7 = if p2 then var3.title else var6.offerEndTime
		icon = var3.icon
	end
	local var8 = if var3 ~= nil then nil else var3.modal
	local var9 = if var2 ~= nil then nil else var2.expirationTimeInUTC
	local var10 = if fFlagShowLargerOfferBannerOnDesktopModule then useOfferModalTextModule(if var8 then var8.body else "", if var8 then var4 else nil) else {
		viewTermsText = "",
		bodyText = if var8 then var8.body else ""
	}
	local var11, var12 = reactModule.useState(offerDialogStateModule.None)
	local var13 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), offerDialogStateModule (copy)
		var12(offerDialogStateModule.Details)
	end, {})
	local var14 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), offerDialogStateModule (copy)
		var12(offerDialogStateModule.Terms)
	end, {})
	local var15 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), offerDialogStateModule (copy)
		var12(offerDialogStateModule.None)
	end, {})
	
	if fFlagShopCloseOfferDialogOnCoreMenuModule then
		useCloseOnCoreMenuModule(var15)
	end
	return {
		showOfferChip = var5,
		offerChipText = var7,
		offerChipIcon = icon,
		offerModal = var8,
		offerExpirationTimeInUTC = var9,
		offerBodyText = var10.bodyText,
		offerViewTermsText = var10.viewTermsText,
		offerDialog = var11,
		onOfferChipActivated = var13,
		onOfferViewTerms = var14,
		onOfferShopNow = var15,
		onOfferDetailsClose = var15,
		onOfferTermsClose = var15
	}
end