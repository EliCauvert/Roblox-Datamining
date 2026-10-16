local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local SignalsReactModule = require(InExperienceOffers.Parent.SignalsReact)
local GetOffersStoreModule = require(InExperienceOffers.Stores.GetOffersStore)
local GetOffersForKeyModule = require(InExperienceOffers.Utils.getOffersForKey)
local _ = require(InExperienceOffers.Types)

return function(p1) --[[ Line: 17 | Named "useOffersForKey" ]]
	-- upvalues: GetOffersStoreModule (copy), SignalsReactModule (copy), GetOffersForKeyModule (copy)
	return GetOffersForKeyModule(SignalsReactModule.useSignalState(GetOffersStoreModule(false).getOffers), p1)
end