local TextService = game:GetService("TextService")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local FrameHeight = ConstantsModule.TabRowFormatting.FrameHeight
local TabDropDownWidth = ConstantsModule.TabRowFormatting.TabDropDownWidth
local TabOverlapThreshold = ConstantsModule.TabRowFormatting.TabOverlapThreshold
local FrameHeight1 = ConstantsModule.UtilityBarFormatting.FrameHeight
local SmallFrameHeight = ConstantsModule.UtilityBarFormatting.SmallFrameHeight
local SmallUtilPadding = ConstantsModule.UtilityBarFormatting.SmallUtilPadding
local ClientServerButtonWidth = ConstantsModule.UtilityBarFormatting.ClientServerButtonWidth
local ClientServerDropDownWidth = ConstantsModule.UtilityBarFormatting.ClientServerDropDownWidth
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local Parent = script.Parent
local ClientServerButtonModule = require(Parent.ClientServerButton)
local CheckboxContainerModule = require(Parent.CheckboxContainer)
local TabRowContainerModule = require(Parent.TabRowContainer)
local SearchBarModule = require(Parent.SearchBar)
local GetFFlagVoiceDebugConsoleV2Module = require(Parent.VoiceDebug.GetFFlagVoiceDebugConsoleV2)
local UtilAndTab = RoactModule.Component:extend("UtilAndTab")

function UtilAndTab.init(p1) --[[ Line: 30 ]]
	-- upvalues: TextService (copy), ConstantsModule (copy), RoactModule (copy)
	local NewX = 0
	local TotalTabCount = 0
	
	for i, _ in pairs(p1.props.tabList) do
		NewX += TextService:GetTextSize(i, ConstantsModule.DefaultFontSize.TabBar, ConstantsModule.Font.TabBar, Vector2.new(0, 0)).X
		TotalTabCount += 1
	end
	function p1.showSearchBar() --[[ Line: 42 ]]
		-- upvalues: p1 (copy)
		p1:setState({ activeSearchTerm = true })
	end
	
	function p1:cancelInput(Input) --[[ Line: 48 ]]
		-- upvalues: p1 (copy)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch and Input.UserInputState == Enum.UserInputState.End then
			if p1.searchRef.current then
				p1.searchRef.current.Text = ""
			end
			local OnSearchTermChangedFunction: (any) -> () = p1.props.onSearchTermChanged
			
			if OnSearchTermChangedFunction then
				OnSearchTermChangedFunction("")
			end
			p1:setState({ activeSearchTerm = false })
		end
	end
	
	function p1.focusLost(p2, p3, _) --[[ Line: 69 ]]
		-- upvalues: p1 (copy)
		if p3 then
			local Text = p2.text
			local OnSearchTermChangedFunction: (any) -> () = p1.props.onSearchTermChanged
			
			if OnSearchTermChangedFunction then
				OnSearchTermChangedFunction(Text)
			end
			local IsNotTextMatch = Text ~= ""
			
			if p1.state.activeSearchTerm ~= IsNotTextMatch then
				p1:setState({ activeSearchTerm = IsNotTextMatch })
			end
		end
	end
	
	p1.state = {
		activeSearchTerm = false,
		totalTabWidth = NewX,
		totalTabCount = TotalTabCount
	}
	p1.utilRef = RoactModule.createRef()
	p1.searchRef = RoactModule.createRef()
end

function UtilAndTab.render(p2) --[[ Line: 95 ]]
	-- upvalues: TabOverlapThreshold (copy), ConstantsModule (copy), SmallFrameHeight (copy), FrameHeight1 (copy), RoactModule (copy), ClientServerButtonWidth (copy), MainRowPadding (copy), SmallUtilPadding (copy), TabDropDownWidth (copy), ClientServerDropDownWidth (copy), TextService (copy), TabRowContainerModule (copy), ClientServerButtonModule (copy), CheckboxContainerModule (copy), GetFFlagVoiceDebugConsoleV2Module (copy), SearchBarModule (copy), FrameHeight (copy)
	local WindowWidth: number = p2.props.windowWidth
	local FormFactor = p2.props.formFactor
	local TabList = p2.props.tabList
	local OrderedCheckboxState = p2.props.orderedCheckboxState
	local LayoutOrder = p2.props.layoutOrder
	local IsClientView = p2.props.isClientView
	local SearchTerm = p2.props.searchTerm
	local OnClientButton = p2.props.onClientButton
	local OnServerButton = p2.props.onServerButton
	local OnCheckboxChanged = p2.props.onCheckboxChanged
	local OnSearchTermChanged = p2.props.onSearchTermChanged
	local ActiveSearchTerm = p2.state.activeSearchTerm
	local IsWindowWidthAbove: boolean = (WindowWidth - p2.state.totalTabWidth) / p2.state.totalTabCount < TabOverlapThreshold and WindowWidth > 0
	local SmallFrameHeight1 = FormFactor == ConstantsModule.FormFactor.Small and SmallFrameHeight or FrameHeight1
	local Ceiled: number = p2.props[RoactModule.Children] and math.ceil(#p2.props[RoactModule.Children] / 5) or 1
	local Frame = RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -(if FormFactor == ConstantsModule.FormFactor.Small then 6 else 7) * ClientServerButtonWidth - MainRowPadding, 0, 0),
		Size = UDim2.new(0, 5 * ClientServerButtonWidth, 0, SmallFrameHeight1 * Ceiled)
	}, {
		Layout = RoactModule.createElement("UIGridLayout", {
			FillDirectionMaxCells = 5,
			CellPadding = UDim2.new(0, MainRowPadding, 0, 0),
			CellSize = UDim2.new(0, ClientServerButtonWidth, 0, SmallFrameHeight1),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		unpack(p2.props[RoactModule.Children] or {})
	})
	
	if FormFactor == ConstantsModule.FormFactor.Small or IsWindowWidthAbove then
		local NewSmallFrameHeight = SmallFrameHeight * Ceiled + SmallUtilPadding
		
		if ActiveSearchTerm then
			NewSmallFrameHeight = NewSmallFrameHeight + SmallFrameHeight + SmallUtilPadding
		end
		local OnServerButton2 = OnClientButton and OnServerButton
		local WindowWidthDelta1 = WindowWidth - SmallFrameHeight - TabDropDownWidth
		
		if OnServerButton2 then
			WindowWidthDelta1 -= ClientServerDropDownWidth
		end
		local NewX = TextService:GetTextSize("Cancel", ConstantsModule.DefaultFontSize.UtilBar, ConstantsModule.Font.UtilBar, Vector2.new(0, 0)).X + 12
		
		return RoactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, NewSmallFrameHeight),
			BackgroundTransparency = 1,
			LayoutOrder = LayoutOrder,
			[RoactModule.Ref] = p2.props.refForParent
		}, {
			MainFrame = RoactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, SmallFrameHeight),
				BackgroundTransparency = 1,
				[RoactModule.Ref] = p2.utilRef
			}, {
				MainRow = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, SmallUtilPadding)
					}),
					Tabs = RoactModule.createElement(TabRowContainerModule, {
						layoutOrder = 1,
						tabList = TabList,
						windowWidth = WindowWidth,
						frameHeight = SmallFrameHeight,
						formFactor = FormFactor
					}),
					ClientServerButton = OnServerButton2 and RoactModule.createElement(ClientServerButtonModule, {
						layoutOrder = 2,
						frameHeight = SmallFrameHeight,
						formFactor = FormFactor,
						useDropDown = IsWindowWidthAbove,
						isClientView = IsClientView,
						onClientButton = OnClientButton,
						onServerButton = OnServerButton
					}),
					FilterCheckboxes = OnCheckboxChanged and RoactModule.createElement(CheckboxContainerModule, {
						layoutOrder = 3,
						orderedCheckboxState = OrderedCheckboxState,
						frameWidth = WindowWidthDelta1,
						frameHeight = SmallFrameHeight,
						pos = UDim2.new(0, 2 * ClientServerButtonWidth + MainRowPadding, 0, 0),
						onCheckboxChanged = OnCheckboxChanged
					})
				}),
				SearchButton = RoactModule.createElement("ImageButton", {
					Size = UDim2.new(0, SmallFrameHeight, 0, SmallFrameHeight),
					Position = UDim2.new(1, -SmallFrameHeight, 0, 0),
					BackgroundTransparency = 1,
					Image = ConstantsModule.Image.Search,
					Visible = not ActiveSearchTerm,
					[RoactModule.Event.Activated] = p2.showSearchBar
				}),
				Buttons = Frame,
				ExtraContent = if GetFFlagVoiceDebugConsoleV2Module() then p2.props.extraContent else nil
			}),
			SearchBarFrame = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, SmallFrameHeight),
				Position = UDim2.new(0, 0, 0, (SmallFrameHeight + SmallUtilPadding) * Ceiled),
				Visible = ActiveSearchTerm
			}, {
				SearchBar = RoactModule.createElement(SearchBarModule, {
					size = UDim2.new(1, -NewX, 0, SmallFrameHeight),
					searchTerm = SearchTerm,
					showClear = ActiveSearchTerm,
					textSize = ConstantsModule.DefaultFontSize.Search,
					font = ConstantsModule.Font.Search,
					frameHeight = SmallFrameHeight,
					refForParent = p2.searchRef,
					cancelInput = p2.cancelInput,
					focusLost = p2.focusLost
				}),
				CancelButton = RoactModule.createElement("TextButton", {
					Size = UDim2.new(0, NewX, 1, 0),
					Position = UDim2.new(1, -NewX, 0, 0),
					Text = "Cancel",
					TextSize = ConstantsModule.DefaultFontSize.UtilBar,
					TextColor3 = ConstantsModule.Color.Text,
					Font = ConstantsModule.Font.UtilBar,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					[RoactModule.Event.Activated] = p2.cancelInput
				})
			})
		})
	else
		local OnServerButton1 = OnClientButton and OnServerButton
		local WindowWidthDelta = WindowWidth - SmallUtilPadding * 3 - 3 * ClientServerButtonWidth
		
		if OnServerButton1 then
			WindowWidthDelta -= ClientServerButtonWidth
		end
		return RoactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, FrameHeight + FrameHeight1 * Ceiled + MainRowPadding),
			BackgroundTransparency = 1,
			LayoutOrder = LayoutOrder,
			[RoactModule.Ref] = p2.props.refForParent
		}, {
			Tabs = RoactModule.createElement(TabRowContainerModule, {
				tabList = TabList,
				windowWidth = WindowWidth,
				frameHeight = FrameHeight,
				formFactor = FormFactor
			}),
			UtilBar = RoactModule.createElement("Frame", {
				Position = UDim2.new(0, 4, 0, FrameHeight + MainRowPadding),
				Size = UDim2.new(1, -8, 0, FrameHeight1),
				BackgroundTransparency = 1,
				[RoactModule.Ref] = p2.utilRef
			}, {
				MainRow = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, SmallUtilPadding)
					}),
					ClientServerButton = OnServerButton1 and RoactModule.createElement(ClientServerButtonModule, {
						formFactor = FormFactor,
						isClientView = IsClientView,
						onClientButton = OnClientButton,
						onServerButton = OnServerButton
					}),
					FilterCheckboxes = OnCheckboxChanged and RoactModule.createElement(CheckboxContainerModule, {
						orderedCheckboxState = OrderedCheckboxState,
						frameWidth = WindowWidthDelta,
						frameHeight = FrameHeight1,
						pos = UDim2.new(0, 2 * ClientServerButtonWidth + MainRowPadding, 0, 0),
						onCheckboxChanged = OnCheckboxChanged
					})
				}),
				SearchBar = OnSearchTermChanged and RoactModule.createElement(SearchBarModule, {
					size = UDim2.new(0, 2 * ClientServerButtonWidth, 0, FrameHeight1),
					pos = UDim2.new(1, -2 * ClientServerButtonWidth, 0, 0),
					searchTerm = SearchTerm,
					showClear = ActiveSearchTerm,
					textSize = ConstantsModule.DefaultFontSize.Search,
					font = ConstantsModule.Font.Search,
					frameHeight = ConstantsModule.UtilityBarFormatting.FrameHeight,
					refForParent = p2.searchRef,
					cancelInput = p2.cancelInput,
					focusLost = p2.focusLost
				}),
				Buttons = Frame,
				ExtraContent = if GetFFlagVoiceDebugConsoleV2Module() then p2.props.extraContent else nil
			})
		})
	end
end

return UtilAndTab