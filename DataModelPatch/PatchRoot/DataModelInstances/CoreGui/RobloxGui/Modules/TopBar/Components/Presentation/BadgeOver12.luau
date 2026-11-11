local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), AppFonts (copy)
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("TextLabel", {
		Text = "12+",
		TextSize = 9,
		BackgroundTransparency = 0,
		LineHeight = 1.25,
		ZIndex = 2,
		AnchorPoint = Vector2.new(0, 1),
		Position = p1.position,
		Font = AppFonts.default:getMedium(),
		TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundUIContrast.Color,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 2),
			PaddingRight = UDim.new(0, 2)
		}),
		Shape = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
	})
end