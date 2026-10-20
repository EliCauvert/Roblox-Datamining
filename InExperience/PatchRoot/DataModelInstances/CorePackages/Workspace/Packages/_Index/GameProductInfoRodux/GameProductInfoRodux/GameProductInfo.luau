local ResultModule = require(script:FindFirstAncestor("GameProductInfoRodux").Parent.Result)
local GameProductInfoModule = {
	new = function()
		return {}
	end
}

function GameProductInfoModule.mock(UniverseId)
	-- upvalues: GameProductInfoModule (copy)
	local NewGameProductInfo = GameProductInfoModule.new()
	NewGameProductInfo.universeId = UniverseId
	NewGameProductInfo.isForSale = true
	NewGameProductInfo.productId = 12345
	NewGameProductInfo.price = 5
	NewGameProductInfo.sellerId = 6789
	
	return NewGameProductInfo
end

function GameProductInfoModule.fromJsonData(p1)
	-- upvalues: ResultModule (copy), GameProductInfoModule (copy)
	local IsBoolean: boolean = p1.fiatPurchaseData ~= nil and (type(p1.universeId) == "number" and type(p1.isForSale) == "boolean")
	
	if (type(p1.universeId) ~= "number" or (type(p1.isForSale) ~= "boolean" or (type(p1.productId) ~= "number" or type(p1.price) ~= "number")) or type(p1.sellerId) ~= "number") and not IsBoolean then
		return ResultModule.error("invalid data type")
	end
	local NewGameProductInfo = GameProductInfoModule.new()
	NewGameProductInfo.universeId = tostring(p1.universeId)
	NewGameProductInfo.isForSale = p1.isForSale
	NewGameProductInfo.productId = p1.productId
	NewGameProductInfo.price = p1.price
	NewGameProductInfo.sellerId = p1.sellerId
	
	if p1.fiatPurchaseData then
		NewGameProductInfo.localizedFiatPrice = p1.fiatPurchaseData.localizedFiatPrice
		NewGameProductInfo.fiatBasePriceId = p1.fiatPurchaseData.basePriceId
	end
	return ResultModule.success(NewGameProductInfo)
end

return GameProductInfoModule