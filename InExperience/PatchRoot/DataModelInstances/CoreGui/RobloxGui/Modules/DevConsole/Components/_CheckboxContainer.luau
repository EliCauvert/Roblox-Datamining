local textService = game:GetService("TextService")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Components
local checkboxModule = require(components._Checkbox)
local checkboxDropdownModule = require(components._CheckboxDropdown)
local constantsModule = require(script.Parent.Parent.Constants)
local checkboxHeight = constantsModule.UtilityBarFormatting.CheckboxHeight
local var5 = constantsModule.UtilityBarFormatting.CheckboxInnerPadding * 2
local filterUnfilled = constantsModule.Image.FilterUnfilled
local filterFilled = constantsModule.Image.FilterFilled
local checkboxContainer = roactModule.PureComponent:extend("CheckboxContainer")

function checkboxContainer.init(p0)
	-- upvalues: textService (ref), constantsModule (ref), checkboxHeight (ref), var5 (ref), roactModule (ref)
	function p0.onCheckboxClicked(p1, p2)
		-- upvalues: p0 (ref)
		p0.props.onCheckboxChanged(p1, p2)
	end
	
	function p0.onCheckboxExpanded(_, p3)
		-- upvalues: p0 (ref)
		if p3.UserInputType == Enum.UserInputType.MouseButton1 or p3.UserInputType == Enum.UserInputType.Touch and p3.UserInputState == Enum.UserInputState.End then
			p0:setState({ expanded = true })
		end
	end
	
	function p0.onCloseCheckbox(_, p4)
		-- upvalues: p0 (ref)
		if p4.UserInputType == Enum.UserInputType.MouseButton1 or p4.UserInputType == Enum.UserInputType.Touch and p4.UserInputState == Enum.UserInputState.End then
			p0:setState({ expanded = false })
		end
	end
	
	if not p0.props.orderedCheckboxState then
		warn("CheckboxContainer must be passed a list of Box Names or else it only creates an empty frame")
	end
	local t = {}
	local var8 = 0
	local var9 = 0
	
	for i, v in ipairs(p0.props.orderedCheckboxState) do
		local nameTextSize = textService:GetTextSize(v.name, constantsModule.DefaultFontSize.UtilBar, constantsModule.Font.UtilBar, Vector2.new(0, 0))
		t[i] = nameTextSize.X
		var8 = var8 + nameTextSize.X + checkboxHeight + var5
		var9 += 1
	end
	p0.ref = roactModule.createRef()
	p0.state = {
		expanded = false,
		textWidths = t,
		numCheckboxes = var9,
		minFullLength = var8
	}
end

function checkboxContainer.render(p5)
	-- upvalues: roactModule (ref), checkboxModule (ref), constantsModule (ref), checkboxHeight (ref), filterFilled (ref), filterUnfilled (ref), checkboxDropdownModule (ref)
	local t = {}
	local frameWidth = p5.props.frameWidth
	local frameHeight = p5.props.frameHeight
	local pos = p5.props.pos
	local layoutOrder = p5.props.layoutOrder
	local orderedCheckboxState = p5.props.orderedCheckboxState
	local minFullLength = p5.state.minFullLength
	local expanded = p5.state.expanded
	local numCheckboxes = p5.state.numCheckboxes
	local var12 = false
	
	for i, v in ipairs(orderedCheckboxState) do
		t[v.name] = roactModule.createElement(checkboxModule, {
			name = v.name,
			font = constantsModule.Font.UtilBar,
			fontSize = constantsModule.DefaultFontSize.UtilBar,
			checkboxHeight = checkboxHeight,
			frameHeight = frameHeight,
			layoutOrder = i,
			isSelected = v.state,
			selectedColor = constantsModule.Color.SelectedBlue,
			unselectedColor = constantsModule.Color.UnselectedGray,
			onCheckboxClicked = p5.onCheckboxClicked
		})
		var12 = var12 or v.state
	end
	if frameWidth >= minFullLength then
		t.CheckboxLayout = roactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			FillDirection = Enum.FillDirection.Horizontal
		})
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, frameWidth, 0, frameHeight),
			Position = pos,
			LayoutOrder = layoutOrder
		}, t)
	end
	t.CheckboxLayout = roactModule.createElement("UIListLayout", {
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		FillDirection = Enum.FillDirection.Vertical
	})
	local expanded_1 = p5.ref.current and expanded
	local uDim2 = nil
	
	if expanded_1 then
		local absolutePosition = p5.ref.current.AbsolutePosition
		uDim2 = UDim2.new(0, absolutePosition.X, 0, absolutePosition.Y + frameHeight + 3)
	end
	return roactModule.createElement("ImageButton", {
		Size = UDim2.new(0, frameHeight, 0, frameHeight),
		LayoutOrder = layoutOrder,
		Image = if expanded_1 then filterFilled else filterUnfilled,
		BackgroundTransparency = 1,
		BorderColor3 = constantsModule.Color.Text,
		[roactModule.Event.InputEnded] = p5.onCheckboxExpanded,
		[roactModule.Ref] = p5.ref
	}, {
		DropDown = expanded_1 and roactModule.createElement(checkboxDropdownModule, {
			absolutePosition = uDim2,
			frameWidth = frameWidth,
			elementHeight = frameHeight,
			numElements = numCheckboxes,
			onCloseCheckbox = p5.onCloseCheckbox
		}, t)
	})
end

return checkboxContainer