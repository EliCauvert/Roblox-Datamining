local _ = game:GetService("CoreGui").RobloxGui
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local devConsoleDropdownFlipFix = game:DefineFastFlag("DevConsoleDropdownFlipFix", false)
local constantsModule = require(script.Parent.Parent.Constants)
local utilBar = constantsModule.Font.UtilBar
local utilBar_1 = constantsModule.DefaultFontSize.UtilBar
local dropDownArrowHeight = constantsModule.GeneralFormatting.DropDownArrowHeight
local var3 = dropDownArrowHeight / 2
local downArrow = constantsModule.Image.DownArrow
local dropDown = roactModule.Component:extend("DropDown")

function dropDown.init(p0) --[[ line: 18 ]]
	-- upvalues: devConsoleDropdownFlipFix (ref), roactModule (ref)
	if devConsoleDropdownFlipFix then
		p0.guiInset = game:GetService("GuiService"):GetGuiInset()
	end
	function p0.onMainButtonPressed(_, _) --[[ line: 23 ]]
		-- upvalues: p0 (ref)
		p0:setState({ showDropDown = true })
	end
	
	function p0.nonDropDownSelection(_, p1) --[[ line: 29 ]]
		-- upvalues: p0 (ref)
		if p1.UserInputType == Enum.UserInputType.MouseButton1 or p1.UserInputType == Enum.UserInputType.Touch and p1.UserInputState == Enum.UserInputState.End then
			p0:setState({ showDropDown = false })
		end
	end
	
	p0.state = { showDropDown = false }
	p0.ref = roactModule.createRef()
end

function dropDown.render(p2) --[[ line: 47 ]]
	-- upvalues: roactModule (ref), constantsModule (ref), utilBar_1 (ref), utilBar (ref), devConsoleDropdownFlipFix (ref), downArrow (ref), dropDownArrowHeight (ref), var3 (ref)
	local buttonSize = p2.props.buttonSize
	local dropDownList = p2.props.dropDownList
	local selectedIndex = p2.props.selectedIndex
	local onSelection = p2.props.onSelection
	local layoutOrder = p2.props.layoutOrder
	local dropDownTargetParent = p2.props.dropDownTargetParent
	local showDropDown = p2.ref.current and p2.state.showDropDown
	local t = {}
	local uDim2 = nil
	local uDim2_1 = nil
	local var9 = 0
	local var10 = 0
	
	if p2.ref.current and showDropDown then
		local absolutePosition = p2.ref.current.AbsolutePosition
		local absoluteSize = p2.ref.current.AbsoluteSize
		var10 = absoluteSize.X
		t.UIListLayout = roactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		})
		
		for i, v in pairs(dropDownList) do
			t[v] = roactModule.createElement("TextButton", {
				Size = buttonSize,
				Text = v,
				TextColor3 = constantsModule.Color.Text,
				TextSize = utilBar_1,
				Font = utilBar,
				AutoButtonColor = false,
				BackgroundColor3 = if i == selectedIndex then constantsModule.Color.SelectedGray else constantsModule.Color.UnselectedGray,
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				LayoutOrder = i,
				[roactModule.Event.Activated] = function() --[[ line: 94 ]]
					-- upvalues: onSelection (ref), i (ref), p2 (ref)
					onSelection(i)
					p2:setState({ showDropDown = false })
				end
			})
			var9 += absoluteSize.Y
		end
		local var11 = var9 + 24
		
		if devConsoleDropdownFlipFix then
			local currentCamera = workspace.CurrentCamera
			local var12 = (if currentCamera then currentCamera.ViewportSize.Y else 1e999) - p2.guiInset.Y - (absolutePosition.Y + absoluteSize.Y)
			uDim2_1 = UDim2.new(0, var10 + 24, 0, var11)
			uDim2 = if var12 < var11 and var12 < absolutePosition.Y then UDim2.new(0, absolutePosition.X, 0, absolutePosition.Y - var11) else UDim2.new(0, absolutePosition.X, 0, absolutePosition.Y + absoluteSize.Y)
		else
			uDim2_1 = UDim2.new(0, var10 + 24, 0, var9 + 24)
			uDim2 = UDim2.new(0, absolutePosition.X, 0, absolutePosition.Y + absoluteSize.Y)
		end
	end
	return roactModule.createElement("TextButton", {
		Size = buttonSize,
		Position = devConsoleDropdownFlipFix and (p2.props.position or (UDim2.new() or nil)),
		Text = dropDownList[selectedIndex],
		TextColor3 = constantsModule.Color.Text,
		TextSize = utilBar_1,
		Font = utilBar,
		AutoButtonColor = false,
		BackgroundColor3 = constantsModule.Color.UnselectedGray,
		BackgroundTransparency = 0,
		LayoutOrder = layoutOrder,
		[roactModule.Event.Activated] = p2.onMainButtonPressed,
		[roactModule.Ref] = p2.ref
	}, {
		arrow = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = downArrow,
			Size = UDim2.new(0, dropDownArrowHeight, 0, dropDownArrowHeight),
			Position = UDim2.new(1, (-dropDownArrowHeight) - var3, 0.5, -var3)
		}),
		DropDown = showDropDown and roactModule.createElement(roactModule.Portal, {
			target = if dropDownTargetParent ~= nil then dropDownTargetParent else game:GetService("CoreGui").DevConsoleMaster
		}, {
			InputCatcher = roactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				[roactModule.Event.InputEnded] = p2.nonDropDownSelection
			}, {
				OuterFrame = roactModule.createElement("ImageButton", {
					AutoButtonColor = false,
					BackgroundTransparency = 0,
					Size = uDim2_1,
					Position = uDim2,
					BackgroundColor3 = constantsModule.Color.TextBoxGray
				}, {
					innerFrame = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 12, 0, 12),
						Size = UDim2.new(0, var10, 0, var9)
					}, t)
				})
			})
		})
	})
end

return dropDown