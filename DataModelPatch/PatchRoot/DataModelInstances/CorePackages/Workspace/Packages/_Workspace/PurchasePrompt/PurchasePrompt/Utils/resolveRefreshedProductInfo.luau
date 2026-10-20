local MapCatalogDiscountInfoToPriceDiscountDetailsModule = require(script:FindFirstAncestor("PurchasePrompt").Utils.mapCatalogDiscountInfoToPriceDiscountDetails)

return function(p1, p2, CollectibleItemInstanceId, Days)
	-- upvalues: MapCatalogDiscountInfoToPriceDiscountDetailsModule (copy)
	if CollectibleItemInstanceId and CollectibleItemInstanceId ~= "" then
		local LowestResalePrice = nil
		
		if p2 ~= nil and p2.data ~= nil then
			for _, entry in ipairs(p2.data) do
				if entry.collectibleItemInstanceId == CollectibleItemInstanceId then
					LowestResalePrice = entry.price
					break
				end
			end
		end
		if LowestResalePrice == nil and p1 ~= nil then
			LowestResalePrice = p1.lowestResalePrice
		end
		if LowestResalePrice then
			return {
				UserBasePriceInRobux = nil,
				PriceDiscountDetails = nil,
				refreshedExpectedPrice = LowestResalePrice,
				PriceInRobux = LowestResalePrice
			}
		end
	elseif Days and Days ~= 0 then
		if p1 ~= nil and p1.timedOptions then
			for _, timedOption in ipairs(p1.timedOptions) do
				if timedOption.days == Days then
					return {
						refreshedExpectedPrice = timedOption.price,
						PriceInRobux = timedOption.price,
						UserBasePriceInRobux = if timedOption.discountInformation and timedOption.discountInformation.originalPrice then timedOption.discountInformation.originalPrice else timedOption.price,
						PriceDiscountDetails = MapCatalogDiscountInfoToPriceDiscountDetailsModule(timedOption.discountInformation)
					}
				end
			end
		end
	elseif p1 ~= nil then
		return { refreshedExpectedPrice = p1.price }
	end
	return nil
end