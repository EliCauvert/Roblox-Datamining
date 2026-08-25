local tModule = require(script:FindFirstAncestor("RoduxGames").Parent.t)
local t = {}

function t.new(p0)
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
end

function t.mock(p1)
	-- upvalues: t (ref)
	p1 = p1 or {}
	
	return t.new({
		productId = p1.productId or "productId",
		sellerId = p1.sellerId or "sellerId",
		price = p1.price or 666,
		isForSale = p1.isForSale or true
	})
end

function t.format(p2)
	-- upvalues: t (ref)
	return t.new({
		productId = tostring(p2.productId),
		sellerId = tostring(p2.sellerId),
		isForSale = p2.isForSale or false,
		price = p2.price or 0
	})
end

t.isValid = tModule.strictInterface({
	productId = tModule.string,
	sellerId = tModule.string,
	price = tModule.number,
	isForSale = tModule.boolean
})

return t