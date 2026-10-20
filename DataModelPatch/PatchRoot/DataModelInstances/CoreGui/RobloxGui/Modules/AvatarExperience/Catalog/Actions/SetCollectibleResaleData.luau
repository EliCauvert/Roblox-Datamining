local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(CollectibleItemId, ResaleData)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(CollectibleItemId, "string", "SetCollectibleResaleData expects collectibleItemId")
	ArgCheckModule.isType(ResaleData, "table", "SetCollectibleResaleData expects resaleData")
	
	return {
		collectibleItemId = CollectibleItemId,
		resaleData = ResaleData
	}
end)