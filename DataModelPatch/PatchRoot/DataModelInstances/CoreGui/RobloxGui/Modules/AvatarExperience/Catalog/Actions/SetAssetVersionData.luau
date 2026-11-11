local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(AssetId, AssetVersionData)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(AssetId, "string", "expect assetId to be a string")
	ArgCheckModule.isType(AssetVersionData, "table", "expect assetVersionData to be a table")
	
	return { assetId = AssetId, assetVersionData = AssetVersionData }
end)