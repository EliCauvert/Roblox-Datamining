local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

return function(p0)
	if #p0 <= 1 then
		return p0
	end
	local cloned = table.clone(p0)
	table.sort(cloned, function(p1, p2)
		return if p1.robuxAmount == p2.robuxAmount then p1.id < p2.id else p2.robuxAmount < p1.robuxAmount
	end)
	
	return cloned
end