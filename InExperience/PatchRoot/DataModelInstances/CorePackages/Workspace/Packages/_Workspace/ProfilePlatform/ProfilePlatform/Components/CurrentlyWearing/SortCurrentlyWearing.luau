local _ = require(script:FindFirstAncestor("ProfilePlatform").Common.AssetInfo)

return function(p0, p1)
	local t = {
		isOffSale = p0.isOffSale or false,
		price = p0.price or (p0.lowestResalePrice or 0),
		favoriteCount = p0.favoriteCount or 0
	}
	local t_1 = {
		isOffSale = p1.isOffSale or false,
		price = p1.price or (p1.lowestResalePrice or 0),
		favoriteCount = p1.favoriteCount or 0
	}
	
	return if t.isOffSale == t_1.isOffSale then if t.price == t_1.price then (tonumber(p0.id) or 0) < (tonumber(p1.id) or 0) elseif t.price == 0 then false else t_1.price == 0 or t_1.price < t.price else not t.isOffSale
end