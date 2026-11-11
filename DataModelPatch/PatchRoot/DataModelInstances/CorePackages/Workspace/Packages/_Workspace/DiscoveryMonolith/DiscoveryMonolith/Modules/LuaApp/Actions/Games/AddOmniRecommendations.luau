local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local _ = require(Parent.DiscoveryTypes)

return require(Parent.Rodux).makeActionCreator(script.Name, function(p1, IsAppend)
	return {
		recommendations = { [p1.pageType] = p1 },
		isAppend = IsAppend
	}
end)