local _ = game:GetService("CoreGui").RobloxGui
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local devConsoleDropdownFlipFix = game:DefineFastFlag("DevConsoleDropdownFlipFix", false)
local devConsoleDropdownMultiSelect = game:DefineFastFlag("DevConsoleDropdownMultiSelect", false)
local constantsModule = require(script.Parent.Parent.Constants)
local utilBar = constantsModule.Font.UtilBar
local utilBar_1 = constantsModule.DefaultFontSize.UtilBar
local dropDownArrowHeight = constantsModule.GeneralFormatting.DropDownArrowHeight
local var1 = dropDownArrowHeight / 2
local downArrow = constantsModule.Image.DownArrow
local dropDown = roactModule.Component:extend("DropDown")

function dropDown.init(p1)
	-- upvalues: devConsoleDropdownFlipFix (ref), roactModule (ref)
	if devConsoleDropdownFlipFix then
		p1.guiInset = game:GetService("GuiService"):GetGuiInset()
	end
	function p0.onMainButtonPressed(_, _)
		-- upvalues: p1 (ref)
		p1:setState({ showDropDown = true })
	end
	
	function p0.nonDropDownSelection(_, p2)
		-- upvalues: p1 (ref)
		if p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch and p2.UserInputState == Enum.UserInputState.End then
			p1:setState({ showDropDown = false })
		end
	end
	
	p1.state = { showDropDown = false }
	p1.ref = roactModule.createRef()
end

function dropDown.render(p1)
	-- upvalues: devConsoleDropdownMultiSelect (ref), roactModule (ref), constantsModule (ref), utilBar_1 (ref), utilBar (ref), devConsoleDropdownFlipFix (ref), downArrow (ref), dropDownArrowHeight (ref), var1 (ref)
	local buttonSize = p1.props.buttonSize
	local dropDownList = p1.props.dropDownList
	local selectedIndex = p1.props.selectedIndex
	local onSelection = p1.props.onSelection
	local layoutOrder = p1.props.layoutOrder
	local selectedSet = p1.props.selectedSet
	local onToggle = p1.props.onToggle
	local var2 = devConsoleDropdownMultiSelect and onToggle ~= nil
	local dropDownTargetParent = p1.props.dropDownTargetParent
	local showDropDown = p1.ref.current and p1.state.showDropDown
	local t = {}
	local uDim2 = nil
	local uDim2_1 = nil
	local var3 = 0
	local var4 = 0
	
	if p1.ref.current and showDropDown then
		local absolutePosition = p1.ref.current.AbsolutePosition
		local absoluteSize = p1.ref.current.AbsoluteSize
		var4 = absoluteSize.X
		t.UIListLayout = roactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		})
		
		for i, v in pairs(dropDownList) do
			local _ = nil
			t[v] = roactModule.createElement("TextButton", {
				Size = buttonSize,
				Text = v,
				TextColor3 = constantsModule.Color.Text,
				TextSize = utilBar_1,
				Font = utilBar,
				AutoButtonColor = false,
				BackgroundColor3 = if if var2 then selectedSet ~= nil and selectedSet[i] == true else i == selectedIndex then constantsModule.Color.SelectedGray else constantsModule.Color.UnselectedGray,
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				LayoutOrder = i,
				[roactModule.Event.Activated] = function()
					-- upvalues: var2 (ref), onToggle (ref), i (ref), onSelection (ref), p1 (ref)
					if var2 then
						onToggle(i)
						
						return
					end
					onSelection(i)
					p1:setState({ showDropDown = false })
				end
			})
			var3 += absoluteSize.Y
		end
		local var5 = var3 + 24
		
		if devConsoleDropdownFlipFix then
			local currentCamera = workspace.CurrentCamera
			local var6 = (if currentCamera then currentCamera.ViewportSize.Y else 1e999) - p1.guiInset.Y - (absolutePosition.Y + absoluteSize.Y)
			uDim2_1 = UDim2.new(0, var4 + 24, 0, var5)
			uDim2 = if var6 < var5 and var6 < absolutePosition.Y then UDim2.new(0, absolutePosition.X, 0, absolutePosition.Y - var5) else UDim2.new(0, absolutePosition.X, 0, absolutePosition.Y + absoluteSize.Y)
		else
			uDim2_1 = UDim2.new(0, var4 + 24, 0, var3 + 24)
			uDim2 = UDim2.new(0, absolutePosition.X, 0, absolutePosition.Y + absoluteSize.Y)
		end
	end
	return roactModule.createElement("TextButton", {
		Size = buttonSize,
		Position = devConsoleDropdownFlipFix and (p1.props.position or (UDim2.new() or nil)),
		Text = if var2 then p1.props.summaryText or "" else dropDownList[selectedIndex],
		TextColor3 = constantsModule.Color.Text,
		TextSize = utilBar_1,
		Font = utilBar,
		AutoButtonColor = false,
		BackgroundColor3 = constantsModule.Color.UnselectedGray,
		BackgroundTransparency = 0,
		LayoutOrder = layoutOrder,
		[roactModule.Event.Activated] = p1.onMainButtonPressed,
		[roactModule.Ref] = p1.ref
	}, {
		arrow = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = downArrow,
			Size = UDim2.new(0, dropDownArrowHeight, 0, dropDownArrowHeight),
			Position = UDim2.new(1, (-dropDownArrowHeight) - var1, 0.5, -var1)
		}),
		DropDown = showDropDown and roactModule.createElement(roactModule.Portal, {
			target = if dropDownTargetParent ~= nil then dropDownTargetParent else game:GetService("CoreGui").DevConsoleMaster
		}, {
			InputCatcher = roactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				[roactModule.Event.InputEnded] = p1.nonDropDownSelection
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
						Size = UDim2.new(0, var4, 0, var3)
					}, t)
				})
			})
		})
	})
end

return dropDown