local normalize = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Utils.normalize
local normalizeBoolean = normalize.normalizeBoolean
local normalizeNumber = normalize.normalizeNumber
local normalizeNotEmptyString = normalize.normalizeNotEmptyString
local makeNormalizeTableFn = normalize.makeNormalizeTableFn
local makeNormalizeListFn = normalize.makeNormalizeListFn
local makeRequired = normalize.makeRequired
local _ = require(script.Parent.CartPricingForOffersTypes)
local var1 = makeNormalizeTableFn({
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
local var2 = makeNormalizeTableFn({
	localizedDescription = { fn = normalizeNotEmptyString },
	offerId = makeRequired(normalizeNotEmptyString),
	selected = { fn = normalizeBoolean }
})

return function(p1)
	-- upvalues: makeNormalizeListFn (ref), var1 (ref), var2 (ref), normalizeNotEmptyString (ref)
	if p1 == nil then
		return nil, nil
	elseif type(p1) ~= "table" then
		return nil, "CartPricingForOffers: unexpected response body type"
	end
	local t = { items = {} }
	local t_1 = {}
	
	if p1.items ~= nil then
		local var3, var4 = makeNormalizeListFn(var1)(p1.items)
		
		if var4 then
			table.insert(t_1, `items normalization failed with: {var4}`)
		end
		t.items = var3
	end
	if p1.availableOffers ~= nil then
		local var5, var6 = makeNormalizeListFn(var2)(p1.availableOffers)
		
		if var6 then
			table.insert(t_1, `availableOffers normalization failed with: {var6}`)
		end
		t.availableOffers = var5
	end
	t.savingsSummary = normalizeNotEmptyString(p1.savingsSummary)
	
	return t, if next(t_1) then table.concat(t_1, " ") else nil
end