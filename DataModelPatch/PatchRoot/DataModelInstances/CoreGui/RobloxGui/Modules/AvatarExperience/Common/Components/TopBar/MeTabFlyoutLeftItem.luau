local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FlyoutLeftHeader = require(CorePackages.Workspace.Packages.FlyoutSidePanel).Components.FlyoutLeftHeader
local FlyoutSidePanelIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP

return function()
	-- upvalues: ReactModule (copy), FlyoutLeftHeader (copy), FlyoutSidePanelIXP (copy)
	return ReactModule.createElement(FlyoutLeftHeader, {
		isFlyoutEntrypointEnabled = FlyoutSidePanelIXP.isFlyoutSidePanelEnabled(),
		isAlternateEntryPointEnabled = FlyoutSidePanelIXP.isAlternateEntryPointEnabled()
	})
end