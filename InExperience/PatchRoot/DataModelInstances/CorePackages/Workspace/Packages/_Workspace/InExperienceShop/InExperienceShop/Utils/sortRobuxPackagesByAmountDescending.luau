local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

return function(p1)
	if #p1 <= 1 then
		return p1
	end
	local cloned = table.clone(p1)
	table.sort(cloned, function(p2, p3)
		return if p2.robuxAmount == p3.robuxAmount then p2.id < p3.id else p3.robuxAmount < p2.robuxAmount
	end)
	
	return cloned
end