local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local checkboxModule = require(script.Parent.Checkbox)
local _ = constantsModule.DefaultFontSize.MainWindow
local _ = constantsModule.Color.Text
local _ = constantsModule.Font.MainWindow
local _ = constantsModule.Font.MainWindowBold
local checkboxHeight = constantsModule.UtilityBarFormatting.CheckboxHeight
local _ = constantsModule.UtilityBarFormatting.CheckboxInnerPadding

return function(p1)
	-- upvalues: roactModule (ref), checkboxModule (ref), checkboxHeight (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.size,
		Position = p1.pos,
		LayoutOrder = p1.LayoutOrder
	}, {
		Checkbox = roactModule.createElement(checkboxModule, {
			Name = p1.name,
			IsSelected = p1.isSelected,
			Size = UDim2.new(0, checkboxHeight, 0, checkboxHeight),
			Position = UDim2.new(0, 0, 0.5, -checkboxHeight / 2),
			OnSelectedStateChanged = p1.OnCheckboxClicked
		})
	})
end