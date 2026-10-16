local _ = require(script:FindFirstAncestor("GameFilters").Parent.DiscoveryTypes)

return function(List) --[[ Line: 6 | Named "getSelectedGameFilterOptions" ]]
	local SelectedOptionIds = {}
	
	for _, value in List do
		if value.selectedOptionId ~= value.defaultOptionId then
			SelectedOptionIds[value.filterType] = value.selectedOptionId
		end
	end
	return SelectedOptionIds
end