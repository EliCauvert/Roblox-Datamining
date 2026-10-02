local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local signalsReactModule = require(inExperienceOffers.Parent.SignalsReact)
local getOffersStoreModule = require(inExperienceOffers.Stores.GetOffersStore)

return function()
	-- upvalues: signalsReactModule (ref), getOffersStoreModule (ref)
	return signalsReactModule.useSignalState(getOffersStoreModule(false).getShopHasItems)
end