local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local ConstantsModule = require(Modules.LuaApp.Constants)
local GetScreenBottomInsetModule = require(Modules.LuaApp.getScreenBottomInset)

return function(p1)
	-- upvalues: UseStyleFunction (copy), GetScreenBottomInsetModule (copy), ReactModule (copy), ConstantsModule (copy), Loading (copy), IconSize (copy)
	local ScreenSize = p1.screenSize
	local Theme = UseStyleFunction().Theme
	local GlobalGuiInset = p1.globalGuiInset
	
	return ReactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = ConstantsModule.DisplayOrder.AntiAddictionPrompt
	}, {
		OverlayFrame = ReactModule.createElement("ImageButton", {
			AutoButtonColor = false,
			ImageTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Theme.Overlay.Color,
			BackgroundTransparency = Theme.Overlay.Transparency
		}, {
			Overlay = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, GlobalGuiInset.top),
				Size = UDim2.fromOffset(ScreenSize.X, ScreenSize.Y - GlobalGuiInset.top - GetScreenBottomInsetModule())
			}, {
				Content = ReactModule.createElement(Loading, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					size = IconSize.Large
				})
			})
		})
	})
end