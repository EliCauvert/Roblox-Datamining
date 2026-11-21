local Parent = script:FindFirstAncestor("AvatarExperienceSearch").Parent
local ReactModule = require(Parent.React)
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local IXPServiceWrapper = require(Parent.IxpServiceWrapper).IXPServiceWrapper
local FFlagBasedExposureLoggingCatalogPage = require(Parent.AvatarExperienceFlags).FFlagBasedExposureLoggingCatalogPage

return function()
	-- upvalues: ReactModule (copy), FFlagBasedExposureLoggingCatalogPage (copy), IXPServiceWrapper (copy), AppUserLayers (copy)
	ReactModule.useEffect(function()
		-- upvalues: FFlagBasedExposureLoggingCatalogPage (upval), IXPServiceWrapper (upval), AppUserLayers (upval)
		if FFlagBasedExposureLoggingCatalogPage then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AppUserLayers.AvatarExperienceUASearchView)
		end
	end, {})
	
	return nil
end