local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local signalsReactModule = require(inExperienceOffers.Parent.SignalsReact)
local getOffersStoreModule = require(inExperienceOffers.Stores.GetOffersStore)
local getOfferBadgeTextModule = require(inExperienceOffers.Utils.getOfferBadgeText)

return function(p1)
	-- upvalues: signalsReactModule (ref), getOffersStoreModule (ref), getOfferBadgeTextModule (ref)
	return getOfferBadgeTextModule(signalsReactModule.useSignalState(getOffersStoreModule(false).getOffers), p1)
end