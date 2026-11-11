local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FlyoutSidePanelModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.FlyoutSidePanel.FlyoutSidePanel)
local UseDrawerShouldMountFunction = require(CorePackages.Workspace.Packages.Drawer).Hooks.useDrawerShouldMount

return ReactModule.memo(function(p1)
	-- upvalues: UseDrawerShouldMountFunction (copy), ReactModule (copy), FlyoutSidePanelModule (copy)
	return if UseDrawerShouldMountFunction() then ReactModule.createElement(FlyoutSidePanelModule, p1) else nil
end)