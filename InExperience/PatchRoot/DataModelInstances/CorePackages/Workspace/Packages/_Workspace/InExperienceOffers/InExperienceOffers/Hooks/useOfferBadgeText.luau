local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local SignalsReactModule = require(InExperienceOffers.Parent.SignalsReact)
local GetOffersStoreModule = require(InExperienceOffers.Stores.GetOffersStore)
local GetOfferBadgeTextModule = require(InExperienceOffers.Utils.getOfferBadgeText)

return function(p1) --[[ Line: 9 | Named "useOfferBadgeText" ]]
	-- upvalues: SignalsReactModule (copy), GetOffersStoreModule (copy), GetOfferBadgeTextModule (copy)
	return GetOfferBadgeTextModule(SignalsReactModule.useSignalState(GetOffersStoreModule(false).getOffers), p1)
end