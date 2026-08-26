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

function utilAndTab.init(p1)
	-- upvalues: textService (ref), constantsModule (ref), roactModule (ref)
	local tabList = p1.props.tabList
	local var1 = 0
	local var2 = 0
	
	for i, v in pairs(tabList) do
		var1 += textService:GetTextSize(i, constantsModule.DefaultFontSize.TabBar, constantsModule.Font.TabBar, Vector2.new(0, 0)).X
		var2 += 1
	end
	function p0.showSearchBar()
		-- upvalues: p1 (ref)
		p1:setState({ activeSearchTerm = true })
	end
	
	function p0.cancelInput(_, p2)
		-- upvalues: p1 (ref)
		if p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch and p2.UserInputState == Enum.UserInputState.End then
			if p1.searchRef.current then
				p1.searchRef.current.Text = ""
			end
			local onSearchTermChanged = p1.props.onSearchTermChanged
			
			if onSearchTermChanged then
				onSearchTermChanged("")
			end
			p1:setState({ activeSearchTerm = false })
		end
	end
	
	function p0.focusLost(p2, p3, _)
		-- upvalues: p1 (ref)
		if p3 then
			local text = p2.text
			local onSearchTermChanged = p1.props.onSearchTermChanged
			
			if onSearchTermChanged then
				onSearchTermChanged(text)
			end
			local var3 = text ~= ""
			
			if p1.state.activeSearchTerm ~= var3 then
				p1:setState({ activeSearchTerm = var3 })
			end
		end
	end
	
	p1.state = {
		activeSearchTerm = false,
		totalTabWidth = var1,
		totalTabCount = var2
	}
	p1.utilRef = roactModule.createRef()
	p1.searchRef = roactModule.createRef()
end

function utilAndTab.render(p2)
	-- upvalues: tabOverlapThreshold (ref), constantsModule (ref), smallFrameHeight (ref), frameHeight_1 (ref), roactModule (ref), clientServerButtonWidth (ref), mainRowPadding (ref), smallUtilPadding (ref), tabDropDownWidth (ref), clientServerDropDownWidth (ref), textService (ref), tabRowContainerModule (ref), clientServerButtonModule (ref), checkboxContainerModule (ref), searchBarModule (ref), frameHeight (ref)
	local windowWidth = p2.props.windowWidth
	local formFactor = p2.props.formFactor
	local tabList = p2.props.tabList
	local orderedCheckboxState = p2.props.orderedCheckboxState
	local layoutOrder = p2.props.layoutOrder
	local isClientView = p2.props.isClientView
	local searchTerm = p2.props.searchTerm
	local onClientButton = p2.props.onClientButton
	local onServerButton = p2.props.onServerButton
	local onCheckboxChanged = p2.props.onCheckboxChanged
	local onSearchTermChanged = p2.props.onSearchTermChanged
	local activeSearchTerm = p2.state.activeSearchTerm
	local var3 = (windowWidth - p2.state.totalTabWidth) / p2.state.totalTabCount < tabOverlapThreshold and windowWidth > 0
	local _ = nil
	local var4 = if formFactor == constantsModule.FormFactor.Small then smallFrameHeight else frameHeight_1
	local var5 = p2.props[roactModule.Children] and math.ceil(#p2.props[roactModule.Children] / 5) or 1
	local frame = roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -(if formFactor == constantsModule.FormFactor.Small then 6 else 7) * clientServerButtonWidth - mainRowPadding, 0, 0),
		Size = UDim2.new(0, 5 * clientServerButtonWidth, 0, var4 * var5)
	}, {
		Layout = roactModule.createElement("UIGridLayout", {
			FillDirectionMaxCells = 5,
			CellPadding = UDim2.new(0, mainRowPadding, 0, 0),
			CellSize = UDim2.new(0, clientServerButtonWidth, 0, var4),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		unpack(p2.props[roactModule.Children] or {})
	})
	
	if formFactor == constantsModule.FormFactor.Small or var3 then
		local var6 = smallFrameHeight * var5 + smallUtilPadding
		
		if activeSearchTerm then
			var6 = var6 + smallFrameHeight + smallUtilPadding
		end
		local onServerButton_1 = onClientButton and onServerButton
		local var7 = windowWidth - smallFrameHeight - tabDropDownWidth
		
		if onServerButton_1 then
			var7 -= clientServerDropDownWidth
		end
		local var8 = textService:GetTextSize("Cancel", constantsModule.DefaultFontSize.UtilBar, constantsModule.Font.UtilBar, Vector2.new(0, 0)).X + 12
		
		return roactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, var6),
			BackgroundTransparency = 1,
			LayoutOrder = layoutOrder,
			[roactModule.Ref] = p2.props.refForParent
		}, {
			MainFrame = roactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, smallFrameHeight),
				BackgroundTransparency = 1,
				[roactModule.Ref] = p2.utilRef
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
						useDropDown = var3,
						isClientView = isClientView,
						onClientButton = onClientButton,
						onServerButton = onServerButton
					}),
					FilterCheckboxes = onCheckboxChanged and roactModule.createElement(checkboxContainerModule, {
						layoutOrder = 3,
						orderedCheckboxState = orderedCheckboxState,
						frameWidth = var7,
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
					[roactModule.Event.Activated] = p2.showSearchBar
				}),
				Buttons = frame
			}),
			SearchBarFrame = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, smallFrameHeight),
				Position = UDim2.new(0, 0, 0, (smallFrameHeight + smallUtilPadding) * var5),
				Visible = activeSearchTerm
			}, {
				SearchBar = roactModule.createElement(searchBarModule, {
					size = UDim2.new(1, -var8, 0, smallFrameHeight),
					searchTerm = searchTerm,
					showClear = activeSearchTerm,
					textSize = constantsModule.DefaultFontSize.Search,
					font = constantsModule.Font.Search,
					frameHeight = smallFrameHeight,
					refForParent = p2.searchRef,
					cancelInput = p2.cancelInput,
					focusLost = p2.focusLost
				}),
				CancelButton = roactModule.createElement("TextButton", {
					Size = UDim2.new(0, var8, 1, 0),
					Position = UDim2.new(1, -var8, 0, 0),
					Text = "Cancel",
					TextSize = constantsModule.DefaultFontSize.UtilBar,
					TextColor3 = constantsModule.Color.Text,
					Font = constantsModule.Font.UtilBar,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					[roactModule.Event.Activated] = p2.cancelInput
				})
			})
		})
	else
		local onServerButton_1 = onClientButton and onServerButton
		local var9 = windowWidth - smallUtilPadding * 3 - 3 * clientServerButtonWidth
		
		if onServerButton_1 then
			var9 -= clientServerButtonWidth
		end
		return roactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, frameHeight + frameHeight_1 * var5 + mainRowPadding),
			BackgroundTransparency = 1,
			LayoutOrder = layoutOrder,
			[roactModule.Ref] = p2.props.refForParent
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
				[roactModule.Ref] = p2.utilRef
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
						frameWidth = var9,
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
					refForParent = p2.searchRef,
					cancelInput = p2.cancelInput,
					focusLost = p2.focusLost
				}),
				Buttons = frame
			})
		})
	end
end

return utilAndTab