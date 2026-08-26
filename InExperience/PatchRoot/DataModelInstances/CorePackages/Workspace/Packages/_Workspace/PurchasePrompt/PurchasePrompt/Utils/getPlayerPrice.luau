local _ = script.Parent.Parent

return function(p1, p2, p3)
	return if p3 and p3 > 0 then p3 elseif p2 then if p1.premiumPrice == nil then p1.price else p1.premiumPrice else p1.price
end