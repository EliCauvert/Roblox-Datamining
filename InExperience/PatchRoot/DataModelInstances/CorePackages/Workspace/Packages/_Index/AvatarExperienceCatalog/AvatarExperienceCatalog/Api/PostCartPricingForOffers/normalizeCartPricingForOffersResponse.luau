local normalize = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Utils.normalize
local normalizeBoolean = normalize.normalizeBoolean
local normalizeNumber = normalize.normalizeNumber
local normalizeNotEmptyString = normalize.normalizeNotEmptyString
local makeNormalizeTableFn = normalize.makeNormalizeTableFn
local makeNormalizeListFn = normalize.makeNormalizeListFn
local makeRequired = normalize.makeRequired
local _ = require(script.Parent.CartPricingForOffersTypes)
local var0 = makeNormalizeTableFn({
	collectibleItemId = makeRequired(normalizeNotEmptyString),
	discountInformation = {
		fn = makeNormalizeTableFn({
			discounts = {
				fn = makeNormalizeListFn(makeNormalizeTableFn({
					discountCampaign = { fn = normalizeNotEmptyString },
					localizedDiscountAttribution = { fn = normalizeNotEmptyString },
					robuxDiscountAmount = { fn = normalizeNumber },
					robuxDiscountPercentage = { fn = normalizeNumber }
				}))
			},
			originalPrice = { fn = normalizeNumber },
			totalDiscountAmount = { fn = normalizeNumber },
			totalDiscountPercentage = { fn = normalizeNumber }
		})
	},
	priceInRobux = { fn = normalizeNumber },
	regularPriceInRobux = { fn = normalizeNumber }
})
local var1 = makeNormalizeTableFn({
	localizedDescription = { fn = normalizeNotEmptyString },
	offerId = makeRequired(normalizeNotEmptyString),
	selected = { fn = normalizeBoolean }
})

return function(p0) --[[ line: 47 | named "normalizeCartPricingForOffersResponse" ]]
	-- upvalues: makeNormalizeListFn (ref), var0 (ref), var1 (ref), normalizeNotEmptyString (ref)
	if p0 == nil then
		return nil, nil
	elseif type(p0) ~= "table" then
		return nil, "CartPricingForOffers: unexpected response body type"
	end
	local t = { items = {} }
	local t_1 = {}
	
	if p0.items ~= nil then
		local var4, var5 = makeNormalizeListFn(var0)(p0.items)
		
		if var5 then
			table.insert(t_1, `items normalization failed with: {var5}`)
		end
		t.items = var4
	end
	if p0.availableOffers ~= nil then
		local var6, var7 = makeNormalizeListFn(var1)(p0.availableOffers)
		
		if var7 then
			table.insert(t_1, `availableOffers normalization failed with: {var7}`)
		end
		t.availableOffers = var6
	end
	t.savingsSummary = normalizeNotEmptyString(p0.savingsSummary)
	
	return t, if next(t_1) then table.concat(t_1, " ") else nil
end