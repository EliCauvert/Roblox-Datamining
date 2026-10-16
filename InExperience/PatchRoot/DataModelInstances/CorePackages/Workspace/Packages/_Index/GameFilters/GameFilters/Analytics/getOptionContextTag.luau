local _ = require(script:FindFirstAncestor("GameFilters").Parent.DiscoveryTypes)

return function(p1, OptionId) --[[ Line: 6 ]]
	if OptionId == nil then
		return nil
	end
	for _, filterOption in p1.filterOptions do
		if filterOption.optionId == OptionId then
			return if filterOption.optionContextTag and filterOption.optionContextTag ~= "" then filterOption.optionContextTag else nil
		end
	end
	return nil
end