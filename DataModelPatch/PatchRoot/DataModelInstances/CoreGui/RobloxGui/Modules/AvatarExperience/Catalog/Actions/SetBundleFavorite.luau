local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(BundleId, IsFavorited)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(BundleId, "string", "SetBundleFavorite expects bundleId")
	ArgCheckModule.isType(IsFavorited, "boolean", "SetBundleFavorite expects isFavorited")
	
	return { bundleId = BundleId, isFavorited = IsFavorited }
end)