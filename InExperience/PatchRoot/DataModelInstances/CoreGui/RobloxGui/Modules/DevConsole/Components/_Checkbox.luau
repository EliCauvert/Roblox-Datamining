local TextService = game:GetService("TextService")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local CheckboxInnerPadding = ConstantsModule.UtilityBarFormatting.CheckboxInnerPadding
local Checkbox = RoactModule.Component:extend("Checkbox")

function Checkbox.render(p1) --[[ Line: 10 ]]
	-- upvalues: ConstantsModule (copy), TextService (copy), RoactModule (copy), CheckboxInnerPadding (copy)
	local CheckboxHeight: number = p1.props.checkboxHeight
	local FrameHeight = p1.props.frameHeight
	local LayoutOrder = p1.props.layoutOrder
	local Name = p1.props.name
	local PropsFont = p1.props.font
	local FontSize = p1.props.fontSize
	local IsSelected = p1.props.isSelected
	local SelectedColor = p1.props.selectedColor
	local OnCheckboxClickedFunction = p1.props.onCheckboxClicked
	local Check = ""
	local BorderSizePixel = 1
	local UnselectedColor = p1.props.unselectedColor
	
	if IsSelected then
		Check = ConstantsModule.Image.Check
		BorderSizePixel = 0
		UnselectedColor = SelectedColor
	end
	return RoactModule.createElement("ImageButton", {
		Size = UDim2.new(0, CheckboxHeight + TextService:GetTextSize(Name, FontSize, PropsFont, Vector2.new(0, FrameHeight)).X + CheckboxInnerPadding * 2, 0, FrameHeight),
		BackgroundTransparency = 1,
		LayoutOrder = LayoutOrder,
		[RoactModule.Event.Activated] = function(_) --[[ Line: 43 ]]
			-- upvalues: OnCheckboxClickedFunction (copy), Name (copy), IsSelected (copy)
			OnCheckboxClickedFunction(Name, not IsSelected)
		end
	}, {
		Icon = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 0,
			Image = Check,
			Size = UDim2.new(0, CheckboxHeight, 0, CheckboxHeight),
			Position = UDim2.new(0, 0, 0.5, -CheckboxHeight / 2),
			BackgroundColor3 = UnselectedColor,
			BorderColor3 = ConstantsModule.Color.Text,
			BorderSizePixel = BorderSizePixel
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

return Checkbox