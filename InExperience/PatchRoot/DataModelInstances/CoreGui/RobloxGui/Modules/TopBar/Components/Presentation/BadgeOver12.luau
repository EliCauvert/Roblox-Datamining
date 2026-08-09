local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local useStyle = require(corePackagesService.Packages.UIBlox).Core.Style.useStyle

return function(p0) --[[ line: 12 ]]
	-- upvalues: useStyle (ref), reactModule (ref), appFonts (ref)
	local var2 = useStyle()
	
	return reactModule.createElement("TextLabel", {
		Text = "12+",
		TextSize = 9,
		BackgroundTransparency = 0,
		LineHeight = 1.25,
		ZIndex = 2,
		AnchorPoint = Vector2.new(0, 1),
		Position = p0.position,
		Font = appFonts.default:getMedium(),
		TextColor3 = var2.Theme.TextEmphasis.Color,
		BackgroundColor3 = var2.Theme.BackgroundUIContrast.Color,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 2),
			PaddingRight = UDim.new(0, 2)
		}),
		Shape = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
	})
end