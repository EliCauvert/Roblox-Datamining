local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local FixActionBindingSecurity = game:DefineFastFlag("FixActionBindingSecurity", false)
local Components = script.Parent.Parent.Parent.Components
local DataConsumerModule = require(Components.DataConsumer)
local HeaderButtonModule = require(Components.HeaderButton)
local CellLabelModule = require(Components.CellLabel)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local GeneralFormatting = ConstantsModule.GeneralFormatting
local LineWidth = GeneralFormatting.LineWidth
local LineColor = GeneralFormatting.LineColor
local ActionBindingsFormatting = ConstantsModule.ActionBindingsFormatting
local ChartHeaderNames = ActionBindingsFormatting.ChartHeaderNames
local ChartCellWidths = ActionBindingsFormatting.ChartCellWidths
local HeaderFrameHeight = ActionBindingsFormatting.HeaderFrameHeight
local EntryFrameHeight = ActionBindingsFormatting.EntryFrameHeight
local CellPadding = ActionBindingsFormatting.CellPadding
local MinFrameWidth = ActionBindingsFormatting.MinFrameWidth
local Total = 0

for _, chartCellWidth in ipairs(ChartCellWidths) do
	Total += chartCellWidth
end
local List = {}
local List1 = {}
local List2 = {}
local Total1 = -Total / 2
table.insert(List, UDim2.new(0, CellPadding, 0, 0))
table.insert(List1, UDim2.new(0.5, Total1 - CellPadding, 0, HeaderFrameHeight))
table.insert(List2, UDim2.new(0.5, Total1 - CellPadding, 0, EntryFrameHeight))

for _, chartCellWidth1 in ipairs(ChartCellWidths) do
	table.insert(List, UDim2.new(0.5, Total1 + CellPadding, 0, 0))
	table.insert(List1, UDim2.new(0, chartCellWidth1 - CellPadding, 0, HeaderFrameHeight))
	table.insert(List2, UDim2.new(0, chartCellWidth1 - CellPadding, 0, EntryFrameHeight))
	Total1 += chartCellWidth1
end
table.insert(List, UDim2.new(0.5, Total1 + CellPadding, 0, 0))
table.insert(List1, UDim2.new(0.5, -Total / 2 - CellPadding, 0, HeaderFrameHeight))
table.insert(List2, UDim2.new(0.5, -Total / 2 - CellPadding, 0, EntryFrameHeight))
local t = {}

for i, Vector in ipairs(List) do
	t[i] = UDim2.new(Vector.X.Scale, Vector.X.Offset - CellPadding, Vector.Y.Scale, Vector.Y.Offset)
end
local ActionBindingsChart = RoactModule.Component:extend("ActionBindingsChart")

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

local function constructEntry(p1, XOffset, LayoutOrder)
	-- upvalues: FixActionBindingSecurity (copy), t (copy), RoactModule (copy), LineWidth (copy), LineColor (copy), CellLabelModule (copy), List2 (copy), List (copy), EntryFrameHeight (copy)
	local Name = p1.name
	local ActionInfo = p1.actionInfo
	local Text = tostring(ActionInfo.inputTypes[1])
	local Core: string = if FixActionBindingSecurity then if ActionInfo.isCore then "Core" else "Developer" elseif ActionInfo.isCore then "Developer" else "Core"
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
	Elements.priorityLevel = RoactModule.createElement(CellLabelModule, {
		text = ActionInfo.priorityLevel,
		size = List2[2],
		pos = List[2]
	})
	Elements.isCore = RoactModule.createElement(CellLabelModule, { text = Core, size = List2[3], pos = List[3] })
	Elements.actionName = RoactModule.createElement(CellLabelModule, { text = Name, size = List2[4], pos = List[4] })
	Elements.inputTypes = RoactModule.createElement(CellLabelModule, { text = Text, size = List2[5], pos = List[5] })
	Elements.lowerHorizontalLine = RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, LineWidth),
		Position = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = LineColor
	})
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, XOffset, 0, EntryFrameHeight),
		LayoutOrder = LayoutOrder
	}, Elements)
end

function ActionBindingsChart.init(p2, p3)
	-- upvalues: RoactModule (copy)
	local CurrentData = p3.ActionBindingsData:getCurrentData()
	
	function p2.onSortChanged(SortType)
		-- upvalues: p3 (copy), p2 (copy)
		if SortType == p3.ActionBindingsData:getSortType() then
			p2:setState({ reverseSort = not p2.state.reverseSort })
			
			return
		else
			p3.ActionBindingsData:setSortType(SortType)
			p2:setState({ reverseSort = false })
		end
	end
	
	function p2.onCanvasPosChanged()
		-- upvalues: p2 (copy)
		local CanvasPosition = p2.scrollingRef.current.CanvasPosition
		
		if p2.state.canvasPos ~= CanvasPosition then
			p2:setState({ canvasPos = CanvasPosition })
		end
	end
	
	p2.scrollingRef = RoactModule.createRef()
	p2.state = { reverseSort = false, actionBindingEntries = CurrentData }
end

function ActionBindingsChart.willUpdate(p2)
	if p2.canvasPosConnector then
		p2.canvasPosConnector:Disconnect()
	end
end

function ActionBindingsChart.didUpdate(p2)
	if p2.scrollingRef.current then
		p2.canvasPosConnector = p2.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p2.onCanvasPosChanged)
		local AbsoluteSize = p2.scrollingRef.current.AbsoluteSize
		local AbsScrollSize = p2.state.absScrollSize
		
		if AbsoluteSize.X ~= AbsScrollSize.X or AbsoluteSize.Y ~= AbsScrollSize.Y then
			p2:setState({ absScrollSize = AbsoluteSize })
		end
	end
end

function ActionBindingsChart.didMount(p2)
	p2.bindingsUpdated = p2.props.ActionBindingsData:Signal():Connect(function(ActionBindingEntries)
		-- upvalues: p2 (copy)
		p2:setState({ actionBindingEntries = ActionBindingEntries })
	end)
	
	if p2.scrollingRef.current then
		p2.canvasPosConnector = p2.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p2.onCanvasPosChanged)
		p2:setState({
			absScrollSize = p2.scrollingRef.current.AbsoluteSize,
			canvasPos = p2.scrollingRef.current.CanvasPosition
		})
	end
end

function ActionBindingsChart.willUnmount(p2)
	p2.bindingsUpdated:Disconnect()
	p2.bindingsUpdated = nil
	p2.canvasPosConnector:Disconnect()
	p2.canvasPosConnector = nil
end

function ActionBindingsChart.render(p2)
	-- upvalues: MinFrameWidth (copy), RoactModule (copy), EntryFrameHeight (copy), constructEntry (copy), LineColor (copy), constructHeader (copy), HeaderFrameHeight (copy), ConstantsModule (copy)
	local config = {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local SearchTerm: string = p2.props.searchTerm
	local Size = p2.props.size
	local LayoutOrder = p2.props.layoutOrder
	local ActionBindingEntries = p2.state.actionBindingEntries
	local ReverseSort = p2.state.reverseSort
	local CanvasPos = p2.state.canvasPos
	local AbsScrollSize = p2.state.absScrollSize
	local Largest = AbsScrollSize and math.max(AbsScrollSize.X, MinFrameWidth) or MinFrameWidth
	local CountActionBindingEntries = #ActionBindingEntries
	local YOffset = 0
	
	if AbsScrollSize and CanvasPos then
		local YOffset1 = -1
		local Total = 0
		local Count = 0
		
		for i, actionBindingEntry in ipairs(ActionBindingEntries) do
			local HasFoundAt: boolean = if SearchTerm then string.find(tostring(actionBindingEntry.actionInfo.inputTypes[1]):lower(), SearchTerm:lower()) ~= nil or string.find(actionBindingEntry.name:lower(), SearchTerm:lower()) ~= nil else false
			
			if not SearchTerm or HasFoundAt then
				if CanvasPos.Y <= YOffset + EntryFrameHeight then
					if Total < AbsScrollSize.Y then
						config[i] = constructEntry(actionBindingEntry, Largest, (ReverseSort and CountActionBindingEntries - i or i) + 1)
					end
					if YOffset1 < 0 then
						YOffset1 = YOffset
					else
						Total += EntryFrameHeight
					end
					Count += 1
				end
				YOffset += EntryFrameHeight
			end
		end
		if Count == 0 then
			config.NoneFound = RoactModule.createElement("TextLabel", {
				Text = "No ActionBindings Found",
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 1, 0),
				TextColor3 = LineColor
			})
		else
			config.WindowingPadding = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, YOffset1)
			})
		end
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = Size,
		LayoutOrder = LayoutOrder
	}, {
		Header = constructHeader(p2.onSortChanged, Largest),
		MainChart = RoactModule.createElement("ScrollingFrame", {
			Position = UDim2.new(0, 0, 0, HeaderFrameHeight),
			Size = UDim2.new(1, 0, 1, -HeaderFrameHeight),
			CanvasSize = UDim2.new(0, Largest, 0, YOffset),
			ScrollBarThickness = 6,
			BackgroundColor3 = ConstantsModule.Color.BaseGray,
			BackgroundTransparency = 1,
			[RoactModule.Ref] = p2.scrollingRef
		}, config)
	})
end

return DataConsumerModule(ActionBindingsChart, "ActionBindingsData")