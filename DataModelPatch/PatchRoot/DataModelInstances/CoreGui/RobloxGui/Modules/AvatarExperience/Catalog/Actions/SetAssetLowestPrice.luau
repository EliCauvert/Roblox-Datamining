local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(AssetId, PriceInRobux)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(AssetId, "string", "assetId")
	ArgCheckModule.isType(PriceInRobux, "number", "priceInRobux")
	
	return { assetId = AssetId, priceInRobux = PriceInRobux }
end)