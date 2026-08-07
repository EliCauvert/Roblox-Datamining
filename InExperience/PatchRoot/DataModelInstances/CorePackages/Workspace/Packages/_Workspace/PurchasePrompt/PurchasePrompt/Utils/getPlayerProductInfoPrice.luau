local _ = script.Parent.Parent

return function(p0, p1) --[[ line: 5 ]]
	return if p1 then if p0.PremiumPriceInRobux == nil then p0.PriceInRobux or 0 else p0.PremiumPriceInRobux else p0.PriceInRobux or 0
end