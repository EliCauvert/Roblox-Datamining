local IXPService = game:GetService("IXPService")
local AppUserLayers = require(game:GetService("CorePackages").Workspace.Packages.ExperimentLayers).AppUserLayers

return function(_)
	-- upvalues: IXPService (copy), AppUserLayers (copy)
	IXPService:LogUserLayerExposure(AppUserLayers.AvatarMarketplaceItemDetailsPage)
end