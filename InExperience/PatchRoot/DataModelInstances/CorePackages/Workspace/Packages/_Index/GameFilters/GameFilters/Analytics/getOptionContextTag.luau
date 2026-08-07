local _ = require(script:FindFirstAncestor("GameFilters").Parent.DiscoveryTypes)

return function(p0, p1) --[[ line: 6 ]]
	if p1 == nil then
		return nil
	end
	for i, v in p0.filterOptions do
		if v.optionId == p1 then
			return if v.optionContextTag and v.optionContextTag ~= "" then v.optionContextTag else nil
		end
	end
	return nil
end