local _ = require(script.Parent.Parent.Enums.ProductPurchaseSurface)

return function(Text): string --[[ Line: 6 ]]
	return "PurchaseStarted_" .. Text
end