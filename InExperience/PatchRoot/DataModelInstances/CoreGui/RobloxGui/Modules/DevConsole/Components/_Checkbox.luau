local textService = game:GetService("TextService")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local checkboxInnerPadding = constantsModule.UtilityBarFormatting.CheckboxInnerPadding
local checkbox = roactModule.Component:extend("Checkbox")

function checkbox.render(p0) --[[ line: 10 ]]
	-- upvalues: constantsModule (ref), textService (ref), roactModule (ref), checkboxInnerPadding (ref)
	local checkboxHeight = p0.props.checkboxHeight
	local frameHeight = p0.props.frameHeight
	local layoutOrder = p0.props.layoutOrder
	local name = p0.props.name
	local font = p0.props.font
	local fontSize = p0.props.fontSize
	local isSelected = p0.props.isSelected
	local selectedColor = p0.props.selectedColor
	local unselectedColor = p0.props.unselectedColor
	local onCheckboxClicked = p0.props.onCheckboxClicked
	local var4 = ""
	local var5 = 1
	local var6 = unselectedColor
	
	if isSelected then
		var4 = constantsModule.Image.Check
		var5 = 0
		var6 = selectedColor
	end
	return roactModule.createElement("ImageButton", {
		Size = UDim2.new(0, checkboxHeight + textService:GetTextSize(name, fontSize, font, Vector2.new(0, frameHeight)).X + checkboxInnerPadding * 2, 0, frameHeight),
		BackgroundTransparency = 1,
		LayoutOrder = layoutOrder,
		[roactModule.Event.Activated] = function(_) --[[ line: 43 ]]
			-- upvalues: onCheckboxClicked (ref), name (ref), isSelected (ref)
			onCheckboxClicked(name, not isSelected)
		end
	}, {
		Icon = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 0,
			Image = var4,
			Size = UDim2.new(0, checkboxHeight, 0, checkboxHeight),
			Position = UDim2.new(0, 0, 0.5, -checkboxHeight / 2),
			BackgroundColor3 = var6,
			BorderColor3 = constantsModule.Color.Text,
			BorderSizePixel = var5
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