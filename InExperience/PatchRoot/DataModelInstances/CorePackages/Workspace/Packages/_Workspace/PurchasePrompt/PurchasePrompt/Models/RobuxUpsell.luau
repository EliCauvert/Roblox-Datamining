local _ = script.Parent.Parent

return {
	new = function(Id, ProviderId, ProductName, RobuxAmount, Price) --[[ Line: 23 ]]
		return {
			id = Id,
			providerId = ProviderId,
			productName = ProductName,
			robuxAmount = RobuxAmount,
			price = Price
		}
	end,
	fromJson = function(p1) --[[ Line: 39 ]]
		return {
			id = p1.roblox_product_id,
			providerId = p1.provider_product_id,
			productName = p1.roblox_product_name,
			robuxAmount = p1.robux_amount,
			robuxAmountBeforeBonus = p1.robux_amount_before_bonus,
			price = p1.price
		}
	end
}