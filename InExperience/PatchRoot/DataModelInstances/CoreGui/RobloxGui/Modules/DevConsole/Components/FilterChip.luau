local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local config = {
	on = {
		background = Color3.fromRGB(14, 26, 14),
		border = Color3.fromRGB(32, 64, 32),
		text = Color3.fromRGB(130, 220, 130)
	},
	off = {
		background = Color3.fromRGB(18, 18, 18),
		border = Color3.fromRGB(40, 40, 40),
		text = Color3.fromRGB(150, 150, 150)
	}
}
local _UDim = UDim.new(0, 9)
local _UDim1 = UDim.new(0, 8)

return function(p1)
	-- upvalues: config (copy), RoactModule (copy), ConstantsModule (copy), _UDim (copy), _UDim1 (copy)
	local On = p1.isOn and config.on or config.off
	
	return RoactModule.createElement("TextButton", {
		Text = p1.name,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 18),
		LayoutOrder = p1.layoutOrder,
		Font = ConstantsModule.Font.MainWindow,
		TextSize = ConstantsModule.DefaultFontSize.MainWindow + -3,
		TextColor3 = On.text,
		BackgroundColor3 = On.background,
		AutoButtonColor = false,
		[RoactModule.Event.Activated] = p1.onActivated
	}, {
		Corner = RoactModule.createElement("UICorner", { CornerRadius = _UDim }),
		Stroke = RoactModule.createElement("UIStroke", { Thickness = 1, Color = On.border }),
		Padding = RoactModule.createElement("UIPadding", { PaddingLeft = _UDim1, PaddingRight = _UDim1 })
	})
end