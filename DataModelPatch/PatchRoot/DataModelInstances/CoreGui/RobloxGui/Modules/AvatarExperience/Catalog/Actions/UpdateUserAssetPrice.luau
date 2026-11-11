local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(UserAssetId, PriceInRobux)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(UserAssetId, "string", "userAssetId")
	ArgCheckModule.isTypeOrNil(PriceInRobux, "number", "priceInRobux")
	
	return { userAssetId = UserAssetId, priceInRobux = PriceInRobux }
end)