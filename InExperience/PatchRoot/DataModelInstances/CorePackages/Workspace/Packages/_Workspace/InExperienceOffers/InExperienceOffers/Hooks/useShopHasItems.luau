local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local SignalsReactModule = require(InExperienceOffers.Parent.SignalsReact)
local GetOffersStoreModule = require(InExperienceOffers.Stores.GetOffersStore)

return function() --[[ Line: 12 | Named "useShopHasItems" ]]
	-- upvalues: SignalsReactModule (copy), GetOffersStoreModule (copy)
	return SignalsReactModule.useSignalState(GetOffersStoreModule(false).getShopHasItems)
end