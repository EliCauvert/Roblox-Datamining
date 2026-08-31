local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local signalsReactModule = require(inExperienceOffers.Parent.SignalsReact)
local getOffersStoreModule = require(inExperienceOffers.Stores.GetOffersStore)
local getOffersForKeyModule = require(inExperienceOffers.Utils.getOffersForKey)
local _ = require(inExperienceOffers.Types)

return function(p1)
	-- upvalues: getOffersStoreModule (ref), signalsReactModule (ref), getOffersForKeyModule (ref)
	return getOffersForKeyModule(signalsReactModule.useSignalState(getOffersStoreModule(false).getOffers), p1)
end