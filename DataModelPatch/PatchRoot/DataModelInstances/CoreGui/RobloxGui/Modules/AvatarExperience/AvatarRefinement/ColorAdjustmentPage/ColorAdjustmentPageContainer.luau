local ReactModule = require(game:GetService("CorePackages").Packages.React)
local UseColorAdjustmentPagePropsModule = require(script.Parent.useColorAdjustmentPageProps)
local ColorAdjustmentPageModule = require(script.Parent.ColorAdjustmentPage)

return ReactModule.memo((require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function()
	-- upvalues: UseColorAdjustmentPagePropsModule (copy), ReactModule (copy), ColorAdjustmentPageModule (copy)
	return ReactModule.createElement(ColorAdjustmentPageModule, (UseColorAdjustmentPagePropsModule()))
end)))