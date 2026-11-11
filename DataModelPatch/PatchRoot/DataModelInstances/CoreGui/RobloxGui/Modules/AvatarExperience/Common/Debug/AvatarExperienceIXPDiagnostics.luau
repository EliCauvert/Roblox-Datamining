local IXPService = game:GetService("IXPService")
local CorePackages = game:GetService("CorePackages")
local UseEventConnectionFunction = require(CorePackages.Packages.ReactUtils).useEventConnection
local AxInit = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.init")
local AvatarExperienceFeatureLayer = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers.AvatarExperienceFeatureLayer

return function()
	-- upvalues: UseEventConnectionFunction (copy), IXPService (copy), AxInit (copy), AvatarExperienceFeatureLayer (copy)
	UseEventConnectionFunction(IXPService.OnUserLayerLoadingStatusChanged, function(UserLayerLoadingStatus)
		-- upvalues: AxInit (upval), IXPService (upval), AvatarExperienceFeatureLayer (upval)
		AxInit:info("IXPLayerLoadingStatusChanged: {}", UserLayerLoadingStatus)
		local UserLayerLoadingStatus1 = IXPService:GetUserLayerLoadingStatus()
		local UserStatusForLayer = IXPService:GetUserStatusForLayer(AvatarExperienceFeatureLayer)
		
		if UserLayerLoadingStatus1 ~= UserLayerLoadingStatus then
			AxInit:info("IXPLayerLoadingStatusChanged -- latest status differs: {}", UserLayerLoadingStatus1)
		end
		if UserStatusForLayer ~= UserLayerLoadingStatus then
			AxInit:info("IXPLayerLoadingStatusChanged -- status for layer {} differs: {}", AvatarExperienceFeatureLayer, UserStatusForLayer)
		end
	end)
	
	return nil
end