local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(AssetId, AssetTypeIdString)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(AssetId, "string", "SetAnimationPreview: assetId")
	ArgCheckModule.isType(AssetTypeIdString, "string", "SetAnimationPreview: assetTypeIdString")
	
	return { assetId = AssetId, assetTypeIdString = AssetTypeIdString }
end)