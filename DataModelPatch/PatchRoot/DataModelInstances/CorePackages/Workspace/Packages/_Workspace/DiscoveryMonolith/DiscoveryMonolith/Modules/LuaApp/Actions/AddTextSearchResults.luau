local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local _ = require(DiscoveryMonolith.Modules.LuaApp.Models.DiscoveryApi.TextSearchEntry)

return require(DiscoveryMonolith.Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return {
		searchUuid = p1.searchUuid,
		topicId = p1.topicId,
		entry = p1.entry
	}
end)