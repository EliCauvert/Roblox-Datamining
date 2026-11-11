local _ = require(script.Parent.Parent.Enums.ProductPurchaseSurface)

return function(Text): string
	return "PurchaseStarted_" .. Text
end