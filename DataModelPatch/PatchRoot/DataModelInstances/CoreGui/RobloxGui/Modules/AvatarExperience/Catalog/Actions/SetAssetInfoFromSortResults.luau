local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(SortResults)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(SortResults, "table", "SetAssetInfoFromSortResults expects sortResults")
	
	return { sortResults = SortResults }
end)