local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(CollectibleItemId, ResaleParametersInfo, ItemSubTypeNameString)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(CollectibleItemId, "string", "SetCollectibleMarketplaceResaleParameters action expects collectibleItemId to be a string")
	ArgCheckModule.isType(ResaleParametersInfo, "table", "SetCollectibleMarketplaceResaleParameters action expects resaleParametersInfo to be a table")
	
	return {
		collectibleItemId = CollectibleItemId,
		resaleParametersInfo = ResaleParametersInfo,
		itemSubTypeNameString = ItemSubTypeNameString
	}
end)