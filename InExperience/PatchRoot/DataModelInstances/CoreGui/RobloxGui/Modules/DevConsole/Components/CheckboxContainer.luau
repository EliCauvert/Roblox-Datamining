local textService = game:GetService("TextService")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Components
local labeledCheckboxModule = require(components.LabeledCheckbox)
local checkboxDropdownModule = require(components.CheckboxDropdown)
local constantsModule = require(script.Parent.Parent.Constants)
local checkboxHeight = constantsModule.UtilityBarFormatting.CheckboxHeight
local var1 = constantsModule.UtilityBarFormatting.CheckboxInnerPadding * 2
local filterUnfilled = constantsModule.Image.FilterUnfilled
local filterFilled = constantsModule.Image.FilterFilled
local checkboxContainer = roactModule.PureComponent:extend("CheckboxContainer")

function checkboxContainer.init(p1)
	-- upvalues: textService (ref), constantsModule (ref), checkboxHeight (ref), var1 (ref), roactModule (ref)
	function p0.onCheckboxClicked(p2, p3)
		-- upvalues: p1 (ref)
		p1.props.onCheckboxChanged(p2, p3)
	end
	
	function p0.onCheckboxExpanded(_, p2)
		-- upvalues: p1 (ref)
		if p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch and p2.UserInputState == Enum.UserInputState.End then
			p1:setState({ expanded = true })
		end
	end
	
	function p0.onCloseCheckbox(_, p2)
		-- upvalues: p1 (ref)
		if p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch and p2.UserInputState == Enum.UserInputState.End then
			p1:setState({ expanded = false })
		end
	end
	
	if not p1.props.orderedCheckboxState then
		warn("CheckboxContainer must be passed a list of Box Names or else it only creates an empty frame")
	end
	local t = {}
	local var2 = 0
	local var3 = 0
	
	for i, v in ipairs(p1.props.orderedCheckboxState) do
		local nameTextSize = textService:GetTextSize(v.name, constantsModule.DefaultFontSize.UtilBar, constantsModule.Font.UtilBar, Vector2.new(0, 0))
		t[i] = nameTextSize.X
		var2 = var2 + nameTextSize.X + checkboxHeight + var1
		var3 += 1
	end
	p1.ref = roactModule.createRef()
	p1.state = {
		expanded = false,
		textWidths = t,
		numCheckboxes = var3,
		minFullLength = var2
	}
end

function checkboxContainer.render(p2)
	-- upvalues: roactModule (ref), labeledCheckboxModule (ref), constantsModule (ref), checkboxHeight (ref), filterFilled (ref), filterUnfilled (ref), checkboxDropdownModule (ref)
	local t = {}
	local frameWidth = p2.props.frameWidth
	local frameHeight = p2.props.frameHeight
	local pos = p2.props.pos
	local layoutOrder = p2.props.layoutOrder
	local orderedCheckboxState = p2.props.orderedCheckboxState
	local minFullLength = p2.state.minFullLength
	local expanded = p2.state.expanded
	local numCheckboxes = p2.state.numCheckboxes
	local var4 = false
	
	for i, v in ipairs(orderedCheckboxState) do
		t[v.name] = roactModule.createElement(labeledCheckboxModule, {
			name = v.name,
			font = constantsModule.Font.UtilBar,
			fontSize = constantsModule.DefaultFontSize.UtilBar,
			checkboxHeight = checkboxHeight,
			frameHeight = frameHeight,
			layoutOrder = i,
			isSelected = v.state,
			selectedColor = constantsModule.Color.SelectedBlue,
			unselectedColor = constantsModule.Color.UnselectedGray,
			onCheckboxClicked = p2.onCheckboxClicked
		})
		var4 = var4 or v.state
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
	local expanded_1 = p2.ref.current and expanded
	local uDim2 = nil
	
	if expanded_1 then
		local absolutePosition = p2.ref.current.AbsolutePosition
		uDim2 = UDim2.new(0, absolutePosition.X, 0, absolutePosition.Y + frameHeight + 3)
	end
	return roactModule.createElement("ImageButton", {
		Size = UDim2.new(0, frameHeight, 0, frameHeight),
		LayoutOrder = layoutOrder,
		Image = if expanded_1 then filterFilled else filterUnfilled,
		BackgroundTransparency = 1,
		BorderColor3 = constantsModule.Color.Text,
		[roactModule.Event.InputEnded] = p2.onCheckboxExpanded,
		[roactModule.Ref] = p2.ref
	}, {
		DropDown = expanded_1 and roactModule.createElement(checkboxDropdownModule, {
			absolutePosition = uDim2,
			frameWidth = frameWidth,
			elementHeight = frameHeight,
			numElements = numCheckboxes,
			onCloseCheckbox = p2.onCloseCheckbox
		}, t)
	})
end

return checkboxContainer