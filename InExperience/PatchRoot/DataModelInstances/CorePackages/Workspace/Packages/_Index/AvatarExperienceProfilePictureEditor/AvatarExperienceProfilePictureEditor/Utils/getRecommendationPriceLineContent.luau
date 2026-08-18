local _ = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent.AvatarExperienceUIKit)

return function(p0) --[[ line: 19 | named "getRecommendationPriceLineContent" ]]
	local priceStatus = p0.priceStatus
	
	if typeof(priceStatus) == "string" and priceStatus ~= "" then
		return { type = "text", text = priceStatus }
	end
	local lowestPrice = p0.lowestPrice or p0.priceInRobux
	
	return if lowestPrice == nil or lowestPrice <= 0 then { type = "text", text = p0.freeLabel } else { type = "price", price = lowestPrice }
end