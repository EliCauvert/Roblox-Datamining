local textService = game:GetService("TextService")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local frameHeight = constantsModule.TabRowFormatting.FrameHeight
local tabDropDownWidth = constantsModule.TabRowFormatting.TabDropDownWidth
local tabOverlapThreshold = constantsModule.TabRowFormatting.TabOverlapThreshold
local frameHeight_1 = constantsModule.UtilityBarFormatting.FrameHeight
local smallFrameHeight = constantsModule.UtilityBarFormatting.SmallFrameHeight
local smallUtilPadding = constantsModule.UtilityBarFormatting.SmallUtilPadding
local clientServerButtonWidth = constantsModule.UtilityBarFormatting.ClientServerButtonWidth
local clientServerDropDownWidth = constantsModule.UtilityBarFormatting.ClientServerDropDownWidth
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local parent = script.Parent
local clientServerButtonModule = require(parent.ClientServerButton)
local checkboxContainerModule = require(parent.CheckboxContainer)
local tabRowContainerModule = require(parent.TabRowContainer)
local searchBarModule = require(parent.SearchBar)
local utilAndTab = roactModule.Component:extend("UtilAndTab")

function utilAndTab.init(p0) --[[ line: 29 ]]
	-- upvalues: textService (ref), constantsModule (ref), roactModule (ref)
	local tabList = p0.props.tabList
	local var8 = 0
	local var9 = 0
	
	for i, v in pairs(tabList) do
		var8 += textService:GetTextSize(i, constantsModule.DefaultFontSize.TabBar, constantsModule.Font.TabBar, Vector2.new(0, 0)).X
		var9 += 1
	end
	function p0.showSearchBar() --[[ line: 41 ]]
		-- upvalues: p0 (ref)
		p0:setState({ activeSearchTerm = true })
	end
	
	function p0.cancelInput(_, p1) --[[ line: 47 ]]
		-- upvalues: p0 (ref)
		if p1.UserInputType == Enum.UserInputType.MouseButton1 or p1.UserInputType == Enum.UserInputType.Touch and p1.UserInputState == Enum.UserInputState.End then
			if p0.searchRef.current then
				p0.searchRef.current.Text = ""
			end
			local onSearchTermChanged = p0.props.onSearchTermChanged
			
			if onSearchTermChanged then
				onSearchTermChanged("")
			end
			p0:setState({ activeSearchTerm = false })
		end
	end
	
	function p0.focusLost(p2, p3, _) --[[ line: 68 ]]
		-- upvalues: p0 (ref)
		if p3 then
			local text = p2.text
			local onSearchTermChanged = p0.props.onSearchTermChanged
			
			if onSearchTermChanged then
				onSearchTermChanged(text)
			end
			local var10 = text ~= ""
			
			if p0.state.activeSearchTerm ~= var10 then
				p0:setState({ activeSearchTerm = var10 })
			end
		end
	end
	
	p0.state = {
		activeSearchTerm = false,
		totalTabWidth = var8,
		totalTabCount = var9
	}
	p0.utilRef = roactModule.createRef()
	p0.searchRef = roactModule.createRef()
end

function utilAndTab.render(p4) --[[ line: 94 ]]
	-- upvalues: tabOverlapThreshold (ref), constantsModule (ref), smallFrameHeight (ref), frameHeight_1 (ref), roactModule (ref), clientServerButtonWidth (ref), mainRowPadding (ref), smallUtilPadding (ref), tabDropDownWidth (ref), clientServerDropDownWidth (ref), textService (ref), tabRowContainerModule (ref), clientServerButtonModule (ref), checkboxContainerModule (ref), searchBarModule (ref), frameHeight (ref)
	local windowWidth = p4.props.windowWidth
	local formFactor = p4.props.formFactor
	local tabList = p4.props.tabList
	local orderedCheckboxState = p4.props.orderedCheckboxState
	local layoutOrder = p4.props.layoutOrder
	local isClientView = p4.props.isClientView
	local searchTerm = p4.props.searchTerm
	local onClientButton = p4.props.onClientButton
	local onServerButton = p4.props.onServerButton
	local onCheckboxChanged = p4.props.onCheckboxChanged
	local onSearchTermChanged = p4.props.onSearchTermChanged
	local activeSearchTerm = p4.state.activeSearchTerm
	local var11 = (windowWidth - p4.state.totalTabWidth) / p4.state.totalTabCount < tabOverlapThreshold and windowWidth > 0
	local _ = nil
	local var12 = if formFactor == constantsModule.FormFactor.Small then smallFrameHeight else frameHeight_1
	local var13 = p4.props[roactModule.Children] and math.ceil(#p4.props[roactModule.Children] / 5) or 1
	local frame = roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -(if formFactor == constantsModule.FormFactor.Small then 6 else 7) * clientServerButtonWidth - mainRowPadding, 0, 0),
		Size = UDim2.new(0, 5 * clientServerButtonWidth, 0, var12 * var13)
	}, {
		Layout = roactModule.createElement("UIGridLayout", {
			FillDirectionMaxCells = 5,
			CellPadding = UDim2.new(0, mainRowPadding, 0, 0),
			CellSize = UDim2.new(0, clientServerButtonWidth, 0, var12),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		unpack(p4.props[roactModule.Children] or {})
	})
	
	if formFactor == constantsModule.FormFactor.Small or var11 then
		local var15 = smallFrameHeight * var13 + smallUtilPadding
		
		if activeSearchTerm then
			var15 = var15 + smallFrameHeight + smallUtilPadding
		end
		local onServerButton_1 = onClientButton and onServerButton
		local var17 = windowWidth - smallFrameHeight - tabDropDownWidth
		
		if onServerButton_1 then
			var17 -= clientServerDropDownWidth
		end
		local var18 = textService:GetTextSize("Cancel", constantsModule.DefaultFontSize.UtilBar, constantsModule.Font.UtilBar, Vector2.new(0, 0)).X + 12
		
		return roactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, var15),
			BackgroundTransparency = 1,
			LayoutOrder = layoutOrder,
			[roactModule.Ref] = p4.props.refForParent
		}, {
			MainFrame = roactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, smallFrameHeight),
				BackgroundTransparency = 1,
				[roactModule.Ref] = p4.utilRef
			}, {
				MainRow = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					UIListLayout = roactModule.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, smallUtilPadding)
					}),
					Tabs = roactModule.createElement(tabRowContainerModule, {
						layoutOrder = 1,
						tabList = tabList,
						windowWidth = windowWidth,
						frameHeight = smallFrameHeight,
						formFactor = formFactor
					}),
					ClientServerButton = onServerButton_1 and roactModule.createElement(clientServerButtonModule, {
						layoutOrder = 2,
						frameHeight = smallFrameHeight,
						formFactor = formFactor,
						useDropDown = var11,
						isClientView = isClientView,
						onClientButton = onClientButton,
						onServerButton = onServerButton
					}),
					FilterCheckboxes = onCheckboxChanged and roactModule.createElement(checkboxContainerModule, {
						layoutOrder = 3,
						orderedCheckboxState = orderedCheckboxState,
						frameWidth = var17,
						frameHeight = smallFrameHeight,
						pos = UDim2.new(0, 2 * clientServerButtonWidth + mainRowPadding, 0, 0),
						onCheckboxChanged = onCheckboxChanged
					})
				}),
				SearchButton = roactModule.createElement("ImageButton", {
					Size = UDim2.new(0, smallFrameHeight, 0, smallFrameHeight),
					Position = UDim2.new(1, -smallFrameHeight, 0, 0),
					BackgroundTransparency = 1,
					Image = constantsModule.Image.Search,
					Visible = not activeSearchTerm,
					[roactModule.Event.Activated] = p4.showSearchBar
				}),
				Buttons = frame
			}),
			SearchBarFrame = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, smallFrameHeight),
				Position = UDim2.new(0, 0, 0, (smallFrameHeight + smallUtilPadding) * var13),
				Visible = activeSearchTerm
			}, {
				SearchBar = roactModule.createElement(searchBarModule, {
					size = UDim2.new(1, -var18, 0, smallFrameHeight),
					searchTerm = searchTerm,
					showClear = activeSearchTerm,
					textSize = constantsModule.DefaultFontSize.Search,
					font = constantsModule.Font.Search,
					frameHeight = smallFrameHeight,
					refForParent = p4.searchRef,
					cancelInput = p4.cancelInput,
					focusLost = p4.focusLost
				}),
				CancelButton = roactModule.createElement("TextButton", {
					Size = UDim2.new(0, var18, 1, 0),
					Position = UDim2.new(1, -var18, 0, 0),
					Text = "Cancel",
					TextSize = constantsModule.DefaultFontSize.UtilBar,
					TextColor3 = constantsModule.Color.Text,
					Font = constantsModule.Font.UtilBar,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					[roactModule.Event.Activated] = p4.cancelInput
				})
			})
		})
	else
		local onServerButton_1 = onClientButton and onServerButton
		local var20 = windowWidth - smallUtilPadding * 3 - 3 * clientServerButtonWidth
		
		if onServerButton_1 then
			var20 -= clientServerButtonWidth
		end
		return roactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, frameHeight + frameHeight_1 * var13 + mainRowPadding),
			BackgroundTransparency = 1,
			LayoutOrder = layoutOrder,
			[roactModule.Ref] = p4.props.refForParent
		}, {
			Tabs = roactModule.createElement(tabRowContainerModule, {
				tabList = tabList,
				windowWidth = windowWidth,
				frameHeight = frameHeight,
				formFactor = formFactor
			}),
			UtilBar = roactModule.createElement("Frame", {
				Position = UDim2.new(0, 4, 0, frameHeight + mainRowPadding),
				Size = UDim2.new(1, -8, 0, frameHeight_1),
				BackgroundTransparency = 1,
				[roactModule.Ref] = p4.utilRef
			}, {
				MainRow = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					UIListLayout = roactModule.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, smallUtilPadding)
					}),
					ClientServerButton = onServerButton_1 and roactModule.createElement(clientServerButtonModule, {
						formFactor = formFactor,
						isClientView = isClientView,
						onClientButton = onClientButton,
						onServerButton = onServerButton
					}),
					FilterCheckboxes = onCheckboxChanged and roactModule.createElement(checkboxContainerModule, {
						orderedCheckboxState = orderedCheckboxState,
						frameWidth = var20,
						frameHeight = frameHeight_1,
						pos = UDim2.new(0, 2 * clientServerButtonWidth + mainRowPadding, 0, 0),
						onCheckboxChanged = onCheckboxChanged
					})
				}),
				SearchBar = onSearchTermChanged and roactModule.createElement(searchBarModule, {
					size = UDim2.new(0, 2 * clientServerButtonWidth, 0, frameHeight_1),
					pos = UDim2.new(1, -2 * clientServerButtonWidth, 0, 0),
					searchTerm = searchTerm,
					showClear = activeSearchTerm,
					textSize = constantsModule.DefaultFontSize.Search,
					font = constantsModule.Font.Search,
					frameHeight = constantsModule.UtilityBarFormatting.FrameHeight,
					refForParent = p4.searchRef,
					cancelInput = p4.cancelInput,
					focusLost = p4.focusLost
				}),
				Buttons = frame
			})
		})
	end
end

return utilAndTab