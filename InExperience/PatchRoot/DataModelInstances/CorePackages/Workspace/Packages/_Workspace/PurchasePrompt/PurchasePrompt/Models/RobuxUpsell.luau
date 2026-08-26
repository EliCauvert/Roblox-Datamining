local _ = script.Parent.Parent

return {
	new = function(p1, p2, p3, p4, p5)
		return {
			id = p1,
			providerId = p2,
			productName = p3,
			robuxAmount = p4,
			price = p5
		}
	end,
	fromJson = function(p1)
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