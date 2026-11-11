local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.DiscoveryTypes)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(SearchUuid, Sorts)
	return { searchUuid = SearchUuid, sorts = Sorts }
end)