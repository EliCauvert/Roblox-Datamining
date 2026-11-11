local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.Style)
local _ = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole

return function(p1, _)
	-- upvalues: UiMode (copy), FFlagEnableLeftNavOnConsole (copy)
	return {
		BackgroundTransparency = if p1.uiMode == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole then 1 else 0
	}
end