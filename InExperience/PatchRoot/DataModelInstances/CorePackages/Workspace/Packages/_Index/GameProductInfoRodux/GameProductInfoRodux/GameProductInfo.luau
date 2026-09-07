local resultModule = require(script:FindFirstAncestor("GameProductInfoRodux").Parent.Result)
local fixFiatPaidAccessPlayButton = game:DefineFastFlag("FixFiatPaidAccessPlayButton", false)
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
	-- upvalues: fixFiatPaidAccessPlayButton (ref), resultModule (ref), t (ref)
	local var1
	local var2 = type(p1.universeId) == "number" and (type(p1.isForSale) == "boolean" and (type(p1.productId) == "number" and (type(p1.price) == "number" and type(p1.sellerId) == "number")))
	
	if fixFiatPaidAccessPlayButton then
		var1 = false
		
		if p1.fiatPurchaseData ~= nil then
			var1 = false
			
			if type(p1.universeId) == "number" then
				local _ = type(p1.isForSale) == "boolean"
			end
		end
	else
		var1 = nil
	end
	if not var2 and not var1 then
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