local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local CellLabelModule = require(script.Parent.CellLabel)
local ConstantsModule = require(script.Parent.Parent.Constants)

return function(p1) --[[ Line: 17 | Named "InfoBanner" ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy), CellLabelModule (copy)
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 20),
		LayoutOrder = p1.layoutOrder,
		BackgroundColor3 = ConstantsModule.Color.TextBoxGray
	}, {
		Accent = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, 2, 1, 0),
			BackgroundColor3 = ConstantsModule.Color.HighlightBlue
		}),
		Label = RoactModule.createElement(CellLabelModule, {
			text = p1.text,
			size = UDim2.new(1, -10, 1, 0),
			pos = UDim2.new(0, 10, 0, 0)
		})
	})
end