local _ = script.Parent.Parent

return function(p0, p1, p2)
	return if p2 and p2 > 0 then p2 elseif p1 then if p0.premiumPrice == nil then p0.price else p0.premiumPrice else p0.price
end