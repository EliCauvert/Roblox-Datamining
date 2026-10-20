local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle

return function()
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), Loading (copy), IconSize (copy)
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
		BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency
	}, {
		LoadingSpinner = ReactModule.createElement(Loading, {
			size = IconSize.Medium,
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		})
	})
end