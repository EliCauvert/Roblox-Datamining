local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local cellLabelModule = require(script.Parent.CellLabel)
local constantsModule = require(script.Parent.Parent.Constants)

return function(p1)
	-- upvalues: roactModule (ref), constantsModule (ref), cellLabelModule (ref)
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 20),
		LayoutOrder = p1.layoutOrder,
		BackgroundColor3 = constantsModule.Color.TextBoxGray
	}, {
		Accent = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, 2, 1, 0),
			BackgroundColor3 = constantsModule.Color.HighlightBlue
		}),
		Label = roactModule.createElement(cellLabelModule, {
			text = p1.text,
			size = UDim2.new(1, -10, 1, 0),
			pos = UDim2.new(0, 10, 0, 0)
		})
	})
end