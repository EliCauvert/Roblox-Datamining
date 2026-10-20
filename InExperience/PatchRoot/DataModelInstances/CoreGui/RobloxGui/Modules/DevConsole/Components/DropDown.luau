local _ = game:GetService("CoreGui").RobloxGui
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local DevConsoleDropdownFlipFix = game:DefineFastFlag("DevConsoleDropdownFlipFix", false)
local DevConsoleDropdownMultiSelect = game:DefineFastFlag("DevConsoleDropdownMultiSelect", false)
local ConstantsModule = require(script.Parent.Parent.Constants)
local UtilBar = ConstantsModule.Font.UtilBar
local UtilBar1 = ConstantsModule.DefaultFontSize.UtilBar
local DropDownArrowHeight: number = ConstantsModule.GeneralFormatting.DropDownArrowHeight
local DropDownArrowHeightRatio = DropDownArrowHeight / 2
local DownArrow = ConstantsModule.Image.DownArrow
local DropDown = RoactModule.Component:extend("DropDown")

function DropDown.init(p1)
	-- upvalues: DevConsoleDropdownFlipFix (copy), RoactModule (copy)
	if DevConsoleDropdownFlipFix then
		p1.guiInset = game:GetService("GuiService"):GetGuiInset()
	end
	function p1:onMainButtonPressed(_)
		-- upvalues: p1 (copy)
		p1:setState({ showDropDown = true })
	end
	
	function p1:nonDropDownSelection(Input)
		-- upvalues: p1 (copy)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch and Input.UserInputState == Enum.UserInputState.End then
			p1:setState({ showDropDown = false })
		end
	end
	
	p1.state = { showDropDown = false }
	p1.ref = RoactModule.createRef()
end

function DropDown.render(p1)
	-- upvalues: DevConsoleDropdownMultiSelect (copy), RoactModule (copy), ConstantsModule (copy), UtilBar1 (copy), UtilBar (copy), DevConsoleDropdownFlipFix (copy), DownArrow (copy), DropDownArrowHeight (copy), DropDownArrowHeightRatio (copy)
	local ButtonSize = p1.props.buttonSize
	local DropDownList = p1.props.dropDownList
	local SelectedIndex = p1.props.selectedIndex
	local OnSelectionFunction = p1.props.onSelection
	local LayoutOrder = p1.props.layoutOrder
	local SelectedSet = p1.props.selectedSet
	local OnToggleFunction = p1.props.onToggle
	local HasOnToggleFunction: boolean = DevConsoleDropdownMultiSelect and OnToggleFunction ~= nil
	local DropDownTargetParent = p1.props.dropDownTargetParent
	local ShowDropDown = p1.ref.current and p1.state.showDropDown
	local TextButtons = {}
	local Position: UDim2? = nil
	local Size: UDim2? = nil
	local YOffset = 0
	local XOffset = 0
	
	if p1.ref.current and ShowDropDown then
		local AbsolutePosition = p1.ref.current.AbsolutePosition
		local AbsoluteSize = p1.ref.current.AbsoluteSize
		XOffset = AbsoluteSize.X
		TextButtons.UIListLayout = RoactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		})
		
		for LayoutOrder1, Text in pairs(DropDownList) do
			TextButtons[Text] = RoactModule.createElement("TextButton", {
				Size = ButtonSize,
				Text = Text,
				TextColor3 = ConstantsModule.Color.Text,
				TextSize = UtilBar1,
				Font = UtilBar,
				AutoButtonColor = false,
				BackgroundColor3 = (if HasOnToggleFunction then SelectedSet ~= nil and SelectedSet[LayoutOrder1] == true else LayoutOrder1 == SelectedIndex) and ConstantsModule.Color.SelectedGray or ConstantsModule.Color.UnselectedGray,
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				LayoutOrder = LayoutOrder1,
				[RoactModule.Event.Activated] = function()
					-- upvalues: HasOnToggleFunction (copy), OnToggleFunction (copy), LayoutOrder1 (copy), OnSelectionFunction (copy), p1 (copy)
					if HasOnToggleFunction then
						OnToggleFunction(LayoutOrder1)
						
						return
					else
						OnSelectionFunction(LayoutOrder1)
						p1:setState({ showDropDown = false })
					end
				end
			})
			YOffset += AbsoluteSize.Y
		end
		local NewYOffset = YOffset + 24
		
		if DevConsoleDropdownFlipFix then
			local CurrentCamera = workspace.CurrentCamera
			local YDelta = (CurrentCamera and CurrentCamera.ViewportSize.Y or 1e999) - p1.guiInset.Y - (AbsolutePosition.Y + AbsoluteSize.Y)
			local Y = AbsolutePosition.Y
			local IsYDeltaBelow: boolean = YDelta < NewYOffset and YDelta < Y
			Size = UDim2.new(0, XOffset + 24, 0, NewYOffset)
			Position = if IsYDeltaBelow then UDim2.new(0, AbsolutePosition.X, 0, AbsolutePosition.Y - NewYOffset) else UDim2.new(0, AbsolutePosition.X, 0, AbsolutePosition.Y + AbsoluteSize.Y)
		else
			Size = UDim2.new(0, XOffset + 24, 0, YOffset + 24)
			Position = UDim2.new(0, AbsolutePosition.X, 0, AbsolutePosition.Y + AbsoluteSize.Y)
		end
	end
	return RoactModule.createElement("TextButton", {
		Size = ButtonSize,
		Position = DevConsoleDropdownFlipFix and (p1.props.position or UDim2.new()) or nil,
		Text = if HasOnToggleFunction then p1.props.summaryText or "" else DropDownList[SelectedIndex],
		TextColor3 = ConstantsModule.Color.Text,
		TextSize = UtilBar1,
		Font = UtilBar,
		AutoButtonColor = false,
		BackgroundColor3 = ConstantsModule.Color.UnselectedGray,
		BackgroundTransparency = 0,
		LayoutOrder = LayoutOrder,
		[RoactModule.Event.Activated] = p1.onMainButtonPressed,
		[RoactModule.Ref] = p1.ref
	}, {
		arrow = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = DownArrow,
			Size = UDim2.new(0, DropDownArrowHeight, 0, DropDownArrowHeight),
			Position = UDim2.new(1, -DropDownArrowHeight - DropDownArrowHeightRatio, 0.5, -DropDownArrowHeightRatio)
		}),
		DropDown = ShowDropDown and RoactModule.createElement(RoactModule.Portal, {
			target = if DropDownTargetParent == nil then game:GetService("CoreGui").DevConsoleMaster else DropDownTargetParent or game:GetService("CoreGui").DevConsoleMaster
		}, {
			InputCatcher = RoactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				[RoactModule.Event.InputEnded] = p1.nonDropDownSelection
			}, {
				OuterFrame = RoactModule.createElement("ImageButton", {
					AutoButtonColor = false,
					BackgroundTransparency = 0,
					Size = Size,
					Position = Position,
					BackgroundColor3 = ConstantsModule.Color.TextBoxGray
				}, {
					innerFrame = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 12, 0, 12),
						Size = UDim2.new(0, XOffset, 0, YOffset)
					}, TextButtons)
				})
			})
		})
	})
end

return DropDown