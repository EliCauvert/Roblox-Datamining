local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui").RobloxGui
local RoactModule = require(CorePackages.Packages.Roact)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local ConstantsModule = require(script.Parent.Parent.Constants)
local DropDownEntryHeight = ConstantsModule.GeneralFormatting.DropDownEntryHeight
local DropDownArrowHeight: number = ConstantsModule.GeneralFormatting.DropDownArrowHeight
local DropDownArrowHeightRatio = DropDownArrowHeight / 2
local DownArrow = ConstantsModule.Image.DownArrow
local FullScreenDropDownButton = RoactModule.Component:extend("FullScreenDropDownButton")

function FullScreenDropDownButton.init(p1)
	-- upvalues: RobloxGui (copy)
	function p1.startDropDownView()
		-- upvalues: p1 (copy)
		p1:setState({ selectionScreenExpanded = true })
	end
	
	function p1:noSelection(Input)
		-- upvalues: p1 (copy)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch and Input.UserInputState == Enum.UserInputState.End then
			p1:setState({ selectionScreenExpanded = false })
		end
	end
	
	p1.state = {
		selectionScreenExpanded = false,
		guiSizeY = RobloxGui.AbsoluteSize.Y
	}
end

function FullScreenDropDownButton.render(p1)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), DropDownEntryHeight (copy), ExternalEventConnection (copy), RobloxGui (copy), DropDownArrowHeight (copy), DropDownArrowHeightRatio (copy), DownArrow (copy)
	local ButtonSize = p1.props.buttonSize
	local DropDownList = p1.props.dropDownList
	local SelectedIndex = p1.props.selectedIndex
	local OnSelectionFunction = p1.props.onSelection
	local LayoutOrder = p1.props.layoutOrder
	local SelectionScreenExpanded = p1.state.selectionScreenExpanded
	local PortalTarget = p1.props.portalTarget
	local TextButtons = {}
	local YOffset = 16
	
	if SelectionScreenExpanded then
		TextButtons.UIListLayout = RoactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			FillDirection = Enum.FillDirection.Vertical
		})
		
		if DropDownList then
			for LayoutOrder1, Text in ipairs(DropDownList) do
				TextButtons[LayoutOrder1] = RoactModule.createElement("TextButton", {
					Text = Text,
					Font = ConstantsModule.Font.TabBar,
					TextSize = ConstantsModule.DefaultFontSize.DropDownTabBar,
					TextColor3 = ConstantsModule.Color.Text,
					AutoButtonColor = false,
					Size = UDim2.new(1, 0, 0, DropDownEntryHeight),
					BackgroundColor3 = LayoutOrder1 == SelectedIndex and ConstantsModule.Color.SelectedGray or ConstantsModule.Color.UnselectedGray,
					LayoutOrder = LayoutOrder1,
					BorderSizePixel = 0,
					[RoactModule.Event.Activated] = function(_)
						-- upvalues: p1 (copy), OnSelectionFunction (copy), LayoutOrder1 (copy)
						p1:setState({ selectionScreenExpanded = false })
						OnSelectionFunction(LayoutOrder1)
					end
				})
				YOffset += DropDownEntryHeight
			end
		end
	end
	local YOffsetDelta = YOffset - 16 - p1.state.guiSizeY
	
	return RoactModule.createElement("TextButton", {
		Size = ButtonSize,
		BackgroundColor3 = ConstantsModule.Color.UnselectedGray,
		Text = "",
		AutoButtonColor = false,
		LayoutOrder = LayoutOrder,
		[RoactModule.Event.Activated] = p1.startDropDownView
	}, {
		SizeChangeEvent = RoactModule.createElement(ExternalEventConnection, {
			event = RobloxGui:GetPropertyChangedSignal("AbsoluteSize"),
			callback = function()
				-- upvalues: p1 (copy), RobloxGui (upval)
				p1:setState({ guiSizeY = RobloxGui.AbsoluteSize.Y })
			end
		}),
		text = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -DropDownArrowHeight - DropDownArrowHeightRatio, 1, 0),
			Text = DropDownList[SelectedIndex],
			Font = ConstantsModule.Font.TabBar,
			TextSize = ConstantsModule.DefaultFontSize.DropDownTabBar,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextColor3 = ConstantsModule.Color.Text
		}),
		arrow = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = DownArrow,
			Size = UDim2.new(0, DropDownArrowHeight, 0, DropDownArrowHeight),
			Position = UDim2.new(1, -DropDownArrowHeight - DropDownArrowHeightRatio, 0.5, -DropDownArrowHeightRatio)
		}),
		selectionView = SelectionScreenExpanded and RoactModule.createElement(RoactModule.Portal, {
			target = if PortalTarget == nil then game:GetService("CoreGui").DevConsoleMaster else PortalTarget or game:GetService("CoreGui").DevConsoleMaster
		}, {
			GreyOutFrame = RoactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = ConstantsModule.Color.Black,
				BackgroundTransparency = 0.36,
				Active = true,
				[RoactModule.Event.InputEnded] = p1.noSelection
			}, {
				BorderFrame = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, 375, 0, YOffset),
					Position = UDim2.new(0.5, -187.5, 0, 0),
					BackgroundColor3 = ConstantsModule.Color.UnselectedGray
				}, {
					SelectionFrame = RoactModule.createElement("ScrollingFrame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ScrollBarThickness = 0,
						Size = UDim2.new(1, -30, 1, -16),
						Position = UDim2.new(0, 15, 0, 8),
						CanvasSize = UDim2.new(1, -30, 1, YOffsetDelta)
					}, TextButtons)
				})
			})
		})
	})
end

return FullScreenDropDownButton