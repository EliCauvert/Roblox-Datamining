local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local _ = require(CorePackages.Workspace.Packages.Style)
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local _ = require(CorePackages.Packages.ReactOtter)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole

return function(p1, p2)
	-- upvalues: UiMode (copy), FFlagEnableLeftNavOnConsole (copy)
	local IsUiModeMatch = p1.uiMode == UiMode.TenFoot
	
	return {
		Page = {
			BackgroundColor = p2.Color.Surface.Surface_0.Color3,
			BackgroundTransparency = if IsUiModeMatch and not FFlagEnableLeftNavOnConsole then 1 else p2.Color.Surface.Surface_0.Transparency,
			SafeAreaMargin = if IsUiModeMatch then Vector2.new(p2.Size.Size_1600, p2.Size.Size_600) else Vector2.zero,
			ScrollAnimationConfig = { dampingRatio = 1, frequency = 3 }
		}
	}
end