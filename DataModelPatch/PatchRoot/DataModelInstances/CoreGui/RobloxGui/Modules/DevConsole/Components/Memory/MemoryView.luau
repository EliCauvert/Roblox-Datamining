local TweenService = game:GetService("TweenService")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local HeaderButtonModule = require(script.Parent.Parent.Parent.Components.HeaderButton)
local MemoryViewEntryModule = require(script.Parent.MemoryViewEntry)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local ChartHeaderNames = ConstantsModule.MemoryFormatting.ChartHeaderNames
local HeaderFrameHeight = ConstantsModule.GeneralFormatting.HeaderFrameHeight
local ValueCellWidth = ConstantsModule.MemoryFormatting.ValueCellWidth
local CellPadding = ConstantsModule.MemoryFormatting.CellPadding
local ValuePadding = ConstantsModule.MemoryFormatting.ValuePadding
local EntryFrameHeight = ConstantsModule.GeneralFormatting.EntryFrameHeight
local LineGraphHeight = ConstantsModule.GeneralFormatting.LineGraphHeight
local NoResultSearchStr = ConstantsModule.GeneralFormatting.NoResultSearchStr
local _TweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0)
local MemoryView = RoactModule.Component:extend("MemoryView")

local function getX(p1)
	return p1.time
end

local function getY(p1)
	return p1.data
end

local function formatValueStr(p1): string
	return string.format("%.3f", p1)
end

function MemoryView.init(p1, p2)
	-- upvalues: EntryFrameHeight (copy), TweenService (copy), _TweenInfo (copy), RoactModule (copy)
	function p1.getOnButtonPress(ExpandIndex, LayoutOrder)
		-- upvalues: p1 (copy), EntryFrameHeight (upval), TweenService (upval), _TweenInfo (upval)
		return function(_, _)
			-- upvalues: p1 (upval), ExpandIndex (copy), LayoutOrder (copy), EntryFrameHeight (upval), TweenService (upval), _TweenInfo (upval)
			if p1.state.expandIndex ~= ExpandIndex and ExpandIndex then
				local Current = p1.scrollingRef.current
				
				if Current then
					TweenService:Create(Current, _TweenInfo, {
						CanvasPosition = Vector2.new(0, (LayoutOrder - 2.4) * EntryFrameHeight)
					}):Play()
				end
			end
			p1:setState({
				expandIndex = p1.state.expandIndex ~= ExpandIndex and ExpandIndex
			})
		end
	end
	
	function p1.onSortChanged(SortType)
		-- upvalues: p2 (copy), p1 (copy)
		if SortType == p2.targetMemoryData:getSortType() then
			p2.targetMemoryData:setSortType(SortType)
			p1:setState({ reverseSort = not p1.state.reverseSort })
			
			return
		else
			p2.targetMemoryData:setSortType(SortType)
			p1:setState({ reverseSort = false })
		end
	end
	
	function p1.onCanvasPosChanged()
		-- upvalues: p1 (copy)
		local CanvasPosition = p1.scrollingRef.current.CanvasPosition
		
		if p1.state.canvasPos ~= CanvasPosition then
			p1:setState({
				absScrollSize = p1.scrollingRef.current.AbsoluteSize,
				canvasPos = CanvasPosition
			})
		end
	end
	
	p1.scrollingRef = RoactModule.createRef()
	p1.state = {
		reverseSort = false,
		expandIndex = false,
		memoryData = p2.targetMemoryData:getMemoryData()
	}
end

function MemoryView.willUpdate(p1)
	if p1.canvasPosConnector then
		p1.canvasPosConnector:Disconnect()
	end
end

function MemoryView.didUpdate(p1)
	if p1.scrollingRef.current then
		p1.canvasPosConnector = p1.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onCanvasPosChanged)
	end
end

function MemoryView.didMount(p1)
	p1.treeViewItemConnector = p1.props.targetMemoryData:treeUpdatedSignal():Connect(function(MemoryData)
		-- upvalues: p1 (copy)
		p1:setState({ memoryData = MemoryData })
	end)
	
	if p1.scrollingRef.current then
		p1.canvasPosConnector = p1.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onCanvasPosChanged)
		p1:setState({
			absScrollSize = p1.scrollingRef.current.AbsoluteSize,
			canvasPos = p1.scrollingRef.current.CanvasPosition
		})
	end
end

function MemoryView.willUnmount(p1)
	p1.treeViewItemConnector:Disconnect()
end

function MemoryView.appendAdditionTabInformation(p1, Elements, AdditionalInfoResult, Text, Depth: number, p2)
	-- upvalues: EntryFrameHeight (copy), RoactModule (copy), MemoryViewEntryModule (copy), formatValueStr (copy)
	local CanvasPosition = p1.scrollingRef.current.CanvasPosition
	local AbsoluteSize = p1.scrollingRef.current.AbsoluteSize
	
	for _, value in ipairs(AdditionalInfoResult) do
		local Name = value.name
		local Value = value.value
		local Text1 = Text .. Name
		p2.layoutOrder += 1
		
		if CanvasPosition.Y <= p2.scrollingFrameHeight + EntryFrameHeight and p2.usedFrameSpace < AbsoluteSize.Y then
			Elements[Text .. Name] = RoactModule.createElement(MemoryViewEntryModule, {
				showGraph = false,
				size = UDim2.new(1, 0, 0, EntryFrameHeight),
				depth = Depth,
				name = Name,
				value = Value,
				formatValueStr = formatValueStr,
				layoutOrder = p2.layoutOrder
			})
			
			if p2.paddingHeight < 0 then
				p2.paddingHeight = p2.scrollingFrameHeight
			else
				p2.usedFrameSpace += EntryFrameHeight
			end
		end
		p2.scrollingFrameHeight += EntryFrameHeight
		
		if value.moreInfo and type(value.moreInfo) == "table" then
			p1:appendAdditionTabInformation(Elements, value.moreInfo, Text1, Depth + 1, p2)
		end
	end
end

function MemoryView.recursiveConstructEntries(p3, Elements, p4, Depth: number, p5)
	-- upvalues: EntryFrameHeight (copy), LineGraphHeight (copy), RoactModule (copy), MemoryViewEntryModule (copy), formatValueStr (copy), getX (copy), getY (copy)
	assert(p3.scrollingRef.current, "ScrollingFrame not initialized yet")
	local ExpandIndex = p3.state.expandIndex
	local ReverseSort = p3.state.reverseSort
	local CanvasPosition = p3.scrollingRef.current.CanvasPosition
	local AbsoluteSize = p3.scrollingRef.current.AbsoluteSize
	local Name: string = p4.name
	
	if string.find(Name:lower(), (p3.props.searchTerm or ""):lower()) then
		local IsExpandIndexMatch = ExpandIndex == Name
		local NewEntryFrameHeight = IsExpandIndexMatch and EntryFrameHeight + LineGraphHeight or EntryFrameHeight
		p5.layoutOrder += 1
		
		if CanvasPosition.Y <= p5.scrollingFrameHeight + NewEntryFrameHeight and p5.usedFrameSpace < AbsoluteSize.Y then
			Elements[Name] = RoactModule.createElement(MemoryViewEntryModule, {
				size = UDim2.new(1, 0, 0, NewEntryFrameHeight),
				depth = Depth,
				name = p4.name,
				showGraph = IsExpandIndexMatch,
				dataStats = p4.dataStats,
				onButtonPress = p3.getOnButtonPress(Name, p5.layoutOrder),
				formatValueStr = formatValueStr,
				getX = getX,
				getY = getY,
				layoutOrder = p5.layoutOrder
			})
			
			if p5.paddingHeight < 0 then
				p5.paddingHeight = p5.scrollingFrameHeight
			else
				p5.usedFrameSpace += NewEntryFrameHeight
			end
		end
		p5.scrollingFrameHeight += NewEntryFrameHeight
		
		if IsExpandIndexMatch and p4.dataStats.additionalInfoFunc then
			p3:appendAdditionTabInformation(Elements, p4.dataStats.additionalInfoFunc(), p4.name, Depth + 1, p5)
		end
	end
	local SortedChildren = p4.dataStats.sortedChildren
	
	if SortedChildren then
		if ReverseSort then
			local CountSortedChildren = #SortedChildren
			
			for i = 1, CountSortedChildren do
				p3:recursiveConstructEntries(Elements, SortedChildren[CountSortedChildren - i + 1], Depth + 1, p5)
			end
			return
		else
			for _, value in ipairs(SortedChildren) do
				p3:recursiveConstructEntries(Elements, value, Depth + 1, p5)
			end
		end
	end
end

function MemoryView.render(p6)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), NoResultSearchStr (copy), HeaderFrameHeight (copy), HeaderButtonModule (copy), ChartHeaderNames (copy), ValueCellWidth (copy), ValuePadding (copy), CellPadding (copy), LineColor (copy), LineWidth (copy)
	local t = {}
	local LayoutOrder = p6.props.layoutOrder
	local Size = p6.props.size
	local SearchTerm = p6.props.searchTerm or ""
	local config = {
		scrollingFrameHeight = 0,
		paddingHeight = -1,
		usedFrameSpace = 0,
		layoutOrder = 1
	}
	
	if p6.scrollingRef.current then
		for _, value in ipairs(p6.state.memoryData) do
			p6:recursiveConstructEntries(t, value, 0, config)
		end
		t.UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
		t.WindowingPadding = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, config.paddingHeight)
		})
	end
	if config.layoutOrder == 1 then
		if SearchTerm == "" then
			t.noDataMessage = RoactModule.createElement("TextLabel", {
				Text = "Awaiting Memory Stats",
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				TextColor3 = ConstantsModule.Color.Text,
				LayoutOrder = LayoutOrder
			})
		else
			t.noDataMessage = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				Text = string.format(NoResultSearchStr, SearchTerm),
				TextColor3 = ConstantsModule.Color.Text,
				LayoutOrder = LayoutOrder
			})
		end
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		LayoutOrder = LayoutOrder
	}, {
		Header = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, HeaderFrameHeight)
		}, {
			Name = RoactModule.createElement(HeaderButtonModule, {
				text = ChartHeaderNames[1],
				size = UDim2.new(1 - ValueCellWidth, -ValuePadding - CellPadding, 0, HeaderFrameHeight),
				pos = UDim2.new(0, CellPadding, 0, 0),
				sortfunction = p6.onSortChanged
			}),
			ValueMB = RoactModule.createElement(HeaderButtonModule, {
				text = ChartHeaderNames[2],
				size = UDim2.new(ValueCellWidth, -CellPadding, 0, HeaderFrameHeight),
				pos = UDim2.new(1 - ValueCellWidth, ValuePadding, 0, 0),
				sortfunction = p6.onSortChanged
			}),
			TopHorizontal = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = LineColor
			}),
			LowerHorizontal = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, LineWidth),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = LineColor
			}),
			vertical = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, LineWidth, 1, 0),
				Position = UDim2.new(1 - ValueCellWidth, 0, 0, 0),
				BackgroundColor3 = LineColor
			})
		}),
		Entries = RoactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, -HeaderFrameHeight),
			Position = UDim2.new(0, 0, 0, HeaderFrameHeight),
			BackgroundTransparency = 1,
			VerticalScrollBarInset = 1,
			ScrollBarThickness = 5,
			CanvasSize = UDim2.new(1, 0, 0, config.scrollingFrameHeight),
			[RoactModule.Ref] = p6.scrollingRef
		}, t)
	})
end

return MemoryView