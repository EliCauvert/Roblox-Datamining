local _ = script.Parent.Parent

return {
	new = function(p0, p1, p2, p3, p4) --[[ line: 23 ]]
		return {
			id = p0,
			providerId = p1,
			productName = p2,
			robuxAmount = p3,
			price = p4
		}
	end,
	fromJson = function(p5) --[[ line: 39 ]]
		return {
			id = p5.roblox_product_id,
			providerId = p5.provider_product_id,
			productName = p5.roblox_product_name,
			robuxAmount = p5.robux_amount,
			robuxAmountBeforeBonus = p5.robux_amount_before_bonus,
			price = p5.price
		}
	end
}