local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local signalsModule = require(inExperienceOffers.Parent.Signals)
local getOffersStoreModule = require(inExperienceOffers.Stores.GetOffersStore)
local getOfferBadgeTextModule = require(inExperienceOffers.Utils.getOfferBadgeText)

return function(value)
	-- upvalues: signalsModule (ref), getOffersStoreModule (ref), getOfferBadgeTextModule (ref)
	return signalsModule.createComputed(function(p1)
		-- upvalues: getOffersStoreModule (copy), getOfferBadgeTextModule (copy), value (ref)
		return getOfferBadgeTextModule(getOffersStoreModule(false).getOffers(p1), value)
	end)
end