local Parent = script:FindFirstAncestor("GameFilters").Parent
local _ = require(Parent.DiscoveryTypes)

return require(Parent.Rodux).makeActionCreator(script.Name, function(GroupId, Filters, UpdatedTimestamp) --[[ Line: 9 ]]
	return {
		groupId = GroupId,
		filters = Filters,
		updatedTimestamp = UpdatedTimestamp
	}
end)