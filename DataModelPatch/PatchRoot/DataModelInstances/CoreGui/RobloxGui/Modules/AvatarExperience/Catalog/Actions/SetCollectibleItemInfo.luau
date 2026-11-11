local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(CollectibleItemId, CollectibleItemData)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(CollectibleItemId, "string", "SetCollectibleItemInfo expects collectibleItemId")
	ArgCheckModule.isType(CollectibleItemData, "table", "SetCollectibleItemInfo expects collectibleItemData")
	
	return {
		collectibleItemId = CollectibleItemId,
		collectibleItemData = CollectibleItemData
	}
end)