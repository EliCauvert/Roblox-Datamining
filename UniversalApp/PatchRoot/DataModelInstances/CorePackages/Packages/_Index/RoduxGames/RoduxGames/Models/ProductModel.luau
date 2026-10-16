local TModule = require(script:FindFirstAncestor("RoduxGames").Parent.t)
local ProductModelModule = {}

function ProductModelModule.new(p1) --[[ Line: 13 ]]
	-- upvalues: ProductModelModule (copy)
	assert(ProductModelModule.isValid(p1))
	ProductModelModule.__index = ProductModelModule
	setmetatable(p1, ProductModelModule)
	
	return p1
end

function ProductModelModule.mock(p1) --[[ Line: 25 ]]
	-- upvalues: ProductModelModule (copy)
	local P1 = p1 or {}
	
	return (ProductModelModule.new({
		productId = P1.productId or "productId",
		sellerId = P1.sellerId or "sellerId",
		price = P1.price or 666,
		isForSale = P1.isForSale or true
	}))
end

function ProductModelModule.format(p1) --[[ Line: 38 ]]
	-- upvalues: ProductModelModule (copy)
	return (ProductModelModule.new({
		productId = tostring(p1.productId),
		sellerId = tostring(p1.sellerId),
		isForSale = p1.isForSale or false,
		price = p1.price or 0
	}))
end

ProductModelModule.isValid = TModule.strictInterface({
	productId = TModule.string,
	sellerId = TModule.string,
	price = TModule.number,
	isForSale = TModule.boolean
})

return ProductModelModule