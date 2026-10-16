local TextService = game:GetService("TextService")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Components
local LabeledCheckboxModule = require(Components.LabeledCheckbox)
local CheckboxDropdownModule = require(Components.CheckboxDropdown)
local ConstantsModule = require(script.Parent.Parent.Constants)
local CheckboxHeight = ConstantsModule.UtilityBarFormatting.CheckboxHeight
local ScaledCheckboxInnerPadding = ConstantsModule.UtilityBarFormatting.CheckboxInnerPadding * 2
local FilterUnfilled = ConstantsModule.Image.FilterUnfilled
local FilterFilled = ConstantsModule.Image.FilterFilled
local CheckboxContainer = RoactModule.PureComponent:extend("CheckboxContainer")

function CheckboxContainer.init(p1) --[[ Line: 20 ]]
	-- upvalues: TextService (copy), ConstantsModule (copy), CheckboxHeight (copy), ScaledCheckboxInnerPadding (copy), RoactModule (copy)
	function p1.onCheckboxClicked(p2, p3) --[[ Line: 21 ]]
		-- upvalues: p1 (copy)
		p1.props.onCheckboxChanged(p2, p3)
	end
	
	function p1:onCheckboxExpanded(Input) --[[ Line: 27 ]]
		-- upvalues: p1 (copy)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch and Input.UserInputState == Enum.UserInputState.End then
			p1:setState({ expanded = true })
		end
	end
	
	function p1:onCloseCheckbox(Input) --[[ Line: 39 ]]
		-- upvalues: p1 (copy)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch and Input.UserInputState == Enum.UserInputState.End then
			p1:setState({ expanded = false })
		end
	end
	
	if not p1.props.orderedCheckboxState then
		warn("CheckboxContainer must be passed a list of Box Names or else it only creates an empty frame")
	end
	local TextWidths = {}
	local NewX = 0
	local NumCheckboxes = 0
	
	for i, value in ipairs(p1.props.orderedCheckboxState) do
		local TextSize = TextService:GetTextSize(value.name, ConstantsModule.DefaultFontSize.UtilBar, ConstantsModule.Font.UtilBar, Vector2.new(0, 0))
		TextWidths[i] = TextSize.X
		NewX = NewX + TextSize.X + CheckboxHeight + ScaledCheckboxInnerPadding
		NumCheckboxes += 1
	end
	p1.ref = RoactModule.createRef()
	p1.state = {
		expanded = false,
		textWidths = TextWidths,
		numCheckboxes = NumCheckboxes,
		minFullLength = NewX
	}
end

function CheckboxContainer.render(p2) --[[ Line: 79 ]]
	-- upvalues: RoactModule (copy), LabeledCheckboxModule (copy), ConstantsModule (copy), CheckboxHeight (copy), FilterFilled (copy), FilterUnfilled (copy), CheckboxDropdownModule (copy)
	local Elements = {}
	local FrameWidth = p2.props.frameWidth
	local FrameHeight = p2.props.frameHeight
	local Pos = p2.props.pos
	local LayoutOrder = p2.props.layoutOrder
	local MinFullLength = p2.state.minFullLength
	local Expanded = p2.state.expanded
	local NumCheckboxes = p2.state.numCheckboxes
	local v1 = false
	
	for LayoutOrder1, value in ipairs(p2.props.orderedCheckboxState) do
		Elements[value.name] = RoactModule.createElement(LabeledCheckboxModule, {
			name = value.name,
			font = ConstantsModule.Font.UtilBar,
			fontSize = ConstantsModule.DefaultFontSize.UtilBar,
			checkboxHeight = CheckboxHeight,
			frameHeight = FrameHeight,
			layoutOrder = LayoutOrder1,
			isSelected = value.state,
			selectedColor = ConstantsModule.Color.SelectedBlue,
			unselectedColor = ConstantsModule.Color.UnselectedGray,
			onCheckboxClicked = p2.onCheckboxClicked
		})
		v1 = v1 or value.state
	end
	if FrameWidth >= MinFullLength then
		Elements.CheckboxLayout = RoactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			FillDirection = Enum.FillDirection.Horizontal
		})
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, FrameWidth, 0, FrameHeight),
			Position = Pos,
			LayoutOrder = LayoutOrder
		}, Elements)
	end
	Elements.CheckboxLayout = RoactModule.createElement("UIListLayout", {
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		FillDirection = Enum.FillDirection.Vertical
	})
	local Expanded1 = p2.ref.current and Expanded
	local AbsolutePosition: UDim2? = nil
	
	if Expanded1 then
		local AbsolutePosition1 = p2.ref.current.AbsolutePosition
		AbsolutePosition = UDim2.new(0, AbsolutePosition1.X, 0, AbsolutePosition1.Y + FrameHeight + 3)
	end
	return RoactModule.createElement("ImageButton", {
		Size = UDim2.new(0, FrameHeight, 0, FrameHeight),
		LayoutOrder = LayoutOrder,
		Image = Expanded1 and FilterFilled or FilterUnfilled,
		BackgroundTransparency = 1,
		BorderColor3 = ConstantsModule.Color.Text,
		[RoactModule.Event.InputEnded] = p2.onCheckboxExpanded,
		[RoactModule.Ref] = p2.ref
	}, {
		DropDown = Expanded1 and RoactModule.createElement(CheckboxDropdownModule, {
			absolutePosition = AbsolutePosition,
			frameWidth = FrameWidth,
			elementHeight = FrameHeight,
			numElements = NumCheckboxes,
			onCloseCheckbox = p2.onCloseCheckbox
		}, Elements)
	})
end

return CheckboxContainer