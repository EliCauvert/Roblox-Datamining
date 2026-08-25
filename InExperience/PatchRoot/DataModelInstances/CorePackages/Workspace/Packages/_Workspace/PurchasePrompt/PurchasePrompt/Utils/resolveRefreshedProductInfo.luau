local mapCatalogDiscountInfoToPriceDiscountDetailsModule = require(script:FindFirstAncestor("PurchasePrompt").Utils.mapCatalogDiscountInfoToPriceDiscountDetails)

return function(p0, p1, p2, p3)
	-- upvalues: mapCatalogDiscountInfoToPriceDiscountDetailsModule (ref)
	if p2 and p2 ~= "" then
		local lowestResalePrice = nil
		
		if p1 ~= nil and p1.data ~= nil then
			for i, v in ipairs(p1.data) do
				if v.collectibleItemInstanceId == p2 then
					lowestResalePrice = v.price
					break
				end
			end
		end
		if lowestResalePrice == nil and p0 ~= nil then
			lowestResalePrice = p0.lowestResalePrice
		end
		if lowestResalePrice then
			return {
				UserBasePriceInRobux = nil,
				PriceDiscountDetails = nil,
				refreshedExpectedPrice = lowestResalePrice,
				PriceInRobux = lowestResalePrice
			}
		end
	elseif not p3 or p3 == 0 then
		return if p0 == nil then nil else { refreshedExpectedPrice = p0.price }
	elseif p0 ~= nil and p0.timedOptions then
		for i, v in ipairs(p0.timedOptions) do
			if v.days == p3 then
				return {
					refreshedExpectedPrice = v.price,
					PriceInRobux = v.price,
					UserBasePriceInRobux = if v.discountInformation and v.discountInformation.originalPrice then v.discountInformation.originalPrice else v.price,
					PriceDiscountDetails = mapCatalogDiscountInfoToPriceDiscountDetailsModule(v.discountInformation)
				}
			end
		end
	end
end