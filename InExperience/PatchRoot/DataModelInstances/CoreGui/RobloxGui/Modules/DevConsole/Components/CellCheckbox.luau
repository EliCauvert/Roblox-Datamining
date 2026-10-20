local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local CheckboxModule = require(script.Parent.Checkbox)
local _ = ConstantsModule.DefaultFontSize.MainWindow
local _ = ConstantsModule.Color.Text
local _ = ConstantsModule.Font.MainWindow
local _ = ConstantsModule.Font.MainWindowBold
local CheckboxHeight = ConstantsModule.UtilityBarFormatting.CheckboxHeight
local _ = ConstantsModule.UtilityBarFormatting.CheckboxInnerPadding

return function(Frame)
	-- upvalues: RoactModule (copy), CheckboxModule (copy), CheckboxHeight (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Frame.size,
		Position = Frame.pos,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Checkbox = RoactModule.createElement(CheckboxModule, {
			Name = Frame.name,
			IsSelected = Frame.isSelected,
			Size = UDim2.new(0, CheckboxHeight, 0, CheckboxHeight),
			Position = UDim2.new(0, 0, 0.5, -CheckboxHeight / 2),
			OnSelectedStateChanged = Frame.OnCheckboxClicked
		})
	})
end