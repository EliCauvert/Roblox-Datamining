local _ = require(script:FindFirstAncestor("GameFilters").Parent.DiscoveryTypes)

return function(p1)
	local t = {}
	
	for i, v in p1 do
		if v.selectedOptionId ~= v.defaultOptionId then
			t[v.filterType] = v.selectedOptionId
		end
	end
	return t
end