local mapCatalogDiscountInfoToPriceDiscountDetailsModule = require(script:FindFirstAncestor("PurchasePrompt").Utils.mapCatalogDiscountInfoToPriceDiscountDetails)

return function(p1, p2, p3, p4)
	-- upvalues: mapCatalogDiscountInfoToPriceDiscountDetailsModule (ref)
	if p3 and p3 ~= "" then
		local lowestResalePrice = nil
		
		if p2 ~= nil and p2.data ~= nil then
			for i, v in ipairs(p2.data) do
				if v.collectibleItemInstanceId == p3 then
					lowestResalePrice = v.price
					break
				end
			end
		end
		if lowestResalePrice == nil and p1 ~= nil then
			lowestResalePrice = p1.lowestResalePrice
		end
		if lowestResalePrice then
			return {
				UserBasePriceInRobux = nil,
				PriceDiscountDetails = nil,
				refreshedExpectedPrice = lowestResalePrice,
				PriceInRobux = lowestResalePrice
			}
		end
	elseif not p4 or p4 == 0 then
		return if p1 == nil then nil else { refreshedExpectedPrice = p1.price }
	elseif p1 ~= nil and p1.timedOptions then
		for i, v in ipairs(p1.timedOptions) do
			if v.days == p4 then
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