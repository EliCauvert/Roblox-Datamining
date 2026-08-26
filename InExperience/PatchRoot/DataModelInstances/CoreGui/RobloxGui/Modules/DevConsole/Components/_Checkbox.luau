local textService = game:GetService("TextService")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local checkboxInnerPadding = constantsModule.UtilityBarFormatting.CheckboxInnerPadding
local checkbox = roactModule.Component:extend("Checkbox")

function checkbox.render(p1)
	-- upvalues: constantsModule (ref), textService (ref), roactModule (ref), checkboxInnerPadding (ref)
	local checkboxHeight = p1.props.checkboxHeight
	local frameHeight = p1.props.frameHeight
	local layoutOrder = p1.props.layoutOrder
	local name = p1.props.name
	local font = p1.props.font
	local fontSize = p1.props.fontSize
	local isSelected = p1.props.isSelected
	local selectedColor = p1.props.selectedColor
	local unselectedColor = p1.props.unselectedColor
	local onCheckboxClicked = p1.props.onCheckboxClicked
	local var1 = ""
	local var2 = 1
	local var3 = unselectedColor
	
	if isSelected then
		var1 = constantsModule.Image.Check
		var2 = 0
		var3 = selectedColor
	end
	return roactModule.createElement("ImageButton", {
		Size = UDim2.new(0, checkboxHeight + textService:GetTextSize(name, fontSize, font, Vector2.new(0, frameHeight)).X + checkboxInnerPadding * 2, 0, frameHeight),
		BackgroundTransparency = 1,
		LayoutOrder = layoutOrder,
		[roactModule.Event.Activated] = function(_)
			-- upvalues: onCheckboxClicked (ref), name (ref), isSelected (ref)
			onCheckboxClicked(name, not isSelected)
		end
	}, {
		Icon = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 0,
			Image = var1,
			Size = UDim2.new(0, checkboxHeight, 0, checkboxHeight),
			Position = UDim2.new(0, 0, 0.5, -checkboxHeight / 2),
			BackgroundColor3 = var3,
			BorderColor3 = constantsModule.Color.Text,
			BorderSizePixel = var2
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

return checkbox