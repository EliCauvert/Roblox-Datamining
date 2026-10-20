local _ = script.Parent.Parent

return function(p1, p2)
	return if p2 then if p1.PremiumPriceInRobux == nil then p1.PriceInRobux or 0 else p1.PremiumPriceInRobux else p1.PriceInRobux or 0
end