local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local SignalsReactModule = require(InExperienceOffers.Parent.SignalsReact)
local GetOffersStoreModule = require(InExperienceOffers.Stores.GetOffersStore)

return function()
	-- upvalues: SignalsReactModule (copy), GetOffersStoreModule (copy)
	return SignalsReactModule.useSignalState(GetOffersStoreModule(false).getShopHasItems)
end