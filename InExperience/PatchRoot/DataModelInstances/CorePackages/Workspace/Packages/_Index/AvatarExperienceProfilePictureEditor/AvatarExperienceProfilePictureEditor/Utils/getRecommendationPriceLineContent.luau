local _ = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent.AvatarExperienceUIKit)

return function(p1) --[[ Line: 19 | Named "getRecommendationPriceLineContent" ]]
	local PriceStatus = p1.priceStatus
	
	if typeof(PriceStatus) == "string" and PriceStatus ~= "" then
		return { type = "text", text = PriceStatus }
	else
		local LowestPrice = p1.lowestPrice or p1.priceInRobux
		
		return if LowestPrice == nil or LowestPrice <= 0 then { type = "text", text = p1.freeLabel } else { type = "price", price = LowestPrice }
	end
end