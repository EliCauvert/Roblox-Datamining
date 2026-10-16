local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local Parent = InExperienceOffers.Parent
local SignalsModule = require(Parent.Signals)
local FFlagHideOfferNotificationsWhenShopEmpty = require(Parent.SharedFlags).FFlagHideOfferNotificationsWhenShopEmpty
local GetOffersStoreModule = require(InExperienceOffers.Stores.GetOffersStore)
local GetOfferBadgeTextModule = require(InExperienceOffers.Utils.getOfferBadgeText)

return function(p1) --[[ Line: 10 | Named "createOfferBadgeTextSignal" ]]
	-- upvalues: SignalsModule (copy), FFlagHideOfferNotificationsWhenShopEmpty (copy), GetOffersStoreModule (copy), GetOfferBadgeTextModule (copy)
	return SignalsModule.createComputed(function(p2) --[[ Line: 11 ]]
		-- upvalues: FFlagHideOfferNotificationsWhenShopEmpty (upval), GetOffersStoreModule (upval), GetOfferBadgeTextModule (upval), p1 (copy)
		return if FFlagHideOfferNotificationsWhenShopEmpty and not GetOffersStoreModule(false).getShopHasItems(p2) then nil else GetOfferBadgeTextModule(GetOffersStoreModule(false).getOffers(p2), p1)
	end)
end