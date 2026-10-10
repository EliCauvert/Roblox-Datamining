local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local uDim = UDim.new(0, 6)

return function(p1)
	-- upvalues: roactModule (ref), constantsModule (ref), uDim (ref)
	return roactModule.createElement("TextButton", {
		Text = if p1.frozen then "Frozen" else "Freeze",
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 16),
		LayoutOrder = p1.layoutOrder,
		Font = constantsModule.Font.MainWindow,
		TextSize = constantsModule.DefaultFontSize.MainWindow + -2,
		TextColor3 = if p1.frozen then constantsModule.Color.HighlightBlue else constantsModule.Color.Text,
		BackgroundColor3 = constantsModule.Color.UnselectedGray,
		BorderSizePixel = 1,
		BorderColor3 = constantsModule.Color.Text,
		[roactModule.Event.Activated] = p1.onToggle
	}, {
		Padding = roactModule.createElement("UIPadding", { PaddingLeft = uDim, PaddingRight = uDim })
	})
end