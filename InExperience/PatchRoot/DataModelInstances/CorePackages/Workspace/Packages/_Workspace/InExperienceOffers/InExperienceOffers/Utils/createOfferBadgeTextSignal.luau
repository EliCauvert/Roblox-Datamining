local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local parent = inExperienceOffers.Parent
local signalsModule = require(parent.Signals)
local fFlagHideOfferNotificationsWhenShopEmpty = require(parent.SharedFlags).FFlagHideOfferNotificationsWhenShopEmpty
local getOffersStoreModule = require(inExperienceOffers.Stores.GetOffersStore)
local getOfferBadgeTextModule = require(inExperienceOffers.Utils.getOfferBadgeText)

return function(value)
	-- upvalues: signalsModule (ref), fFlagHideOfferNotificationsWhenShopEmpty (ref), getOffersStoreModule (ref), getOfferBadgeTextModule (ref)
	return signalsModule.createComputed(function(p1)
		-- upvalues: fFlagHideOfferNotificationsWhenShopEmpty (copy), getOffersStoreModule (copy), getOfferBadgeTextModule (copy), value (ref)
		return if fFlagHideOfferNotificationsWhenShopEmpty and not getOffersStoreModule(false).getShopHasItems(p1) then nil else getOfferBadgeTextModule(getOffersStoreModule(false).getOffers(p1), value)
	end)
end