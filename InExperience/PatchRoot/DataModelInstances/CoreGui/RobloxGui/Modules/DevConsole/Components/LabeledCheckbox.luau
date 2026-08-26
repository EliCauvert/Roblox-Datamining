local textService = game:GetService("TextService")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local checkboxModule = require(script.Parent.Checkbox)
local checkboxInnerPadding = constantsModule.UtilityBarFormatting.CheckboxInnerPadding
local labeledCheckbox = roactModule.Component:extend("LabeledCheckbox")

function labeledCheckbox.render(p1)
	-- upvalues: textService (ref), roactModule (ref), checkboxInnerPadding (ref), checkboxModule (ref), constantsModule (ref)
	local checkboxHeight = p1.props.checkboxHeight
	local frameHeight = p1.props.frameHeight
	local layoutOrder = p1.props.layoutOrder
	local name = p1.props.name
	local font = p1.props.font
	local fontSize = p1.props.fontSize
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, checkboxHeight + textService:GetTextSize(name, fontSize, font, Vector2.new(0, frameHeight)).X + checkboxInnerPadding * 2, 0, frameHeight),
		LayoutOrder = layoutOrder
	}, {
		Checkbox = roactModule.createElement(checkboxModule, {
			Name = name,
			IsSelected = p1.props.isSelected,
			SelectedColor = p1.props.selectedColor,
			UnselectedColor = p1.props.unselectedColor,
			Size = UDim2.new(0, checkboxHeight, 0, checkboxHeight),
			Position = UDim2.new(0, 0, 0.5, -checkboxHeight / 2),
			OnSelectedStateChanged = p1.props.onCheckboxClicked
		}),
		Text = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = name,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = font,
			TextSize = fontSize,
			Size = UDim2.new(1, -frameHeight, 1, 0),
			Position = UDim2.new(0, checkboxHeight + checkboxInnerPadding, 0, 0)
		})
	})
end

return labeledCheckbox