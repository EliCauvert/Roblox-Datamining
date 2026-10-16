local TextService = game:GetService("TextService")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local CheckboxModule = require(script.Parent.Checkbox)
local CheckboxInnerPadding = ConstantsModule.UtilityBarFormatting.CheckboxInnerPadding
local LabeledCheckbox = RoactModule.Component:extend("LabeledCheckbox")

function LabeledCheckbox.render(p1) --[[ Line: 11 ]]
	-- upvalues: TextService (copy), RoactModule (copy), CheckboxInnerPadding (copy), CheckboxModule (copy), ConstantsModule (copy)
	local CheckboxHeight: number = p1.props.checkboxHeight
	local FrameHeight = p1.props.frameHeight
	local Name = p1.props.name
	local PropsFont = p1.props.font
	local FontSize = p1.props.fontSize
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, CheckboxHeight + TextService:GetTextSize(Name, FontSize, PropsFont, Vector2.new(0, FrameHeight)).X + CheckboxInnerPadding * 2, 0, FrameHeight),
		LayoutOrder = p1.props.layoutOrder
	}, {
		Checkbox = RoactModule.createElement(CheckboxModule, {
			Name = Name,
			IsSelected = p1.props.isSelected,
			SelectedColor = p1.props.selectedColor,
			UnselectedColor = p1.props.unselectedColor,
			Size = UDim2.new(0, CheckboxHeight, 0, CheckboxHeight),
			Position = UDim2.new(0, 0, 0.5, -CheckboxHeight / 2),
			OnSelectedStateChanged = p1.props.onCheckboxClicked
		}),
		Text = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = Name,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = PropsFont,
			TextSize = FontSize,
			Size = UDim2.new(1, -FrameHeight, 1, 0),
			Position = UDim2.new(0, CheckboxHeight + CheckboxInnerPadding, 0, 0)
		})
	})
end

return LabeledCheckbox