local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui").RobloxGui
local roactModule = require(corePackagesService.Packages.Roact)
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local constantsModule = require(script.Parent.Parent.Constants)
local dropDownEntryHeight = constantsModule.GeneralFormatting.DropDownEntryHeight
local dropDownArrowHeight = constantsModule.GeneralFormatting.DropDownArrowHeight
local var1 = dropDownArrowHeight / 2
local downArrow = constantsModule.Image.DownArrow
local fullScreenDropDownButton = roactModule.Component:extend("FullScreenDropDownButton")

function fullScreenDropDownButton.init(p1)
	-- upvalues: robloxGui (ref)
	function p0.startDropDownView()
		-- upvalues: p1 (ref)
		p1:setState({ selectionScreenExpanded = true })
	end
	
	function p0.noSelection(_, p2)
		-- upvalues: p1 (ref)
		if p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch and p2.UserInputState == Enum.UserInputState.End then
			p1:setState({ selectionScreenExpanded = false })
		end
	end
	
	p1.state = {
		selectionScreenExpanded = false,
		guiSizeY = robloxGui.AbsoluteSize.Y
	}
end

function fullScreenDropDownButton.render(p1)
	-- upvalues: roactModule (ref), constantsModule (ref), dropDownEntryHeight (ref), externalEventConnection (ref), robloxGui (ref), dropDownArrowHeight (ref), var1 (ref), downArrow (ref)
	local buttonSize = p1.props.buttonSize
	local dropDownList = p1.props.dropDownList
	local selectedIndex = p1.props.selectedIndex
	local onSelection = p1.props.onSelection
	local layoutOrder = p1.props.layoutOrder
	local selectionScreenExpanded = p1.state.selectionScreenExpanded
	local portalTarget = p1.props.portalTarget
	local t = {}
	local var2 = 16
	
	if selectionScreenExpanded then
		t.UIListLayout = roactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			FillDirection = Enum.FillDirection.Vertical
		})
		
		if dropDownList then
			for i, v in ipairs(dropDownList) do
				t[i] = roactModule.createElement("TextButton", {
					Text = v,
					Font = constantsModule.Font.TabBar,
					TextSize = constantsModule.DefaultFontSize.DropDownTabBar,
					TextColor3 = constantsModule.Color.Text,
					AutoButtonColor = false,
					Size = UDim2.new(1, 0, 0, dropDownEntryHeight),
					BackgroundColor3 = if i == selectedIndex then constantsModule.Color.SelectedGray else constantsModule.Color.UnselectedGray,
					LayoutOrder = i,
					BorderSizePixel = 0,
					[roactModule.Event.Activated] = function(_)
						-- upvalues: p1 (ref), onSelection (ref), i (ref)
						p1:setState({ selectionScreenExpanded = false })
						onSelection(i)
					end
				})
				var2 += dropDownEntryHeight
			end
		end
	end
	return roactModule.createElement("TextButton", {
		Size = buttonSize,
		BackgroundColor3 = constantsModule.Color.UnselectedGray,
		Text = "",
		AutoButtonColor = false,
		LayoutOrder = layoutOrder,
		[roactModule.Event.Activated] = p1.startDropDownView
	}, {
		SizeChangeEvent = roactModule.createElement(externalEventConnection, {
			event = robloxGui:GetPropertyChangedSignal("AbsoluteSize"),
			callback = function()
				-- upvalues: p1 (ref), robloxGui (copy)
				p1:setState({ guiSizeY = robloxGui.AbsoluteSize.Y })
			end
		}),
		text = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, (-dropDownArrowHeight) - var1, 1, 0),
			Text = dropDownList[selectedIndex],
			Font = constantsModule.Font.TabBar,
			TextSize = constantsModule.DefaultFontSize.DropDownTabBar,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextColor3 = constantsModule.Color.Text
		}),
		arrow = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = downArrow,
			Size = UDim2.new(0, dropDownArrowHeight, 0, dropDownArrowHeight),
			Position = UDim2.new(1, (-dropDownArrowHeight) - var1, 0.5, -var1)
		}),
		selectionView = selectionScreenExpanded and roactModule.createElement(roactModule.Portal, {
			target = if portalTarget ~= nil then portalTarget else game:GetService("CoreGui").DevConsoleMaster
		}, {
			GreyOutFrame = roactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = constantsModule.Color.Black,
				BackgroundTransparency = 0.36,
				Active = true,
				[roactModule.Event.InputEnded] = p1.noSelection
			}, {
				BorderFrame = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, 375, 0, var2),
					Position = UDim2.new(0.5, -187.5, 0, 0),
					BackgroundColor3 = constantsModule.Color.UnselectedGray
				}, {
					SelectionFrame = roactModule.createElement("ScrollingFrame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ScrollBarThickness = 0,
						Size = UDim2.new(1, -30, 1, -16),
						Position = UDim2.new(0, 15, 0, 8),
						CanvasSize = UDim2.new(1, -30, 1, var2 - 16 - p1.state.guiSizeY)
					}, t)
				})
			})
		})
	})
end

return fullScreenDropDownButton