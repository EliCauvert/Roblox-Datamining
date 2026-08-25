local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local checkboxModule = require(script.Parent.Checkbox)
local _ = constantsModule.DefaultFontSize.MainWindow
local _ = constantsModule.Color.Text
local _ = constantsModule.Font.MainWindow
local _ = constantsModule.Font.MainWindowBold
local checkboxHeight = constantsModule.UtilityBarFormatting.CheckboxHeight
local _ = constantsModule.UtilityBarFormatting.CheckboxInnerPadding

return function(p0)
	-- upvalues: roactModule (ref), checkboxModule (ref), checkboxHeight (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p0.size,
		Position = p0.pos,
		LayoutOrder = p0.LayoutOrder
	}, {
		Checkbox = roactModule.createElement(checkboxModule, {
			Name = p0.name,
			IsSelected = p0.isSelected,
			Size = UDim2.new(0, checkboxHeight, 0, checkboxHeight),
			Position = UDim2.new(0, 0, 0.5, -checkboxHeight / 2),
			OnSelectedStateChanged = p0.OnCheckboxClicked
		})
	})
end