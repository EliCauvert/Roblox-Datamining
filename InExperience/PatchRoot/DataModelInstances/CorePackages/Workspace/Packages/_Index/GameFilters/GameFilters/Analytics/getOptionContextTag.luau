local _ = require(script:FindFirstAncestor("GameFilters").Parent.DiscoveryTypes)

return function(p1, p2)
	if p2 == nil then
		return nil
	end
	for i, v in p1.filterOptions do
		if v.optionId == p2 then
			return if v.optionContextTag and v.optionContextTag ~= "" then v.optionContextTag else nil
		end
	end
	return nil
end