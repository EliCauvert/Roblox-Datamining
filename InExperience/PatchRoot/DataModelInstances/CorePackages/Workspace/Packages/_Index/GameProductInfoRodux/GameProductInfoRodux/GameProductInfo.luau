local resultModule = require(script:FindFirstAncestor("GameProductInfoRodux").Parent.Result)
local t = {
	new = function() --[[ line: 18 ]]
		return {}
	end
}

function t.mock(p0) --[[ line: 23 ]]
	-- upvalues: t (ref)
	local var2 = t.new()
	var2.universeId = p0
	var2.isForSale = true
	var2.productId = 12345
	var2.price = 5
	var2.sellerId = 6789
	
	return var2
end

function t.fromJsonData(p1) --[[ line: 33 ]]
	-- upvalues: resultModule (ref), t (ref)
	if not (type(p1.universeId) == "number" and (type(p1.isForSale) == "boolean" and (type(p1.productId) == "number" and (type(p1.price) == "number" and type(p1.sellerId) == "number")))) and not (p1.fiatPurchaseData ~= nil and (type(p1.universeId) == "number" and type(p1.isForSale) == "boolean")) then
		return resultModule.error("invalid data type")
	end
	local var3 = t.new()
	var3.universeId = tostring(p1.universeId)
	var3.isForSale = p1.isForSale
	var3.productId = p1.productId
	var3.price = p1.price
	var3.sellerId = p1.sellerId
	
	if p1.fiatPurchaseData then
		var3.localizedFiatPrice = p1.fiatPurchaseData.localizedFiatPrice
		var3.fiatBasePriceId = p1.fiatPurchaseData.basePriceId
	end
	return resultModule.success(var3)
end

return t