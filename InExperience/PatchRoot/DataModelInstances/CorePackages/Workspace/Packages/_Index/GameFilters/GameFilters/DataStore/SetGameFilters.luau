local parent = script:FindFirstAncestor("GameFilters").Parent
local _ = require(parent.DiscoveryTypes)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { groupId = p1, filters = p2, updatedTimestamp = p3 }
end)