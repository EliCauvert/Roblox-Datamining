local parent = script:FindFirstAncestor("GameFilters").Parent
local _ = require(parent.DiscoveryTypes)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2)
	return { groupId = p0, filters = p1, updatedTimestamp = p2 }
end)