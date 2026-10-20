return function(p1)
	if type(p1) ~= "table" or type(p1.discounts) ~= "table" or #p1.discounts == 0 then
		return nil
	end
	local List = {}
	
	for _, discount in ipairs(p1.discounts) do
		table.insert(List, {
			Type = discount.discountCampaign or "",
			AmountInRobux = discount.robuxDiscountAmount or 0,
			Percent = discount.robuxDiscountPercentage or 0,
			LocalizedDiscountAttribution = discount.localizedDiscountAttribution
		})
	end
	return List
end