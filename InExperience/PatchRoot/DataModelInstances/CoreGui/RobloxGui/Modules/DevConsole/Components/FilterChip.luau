local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local t = {
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
local uDim = UDim.new(0, 9)
local uDim_1 = UDim.new(0, 8)

return function(p1)
	-- upvalues: t (ref), roactModule (ref), constantsModule (ref), uDim (ref), uDim_1 (ref)
	local var1 = if p1.isOn then t.on else t.off
	
	return roactModule.createElement("TextButton", {
		Text = p1.name,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 18),
		LayoutOrder = p1.layoutOrder,
		Font = constantsModule.Font.MainWindow,
		TextSize = constantsModule.DefaultFontSize.MainWindow + -3,
		TextColor3 = var1.text,
		BackgroundColor3 = var1.background,
		AutoButtonColor = false,
		[roactModule.Event.Activated] = p1.onActivated
	}, {
		Corner = roactModule.createElement("UICorner", { CornerRadius = uDim }),
		Stroke = roactModule.createElement("UIStroke", { Thickness = 1, Color = var1.border }),
		Padding = roactModule.createElement("UIPadding", { PaddingLeft = uDim_1, PaddingRight = uDim_1 })
	})
end