local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local _UDim = UDim.new(0, 6)

return function(p1)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), _UDim (copy)
	return RoactModule.createElement("TextButton", {
		Text = if p1.frozen then "Frozen" else "Freeze",
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 16),
		LayoutOrder = p1.layoutOrder,
		Font = ConstantsModule.Font.MainWindow,
		TextSize = ConstantsModule.DefaultFontSize.MainWindow + -2,
		TextColor3 = p1.frozen and ConstantsModule.Color.HighlightBlue or ConstantsModule.Color.Text,
		BackgroundColor3 = ConstantsModule.Color.UnselectedGray,
		BorderSizePixel = 1,
		BorderColor3 = ConstantsModule.Color.Text,
		[RoactModule.Event.Activated] = p1.onToggle
	}, {
		Padding = RoactModule.createElement("UIPadding", { PaddingLeft = _UDim, PaddingRight = _UDim })
	})
end