local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local NavigationEvents = require(CorePackages.Packages.RoactNavigation).NavigationEvents
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXBackendDrivenCatalogLayers = AvatarExperienceFlagsModule.FFlagAXBackendDrivenCatalogLayers
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)
local AXCatalogBELayerExposureCounter = game:DefineFastFlag("AXCatalogBELayerExposureCounter", false)
local FFlagBasedExposureLoggingCatalogPage = AvatarExperienceFlagsModule.FFlagBasedExposureLoggingCatalogPage
local FFlagAXLegacyIXPExposureLogging = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXLegacyIXPExposureLogging
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper

return function(p1)
	-- upvalues: ReactModule (copy), NavigationEvents (copy), FFlagAXLegacyIXPExposureLogging (copy), IxpUtilsModule (copy), FFlagAXBackendDrivenCatalogLayers (copy), AXCatalogBELayerExposureCounter (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), FFlagBasedExposureLoggingCatalogPage (copy), IXPServiceWrapper (copy)
	return ReactModule.createElement(NavigationEvents, {
		onDidFocus = function()
			-- upvalues: p1 (copy), FFlagAXLegacyIXPExposureLogging (upval), IxpUtilsModule (upval), FFlagAXBackendDrivenCatalogLayers (upval), AXCatalogBELayerExposureCounter (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), FFlagBasedExposureLoggingCatalogPage (upval), IXPServiceWrapper (upval)
			for _, ixpTest in p1.ixpTests do
				if ixpTest ~= nil and ixpTest.isEnabled() then
					if not FFlagAXLegacyIXPExposureLogging then
						IxpUtilsModule.logExperimentExposure(ixpTest)
					elseif ixpTest.logExposureEnabled and ixpTest.logExposureEnabled() then
						IxpUtilsModule.logExperimentExposure(ixpTest)
					end
				end
			end
			if FFlagAXBackendDrivenCatalogLayers and p1.layers and #p1.layers > 0 then
				if AXCatalogBELayerExposureCounter then
					SendAXCounterV2Function(ConstantsModule.Counter.LayerExposure.CatalogView)
				end
				for _, layer in p1.layers do
					IxpUtilsModule.logLayerExposure(layer)
				end
			end
			if FFlagBasedExposureLoggingCatalogPage and p1.flagIXPTestLayers then
				for _, flagIXPTestLayer in p1.flagIXPTestLayers do
					if flagIXPTestLayer then
						IXPServiceWrapper:LogFlagLinkedUserLayerExposure(flagIXPTestLayer)
					end
				end
			end
		end
	})
end