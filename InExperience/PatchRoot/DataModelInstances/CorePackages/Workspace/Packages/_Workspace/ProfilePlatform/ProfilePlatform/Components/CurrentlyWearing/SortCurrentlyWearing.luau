local _ = require(script:FindFirstAncestor("ProfilePlatform").Common.AssetInfo)

return function(p1, p2): boolean --[[ Line: 5 | Named "sortCurrentlyWearingItems" ]]
	local config = {
		isOffSale = p1.isOffSale or false,
		price = p1.price or (p1.lowestResalePrice or 0),
		favoriteCount = p1.favoriteCount or 0
	}
	local config1 = {
		isOffSale = p2.isOffSale or false,
		price = p2.price or (p2.lowestResalePrice or 0),
		favoriteCount = p2.favoriteCount or 0
	}
	
	return if config.isOffSale == config1.isOffSale then if config.price == config1.price then (tonumber(p1.id) or 0) < (tonumber(p2.id) or 0) else config.price ~= 0 and (config1.price == 0 or config1.price < config.price) else not config.isOffSale
end