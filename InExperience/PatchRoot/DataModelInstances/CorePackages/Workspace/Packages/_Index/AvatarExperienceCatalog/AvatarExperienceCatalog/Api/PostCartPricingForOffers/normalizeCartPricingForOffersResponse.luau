local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local Normalize = require(Parent.AvatarExperienceCommon).Utils.normalize
local NormalizeBoolean = Normalize.normalizeBoolean
local NormalizeNumber = Normalize.normalizeNumber
local NormalizeNotEmptyStringFunction = Normalize.normalizeNotEmptyString
local MakeNormalizeTableFnFunction = Normalize.makeNormalizeTableFn
local MakeNormalizeListFnFunction = Normalize.makeNormalizeListFn
local MakeRequiredFunction = Normalize.makeRequired
local _ = require(script.Parent.CartPricingForOffersTypes)
local FFlagAXUpdateOffersEndsUIWithBadge = require(Parent.AvatarExperienceFlags).FFlagAXUpdateOffersEndsUIWithBadge
local NormalizeTableFn = MakeNormalizeTableFnFunction({
	collectibleItemId = MakeRequiredFunction(NormalizeNotEmptyStringFunction),
	discountInformation = {
		fn = MakeNormalizeTableFnFunction({
			discounts = {
				fn = MakeNormalizeListFnFunction((MakeNormalizeTableFnFunction({
					discountCampaign = { fn = NormalizeNotEmptyStringFunction },
					localizedDiscountAttribution = { fn = NormalizeNotEmptyStringFunction },
					robuxDiscountAmount = { fn = NormalizeNumber },
					robuxDiscountPercentage = { fn = NormalizeNumber }
				})))
			},
			originalPrice = { fn = NormalizeNumber },
			totalDiscountAmount = { fn = NormalizeNumber },
			totalDiscountPercentage = { fn = NormalizeNumber }
		})
	},
	priceInRobux = { fn = NormalizeNumber },
	regularPriceInRobux = { fn = NormalizeNumber }
})
local NormalizeTableFn1 = if FFlagAXUpdateOffersEndsUIWithBadge then MakeNormalizeTableFnFunction({
	expirationTimeUtc = { fn = NormalizeNotEmptyStringFunction },
	localizedDescription = { fn = NormalizeNotEmptyStringFunction },
	offerId = MakeRequiredFunction(NormalizeNotEmptyStringFunction),
	selected = { fn = NormalizeBoolean }
}) else MakeNormalizeTableFnFunction({
	localizedDescription = { fn = NormalizeNotEmptyStringFunction },
	offerId = MakeRequiredFunction(NormalizeNotEmptyStringFunction),
	selected = { fn = NormalizeBoolean }
})

return function(p1) --[[ Line: 57 | Named "normalizeCartPricingForOffersResponse" ]]
	-- upvalues: MakeNormalizeListFnFunction (copy), NormalizeTableFn (copy), NormalizeTableFn1 (copy), NormalizeNotEmptyStringFunction (copy)
	if p1 == nil then
		return nil, nil
	end
	if type(p1) ~= "table" then
		return nil, "CartPricingForOffers: unexpected response body type"
	end
	local config = { items = {} }
	local List = {}
	
	if p1.items ~= nil then
		local Items, v1 = MakeNormalizeListFnFunction(NormalizeTableFn)(p1.items)
		
		if v1 then
			table.insert(List, `items normalization failed with: {v1}`)
		end
		config.items = Items
	end
	if p1.availableOffers ~= nil then
		local AvailableOffers, v2 = MakeNormalizeListFnFunction(NormalizeTableFn1)(p1.availableOffers)
		
		if v2 then
			table.insert(List, `availableOffers normalization failed with: {v2}`)
		end
		config.availableOffers = AvailableOffers
	end
	config.savingsSummary = NormalizeNotEmptyStringFunction(p1.savingsSummary)
	
	return config, if next(List) then table.concat(List, " ") else nil
end