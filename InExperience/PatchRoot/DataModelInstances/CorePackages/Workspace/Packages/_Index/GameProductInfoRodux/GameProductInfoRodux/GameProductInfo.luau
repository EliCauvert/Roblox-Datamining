local resultModule = require(script:FindFirstAncestor("GameProductInfoRodux").Parent.Result)
local t = {
	new = function()
		return {}
	end
}

function t.mock(p1)
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.universeId = p1
	var1.isForSale = true
	var1.productId = 12345
	var1.price = 5
	var1.sellerId = 6789
	
	return var1
end

function t.fromJsonData(p1)
	-- upvalues: resultModule (ref), t (ref)
	if not (type(p1.universeId) == "number" and (type(p1.isForSale) == "boolean" and (type(p1.productId) == "number" and (type(p1.price) == "number" and type(p1.sellerId) == "number")))) and not (p1.fiatPurchaseData ~= nil and (type(p1.universeId) == "number" and type(p1.isForSale) == "boolean")) then
		return resultModule.error("invalid data type")
	end
	local var1 = t.new()
	var1.universeId = tostring(p1.universeId)
	var1.isForSale = p1.isForSale
	var1.productId = p1.productId
	var1.price = p1.price
	var1.sellerId = p1.sellerId
	
	if p1.fiatPurchaseData then
		var1.localizedFiatPrice = p1.fiatPurchaseData.localizedFiatPrice
		var1.fiatBasePriceId = p1.fiatPurchaseData.basePriceId
	end
	return resultModule.success(var1)
end

return t