local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(UserAssets)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(UserAssets, "table", "userAssets")
	
	return { userAssets = UserAssets }
end)