local tModule = require(script:FindFirstAncestor("RoduxGames").Parent.t)
local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	assert(t.isValid(p1))
	t.__index = t
	setmetatable(p1, t)
	
	return p1
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

function t.format(p1)
	-- upvalues: t (ref)
	return t.new({
		productId = tostring(p1.productId),
		sellerId = tostring(p1.sellerId),
		isForSale = p1.isForSale or false,
		price = p1.price or 0
	})
end

t.isValid = tModule.strictInterface({
	productId = tModule.string,
	sellerId = tModule.string,
	price = tModule.number,
	isForSale = tModule.boolean
})

return t