local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
local Components = script.Parent.Parent.Parent.Components
local BannerButtonModule = require(Components.BannerButton)
local BoxButtonModule = require(Components.BoxButton)
local CellCheckboxModule = require(Components.CellCheckbox)
local CellLabelModule = require(Components.CellLabel)
local DataConsumerModule = require(Components.DataConsumer)
local DropDownModule = require(Components.DropDown)
local HeaderButtonModule = require(Components.HeaderButton)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local GeneralFormatting = ConstantsModule.GeneralFormatting
local LineWidth = GeneralFormatting.LineWidth
local LineColor = GeneralFormatting.LineColor
local DebugVisualizationsFormatting = ConstantsModule.DebugVisualizationsFormatting
local ChartHeaderNames = DebugVisualizationsFormatting.ChartHeaderNames
local ChartCellWidths = DebugVisualizationsFormatting.ChartCellWidths
local HeaderFrameHeight = DebugVisualizationsFormatting.HeaderFrameHeight
local EntryFrameHeight = DebugVisualizationsFormatting.EntryFrameHeight
local CellPadding = DebugVisualizationsFormatting.CellPadding
local MinFrameWidth = DebugVisualizationsFormatting.MinFrameWidth
local LearnMoreWidth = DebugVisualizationsFormatting.LearnMoreWidth
local MainWindow = ConstantsModule.DefaultFontSize.MainWindow
local MainWindow1 = ConstantsModule.Font.MainWindow
local SlimDevConsole2 = game:DefineFastFlag("SlimDevConsole2", false)
local TextService = SlimDevConsole2 and game:GetService("TextService") or nil

local function _(p1, p2): number
	-- upvalues: LearnMoreWidth (copy), CellPadding (copy)
	return if p2 == nil then p1 - CellPadding * 2 else p1 - LearnMoreWidth - CellPadding * 2
end

local _ = function(String1, X): number
	-- upvalues: TextService (copy), MainWindow (copy), MainWindow1 (copy), EntryFrameHeight (copy)
	return (math.max(TextService:GetTextSize(String1, MainWindow, MainWindow1, Vector2.new(X, 1e999)).Y, EntryFrameHeight))
end

local Total = 0

for _, chartCellWidth in ipairs(ChartCellWidths) do
	Total += chartCellWidth
end
local List = {}
local List1 = {}
local List2 = {}
local Total1 = -Total / 2
table.insert(List, UDim2.fromOffset(CellPadding, 0))
table.insert(List1, UDim2.new(0.5, Total1 - CellPadding, 0, HeaderFrameHeight))
table.insert(List2, UDim2.new(0.5, Total1 - CellPadding, 0, EntryFrameHeight))

for _, chartCellWidth1 in ipairs(ChartCellWidths) do
	table.insert(List, UDim2.new(0.5, Total1 + CellPadding, 0, 0))
	table.insert(List1, UDim2.fromOffset(chartCellWidth1 - CellPadding, HeaderFrameHeight))
	table.insert(List2, UDim2.fromOffset(chartCellWidth1 - CellPadding, EntryFrameHeight))
	Total1 += chartCellWidth1
end
table.insert(List, UDim2.new(0.5, Total1 + CellPadding, 0, 0))
table.insert(List1, UDim2.new(0.5, -Total / 2 - CellPadding, 0, HeaderFrameHeight))
table.insert(List2, UDim2.new(0.5, -Total / 2 - CellPadding, 0, EntryFrameHeight))
assert(#ChartCellWidths == 2, "DebugVisualizationsChart expected DebugVisualizationsFormatting CELL_WIDTHS to have a length of 2")
assert(#List == 4, "DebugVisualizationsChart expected cellOffset to have length " .. 4)
assert(#List1 == 4, "DebugVisualizationsChart expected headerCellSize to have length " .. 4)
assert(#List2 == 4, "DebugVisualizationsChart expected entryCellSize to have length " .. 4)
local t = {}

for i, Vector in ipairs(List) do
	t[i] = UDim2.new(Vector.X.Scale, Vector.X.Offset - CellPadding, Vector.Y.Scale, Vector.Y.Offset)
end
local DebugVisualizationsChart = RoactModule.Component:extend("DebugVisualizationsChart")

local function constructHeader(Sortfunction, XOffset)
	-- upvalues: ChartHeaderNames (copy), RoactModule (copy), HeaderButtonModule (copy), List1 (copy), List (copy), LineWidth (copy), LineColor (copy), t (copy), HeaderFrameHeight (copy)
	local Elements = {}
	
	for i, chartHeaderName in ipairs(ChartHeaderNames) do
		Elements[chartHeaderName] = RoactModule.createElement(HeaderButtonModule, {
			text = chartHeaderName,
			size = List1[i],
			pos = List[i],
			sortfunction = Sortfunction
		})
	end
	Elements.upperHorizontalLine = RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, LineWidth),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = LineColor
	})
	Elements.lowerHorizontalLine = RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, LineWidth),
		Position = UDim2.new(0, 0, 1, -LineWidth),
		BackgroundColor3 = LineColor
	})
	
	for i1 = 2, #t do
		Elements[string.format("VerticalLine_%d", i1)] = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, LineWidth, 1, 0),
			Position = t[i1],
			BackgroundColor3 = LineColor
		})
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, XOffset, 0, HeaderFrameHeight)
	}, Elements)
end

local function constructEntry(p1, XOffset, YOffset1, YOffset, LayoutOrder, IsExpanded, Callback, Callback1)
	-- upvalues: t (copy), RoactModule (copy), LineWidth (copy), LineColor (copy), CellLabelModule (copy), List2 (copy), List (copy), SlimDevConsole2 (copy), DropDownModule (copy), CellPadding (copy), EntryFrameHeight (copy), CellCheckboxModule (copy), LearnMoreWidth (copy), BannerButtonModule (copy), BoxButtonModule (copy)
	local Name = p1.name
	local SettingInfo = p1.settingInfo
	local Text = tostring(SettingInfo.Name)
	local Elements = {}
	
	for i = 2, #t do
		Elements[string.format("line_%d", i)] = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, LineWidth, 1, 0),
			Position = t[i],
			BackgroundColor3 = LineColor
		})
	end
	Elements[Name] = RoactModule.createElement(CellLabelModule, { text = Text, size = List2[1], pos = List[1] })
	
	if SlimDevConsole2 and SettingInfo.Kind == "Dropdown" then
		local EnumItems = SettingInfo.EnumItems
		local SelectedIndex = 1
		
		for i1, enumItem in ipairs(EnumItems) do
			if enumItem == SettingInfo.Value then
				SelectedIndex = i1
				break
			end
		end
		Elements.checkbox = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = List2[2],
			Position = List[2]
		}, {
			DropDown = RoactModule.createElement(DropDownModule, {
				buttonSize = UDim2.new(1, -CellPadding, 0, EntryFrameHeight - 8),
				position = UDim2.new(0, 0, 0, 4),
				dropDownList = SettingInfo.DropDownList,
				selectedIndex = SelectedIndex,
				onSelection = function(p2)
					-- upvalues: p1 (copy), Text (copy), EnumItems (copy)
					p1.valueChangeCallback(Text, EnumItems[p2])
				end
			})
		})
	else
		Elements.checkbox = RoactModule.createElement(CellCheckboxModule, {
			name = Text,
			isSelected = SettingInfo.Value,
			size = List2[2],
			pos = List[2],
			OnCheckboxClicked = p1.valueChangeCallback
		})
	end
	Elements.visualType = RoactModule.createElement(CellLabelModule, { text = SettingInfo.Type, size = List2[3], pos = List[3] })
	Elements.tags = RoactModule.createElement(CellLabelModule, {
		text = tostring(SettingInfo.Tagstring),
		size = List2[4],
		pos = List[4]
	})
	Elements.lowerHorizontalLine = RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, LineWidth),
		Position = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = LineColor
	})
	local LearnMoreUrl = nil
	local _UDim2 = nil
	local HasLearnMoreUrl = nil
	
	if SlimDevConsole2 then
		LearnMoreUrl = SettingInfo.LearnMoreUrl
		HasLearnMoreUrl = LearnMoreUrl ~= nil
		_UDim2 = UDim2.new(0, if LearnMoreUrl == nil then XOffset - CellPadding * 2 else XOffset - LearnMoreWidth - CellPadding * 2, 0, YOffset)
	else
		HasLearnMoreUrl = true
		_UDim2 = UDim2.new(0, XOffset - LearnMoreWidth - CellPadding * 2, 0, EntryFrameHeight)
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, XOffset, 0, YOffset1),
		LayoutOrder = LayoutOrder
	}, {
		Button = RoactModule.createElement(BannerButtonModule, {
			size = UDim2.new(1, 0, 0, EntryFrameHeight),
			pos = UDim2.new(),
			isExpanded = IsExpanded,
			onButtonPress = Callback(Name)
		}, Elements),
		DescriptionText = IsExpanded and RoactModule.createElement(CellLabelModule, {
			pos = UDim2.new(0, CellPadding, 0, EntryFrameHeight + CellPadding),
			size = _UDim2,
			text = tostring(SettingInfo.Description)
		}),
		LearnMoreButton = IsExpanded and (HasLearnMoreUrl and RoactModule.createElement(BoxButtonModule, {
			text = "Learn More",
			size = UDim2.new(0, LearnMoreWidth, 0, EntryFrameHeight),
			pos = UDim2.new(0, XOffset - LearnMoreWidth - CellPadding, 0, EntryFrameHeight + CellPadding),
			onClicked = if SlimDevConsole2 then Callback1(Name, LearnMoreUrl) else Callback1(Name)
		}))
	})
end

function populateEntries(Text, List, List1, p2, p3, p4, p5, Name, p6, p7)
	-- upvalues: RoactModule (copy), EntryFrameHeight (copy), SlimDevConsole2 (copy), LearnMoreWidth (copy), CellPadding (copy), TextService (copy), MainWindow (copy), MainWindow1 (copy), constructEntry (copy), LineColor (copy)
	local config = {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local List2 = {}
	
	for i, value in pairs(List) do
		if value then
			table.insert(List2, i)
		end
	end
	local CountList1 = #List1
	local Total = 0
	
	if p4 and p3 then
		local YOffset = -1
		local Total1 = 0
		local Count = 0
		local Flag = nil
		
		for i1, value1 in ipairs(List1) do
			local HasFoundAt: boolean = if Text then string.find(tostring(value1.settingInfo.Name):lower(), Text:lower()) ~= nil or string.find(value1.name:lower(), Text:lower()) ~= nil else false
			
			if #List2 > 0 then
				Flag = false
				
				for _, value2 in pairs(List2) do
					if table.find(value1.settingInfo.Tags, value2) ~= nil then
						Flag = true
						break
					end
				end
				if Text then
					HasFoundAt = HasFoundAt and Flag
				else
					Text = true
					HasFoundAt = Flag
				end
			end
			if not Text or HasFoundAt then
				local IsNameMatch = Name == value1.name
				local Largest: number = EntryFrameHeight
				local NewEntryFrameHeight = nil
				
				if SlimDevConsole2 then
					if IsNameMatch then
						Largest = math.max(TextService:GetTextSize(tostring(value1.settingInfo.Description), MainWindow, MainWindow1, Vector2.new(if value1.settingInfo.LearnMoreUrl == nil then p5 - CellPadding * 2 else p5 - LearnMoreWidth - CellPadding * 2, 1e999)).Y, EntryFrameHeight)
						NewEntryFrameHeight = EntryFrameHeight + Largest + CellPadding * 2
					else
						NewEntryFrameHeight = EntryFrameHeight
					end
				else
					NewEntryFrameHeight = IsNameMatch and EntryFrameHeight * 2 + CellPadding * 2 or EntryFrameHeight
				end
				if p3.Y <= Total + EntryFrameHeight then
					if Total1 < p4.Y then
						config[i1] = constructEntry(value1, p5, NewEntryFrameHeight, Largest, (p2 and CountList1 - i1 or i1) + 1, IsNameMatch, p6, p7)
					end
					if YOffset < 0 then
						YOffset = Total
					else
						Total1 += EntryFrameHeight
					end
					Count += 1
				end
				Total += NewEntryFrameHeight
			end
		end
		if Count == 0 then
			config.NoneFound = RoactModule.createElement("TextLabel", {
				Text = "No DebugVisualizations Found",
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.fromScale(1, 1),
				TextColor3 = LineColor
			})
		else
			config.WindowingPadding = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, YOffset)
			})
		end
	end
	return config, Total
end

function DebugVisualizationsChart.init(p8, p9)
	-- upvalues: LinkingProtocol (copy), SlimDevConsole2 (copy), RoactModule (copy)
	local CurrentData = p9.DebugVisualizationsData:getCurrentData()
	
	function p8.getOnButtonPress(ExpandedEntry)
		-- upvalues: p8 (copy)
		return function(_, _)
			-- upvalues: p8 (upval), ExpandedEntry (copy)
			p8:setState({
				expandedEntry = p8.state.expandedEntry ~= ExpandedEntry and ExpandedEntry
			})
		end
	end
	
	function p8.getLearnMorePress(p10, p11)
		-- upvalues: LinkingProtocol (upval), SlimDevConsole2 (upval)
		return function(_, _)
			-- upvalues: LinkingProtocol (upval), SlimDevConsole2 (upval), p11 (copy), p10 (copy)
			LinkingProtocol.default:openURL(if SlimDevConsole2 then p11 else "https://create.roblox.com/docs/reference/engine/classes/PhysicsSettings#" .. p10)
		end
	end
	
	function p8.onSortChanged(SortType)
		-- upvalues: p9 (copy), p8 (copy)
		if SortType == p9.DebugVisualizationsData:getSortType() then
			p8:setState(function(p10)
				return { reverseSort = not p10.reverseSort }
			end)
			
			return
		else
			p9.DebugVisualizationsData:setSortType(SortType)
			p8:setState({ reverseSort = false })
		end
	end
	
	function p8.onCanvasPosChanged()
		-- upvalues: p8 (copy)
		p8:setState({ canvasPos = p8.scrollingRef.current.CanvasPosition })
	end
	
	p8.scrollingRef = RoactModule.createRef()
	p8.state = {
		reverseSort = false,
		expandedEntry = nil,
		visualizationEntries = CurrentData
	}
end

function DebugVisualizationsChart.didUpdate(p8)
	if p8.scrollingRef.current then
		local AbsoluteSize = p8.scrollingRef.current.AbsoluteSize
		
		if AbsoluteSize ~= p8.state.absScrollSize then
			p8:setState({ absScrollSize = AbsoluteSize })
		end
	end
end

function DebugVisualizationsChart.didMount(p8)
	p8.visualizationsUpdated = p8.props.DebugVisualizationsData:Signal():Connect(function(VisualizationEntries)
		-- upvalues: p8 (copy)
		p8:setState({ visualizationEntries = VisualizationEntries })
	end)
	
	if p8.scrollingRef.current then
		p8.canvasPosConnector = p8.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p8.onCanvasPosChanged)
		p8:setState({
			absScrollSize = p8.scrollingRef.current.AbsoluteSize,
			canvasPos = p8.scrollingRef.current.CanvasPosition
		})
	end
end

function DebugVisualizationsChart.willUnmount(p8)
	p8.visualizationsUpdated:Disconnect()
	p8.visualizationsUpdated = nil
	p8.canvasPosConnector:Disconnect()
	p8.canvasPosConnector = nil
end

function DebugVisualizationsChart.render(p8)
	-- upvalues: MinFrameWidth (copy), RoactModule (copy), constructHeader (copy), HeaderFrameHeight (copy), ConstantsModule (copy)
	local AbsScrollSize = p8.state.absScrollSize
	local Largest = AbsScrollSize and math.max(AbsScrollSize.X, MinFrameWidth) or MinFrameWidth
	local PopulateEntriesResult, PopulateEntriesResult2 = populateEntries(p8.props.searchTerm, p8.props.typeFilters, p8.state.visualizationEntries, p8.state.reverseSort, p8.state.canvasPos, AbsScrollSize, Largest, p8.state.expandedEntry, p8.getOnButtonPress, p8.getLearnMorePress)
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = p8.props.size,
		LayoutOrder = p8.props.layoutOrder
	}, {
		Header = constructHeader(p8.onSortChanged, Largest),
		MainChart = RoactModule.createElement("ScrollingFrame", {
			Position = UDim2.fromOffset(0, HeaderFrameHeight),
			Size = UDim2.new(1, 0, 1, -HeaderFrameHeight),
			CanvasSize = UDim2.fromOffset(Largest, PopulateEntriesResult2),
			ScrollBarThickness = 6,
			BackgroundColor3 = ConstantsModule.Color.BaseGray,
			BackgroundTransparency = 1,
			[RoactModule.Ref] = p8.scrollingRef
		}, PopulateEntriesResult)
	})
end

return DataConsumerModule(DebugVisualizationsChart, "DebugVisualizationsData")