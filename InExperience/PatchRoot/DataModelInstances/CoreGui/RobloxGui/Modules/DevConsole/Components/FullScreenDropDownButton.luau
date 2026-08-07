local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui").RobloxGui
local roactModule = require(corePackagesService.Packages.Roact)
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local constantsModule = require(script.Parent.Parent.Constants)
local dropDownEntryHeight = constantsModule.GeneralFormatting.DropDownEntryHeight
local dropDownArrowHeight = constantsModule.GeneralFormatting.DropDownArrowHeight
local var3 = dropDownArrowHeight / 2
local downArrow = constantsModule.Image.DownArrow
local fullScreenDropDownButton = roactModule.Component:extend("FullScreenDropDownButton")

function fullScreenDropDownButton.init(p0) --[[ line: 19 ]]
	-- upvalues: robloxGui (ref)
	function p0.startDropDownView() --[[ line: 20 ]]
		-- upvalues: p0 (ref)
		p0:setState({ selectionScreenExpanded = true })
	end
	
	function p0.noSelection(_, p1) --[[ line: 26 ]]
		-- upvalues: p0 (ref)
		if p1.UserInputType == Enum.UserInputType.MouseButton1 or p1.UserInputType == Enum.UserInputType.Touch and p1.UserInputState == Enum.UserInputState.End then
			p0:setState({ selectionScreenExpanded = false })
		end
	end
	
	p0.state = {
		selectionScreenExpanded = false,
		guiSizeY = robloxGui.AbsoluteSize.Y
	}
end

function fullScreenDropDownButton.render(p2) --[[ line: 43 ]]
	-- upvalues: roactModule (ref), constantsModule (ref), dropDownEntryHeight (ref), externalEventConnection (ref), robloxGui (ref), dropDownArrowHeight (ref), var3 (ref), downArrow (ref)
	local buttonSize = p2.props.buttonSize
	local dropDownList = p2.props.dropDownList
	local selectedIndex = p2.props.selectedIndex
	local onSelection = p2.props.onSelection
	local layoutOrder = p2.props.layoutOrder
	local selectionScreenExpanded = p2.state.selectionScreenExpanded
	local portalTarget = p2.props.portalTarget
	local t = {}
	local var6 = 16
	
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
					[roactModule.Event.Activated] = function(_) --[[ line: 80 ]]
						-- upvalues: p2 (ref), onSelection (ref), i (ref)
						p2:setState({ selectionScreenExpanded = false })
						onSelection(i)
					end
				})
				var6 += dropDownEntryHeight
			end
		end
	end
	return roactModule.createElement("TextButton", {
		Size = buttonSize,
		BackgroundColor3 = constantsModule.Color.UnselectedGray,
		Text = "",
		AutoButtonColor = false,
		LayoutOrder = layoutOrder,
		[roactModule.Event.Activated] = p2.startDropDownView
	}, {
		SizeChangeEvent = roactModule.createElement(externalEventConnection, {
			event = robloxGui:GetPropertyChangedSignal("AbsoluteSize"),
			callback = function() --[[ line: 106 ]]
				-- upvalues: p2 (ref), robloxGui (copy)
				p2:setState({ guiSizeY = robloxGui.AbsoluteSize.Y })
			end
		}),
		text = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, (-dropDownArrowHeight) - var3, 1, 0),
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
			Position = UDim2.new(1, (-dropDownArrowHeight) - var3, 0.5, -var3)
		}),
		selectionView = selectionScreenExpanded and roactModule.createElement(roactModule.Portal, {
			target = if portalTarget ~= nil then portalTarget else game:GetService("CoreGui").DevConsoleMaster
		}, {
			GreyOutFrame = roactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = constantsModule.Color.Black,
				BackgroundTransparency = 0.36,
				Active = true,
				[roactModule.Event.InputEnded] = p2.noSelection
			}, {
				BorderFrame = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, 375, 0, var6),
					Position = UDim2.new(0.5, -187.5, 0, 0),
					BackgroundColor3 = constantsModule.Color.UnselectedGray
				}, {
					SelectionFrame = roactModule.createElement("ScrollingFrame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ScrollBarThickness = 0,
						Size = UDim2.new(1, -30, 1, -16),
						Position = UDim2.new(0, 15, 0, 8),
						CanvasSize = UDim2.new(1, -30, 1, var6 - 16 - p2.state.guiSizeY)
					}, t)
				})
			})
		})
	})
end

return fullScreenDropDownButton