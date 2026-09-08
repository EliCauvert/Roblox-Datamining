local _ = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent.AvatarExperienceUIKit)

return function(p1)
	local priceStatus = p1.priceStatus
	
	if typeof(priceStatus) == "string" and priceStatus ~= "" then
		return { type = "text", text = priceStatus }
	end
	local lowestPrice = p1.lowestPrice or p1.priceInRobux
	
	return if lowestPrice == nil or lowestPrice <= 0 then { type = "text", text = p1.freeLabel } else { type = "price", price = lowestPrice }
end