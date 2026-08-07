local resultModule = require(script:FindFirstAncestor("GameProductInfoRodux").Parent.Result)
local fixFiatPaidAccessPlayButton = game:DefineFastFlag("FixFiatPaidAccessPlayButton", false)
local t = {
	new = function() --[[ line: 20 ]]
		return {}
	end
}

function t.mock(p0) --[[ line: 25 ]]
	-- upvalues: t (ref)
	local var3 = t.new()
	var3.universeId = p0
	var3.isForSale = true
	var3.productId = 12345
	var3.price = 5
	var3.sellerId = 6789
	
	return var3
end

function t.fromJsonData(p1) --[[ line: 35 ]]
	-- upvalues: fixFiatPaidAccessPlayButton (ref), resultModule (ref), t (ref)
	local var5
	local var4 = type(p1.universeId) == "number" and (type(p1.isForSale) == "boolean" and (type(p1.productId) == "number" and (type(p1.price) == "number" and type(p1.sellerId) == "number")))
	
	if fixFiatPaidAccessPlayButton then
		var5 = false
		
		if p1.fiatPurchaseData ~= nil then
			var5 = false
			
			if type(p1.universeId) == "number" then
				local _ = type(p1.isForSale) == "boolean"
			end
		end
	else
		var5 = nil
	end
	if not var4 and not var5 then
		return resultModule.error("invalid data type")
	end
	local var6 = t.new()
	var6.universeId = tostring(p1.universeId)
	var6.isForSale = p1.isForSale
	var6.productId = p1.productId
	var6.price = p1.price
	var6.sellerId = p1.sellerId
	
	if p1.fiatPurchaseData then
		var6.localizedFiatPrice = p1.fiatPurchaseData.localizedFiatPrice
		var6.fiatBasePriceId = p1.fiatPurchaseData.basePriceId
	end
	return resultModule.success(var6)
end

return t