local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(CollectibleItemId, CollectibleItemInstances)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(CollectibleItemId, "string", "SetCollectibleResellersInstances expects collectibleItemId")
	ArgCheckModule.isType(CollectibleItemInstances, "table", "SetCollectibleResellersInstances expects collectibleItemInstances")
	
	return {
		collectibleItemId = CollectibleItemId,
		collectibleItemInstances = CollectibleItemInstances
	}
end)