local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local DataConsumerModule = require(script.Parent.Parent.Parent.Components.DataConsumer)
local HeaderButtonModule = require(script.Parent.Parent.Parent.Components.HeaderButton)
local ServerScriptsEntryModule = require(script.Parent.ServerScriptsEntry)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local ChartHeaderNames = ConstantsModule.ServerScriptsFormatting.ChartHeaderNames
local HeaderFrameHeight = ConstantsModule.ServerScriptsFormatting.HeaderFrameHeight
local EntryFrameHeight = ConstantsModule.ServerScriptsFormatting.EntryFrameHeight
local CellPadding = ConstantsModule.ServerScriptsFormatting.CellPadding
local LineGraphHeight = ConstantsModule.GeneralFormatting.LineGraphHeight
local NoResultSearchStr = ConstantsModule.GeneralFormatting.NoResultSearchStr
local CellOffset = {}
local List = {}
local EntryCellSize = {}
local XScale = 0

for _, chartCellWidth in ipairs(ConstantsModule.ServerScriptsFormatting.ChartCellWidths) do
	table.insert(CellOffset, UDim2.new(XScale, CellPadding, 0, 0))
	table.insert(List, UDim2.new(chartCellWidth, -CellPadding, 0, HeaderFrameHeight))
	table.insert(EntryCellSize, UDim2.new(chartCellWidth, -CellPadding, 0, EntryFrameHeight))
	XScale += chartCellWidth
end
local VerticalOffsets = {}

for i, Vector in ipairs(CellOffset) do
	VerticalOffsets[i] = UDim2.new(Vector.X.Scale, Vector.X.Offset - CellPadding, Vector.Y.Scale, Vector.Y.Offset)
end
local ServerScripts = RoactModule.Component:extend("ServerScripts")

local function constructHeader(Sortfunction) --[[ Line: 45 ]]
	-- upvalues: ChartHeaderNames (copy), RoactModule (copy), HeaderButtonModule (copy), List (copy), CellOffset (copy), LineWidth (copy), LineColor (copy), VerticalOffsets (copy), HeaderFrameHeight (copy)
	local Elements = {}
	
	for i = 1, #ChartHeaderNames do
		Elements[ChartHeaderNames[i]] = RoactModule.createElement(HeaderButtonModule, {
			text = ChartHeaderNames[i],
			size = List[i],
			pos = CellOffset[i],
			sortfunction = Sortfunction
		})
	end
	Elements.upperHorizontalLine = RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, LineWidth),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = LineColor
	})
	Elements.verticalLine1 = RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0, LineWidth, 1, 0),
		Position = VerticalOffsets[2],
		BackgroundColor3 = LineColor
	})
	Elements.verticalLine2 = RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0, LineWidth, 1, 0),
		Position = VerticalOffsets[3],
		BackgroundColor3 = LineColor
	})
	Elements.lowerHorizontalLine = RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, LineWidth),
		Position = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = LineColor
	})
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, HeaderFrameHeight)
	}, Elements)
end

local function getX(p1) --[[ Line: 91 ]]
	return p1.time
end

local function getActivity(p1) --[[ Line: 95 ]]
	return p1.data[1]
end

local function getRate(p1) --[[ Line: 99 ]]
	return p1.data[2]
end

local function formatScriptsData(p1): string --[[ Line: 103 ]]
	return string.format("%.3f", p1)
end

function ServerScripts.init(p1, p2) --[[ Line: 107 ]]
	-- upvalues: RoactModule (copy)
	local CurrentData = p2.ServerScriptsData:getCurrentData()
	
	function p1.onSortChanged(SortType) --[[ Line: 110 ]]
		-- upvalues: p2 (copy), p1 (copy)
		if SortType == p2.ServerScriptsData:getSortType() then
			p1:setState({ reverseSort = not p1.state.reverseSort })
			
			return
		else
			p2.ServerScriptsData:setSortType(SortType)
			p1:setState({ reverseSort = false })
		end
	end
	
	function p1.getOnButtonPress(Name) --[[ Line: 124 ]]
		-- upvalues: p1 (copy)
		return function(_, _) --[[ Line: 125 ]]
			-- upvalues: p1 (upval), Name (copy)
			p1:setState({ expandIndex = p1.state.expandIndex ~= Name and Name })
		end
	end
	
	function p1.onCanvasPosChanged() --[[ Line: 132 ]]
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
	p1.state = { expandIndex = nil, serverScriptsData = CurrentData }
end

function ServerScripts.willUpdate(p1) --[[ Line: 150 ]]
	if p1.canvasPosConnector then
		p1.canvasPosConnector:Disconnect()
	end
end

function ServerScripts.didUpdate(p1) --[[ Line: 156 ]]
	if p1.scrollingRef.current then
		p1.canvasPosConnector = p1.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onCanvasPosChanged)
	end
end

function ServerScripts.didMount(p1) --[[ Line: 163 ]]
	p1.statsConnector = p1.props.ServerScriptsData:Signal():Connect(function(ServerScriptsData) --[[ Line: 164 ]]
		-- upvalues: p1 (copy)
		p1:setState({ serverScriptsData = ServerScriptsData })
	end)
	
	if p1.scrollingRef.current then
		p1.canvasPosConnector = p1.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onCanvasPosChanged)
		p1:setState({
			absScrollSize = p1.scrollingRef.current.AbsoluteSize,
			canvasPos = p1.scrollingRef.current.CanvasPosition
		})
	end
end

function ServerScripts.willUnmount(p1) --[[ Line: 181 ]]
	p1.statsConnector:Disconnect()
	p1.statsConnector = nil
end

function ServerScripts.render(p1) --[[ Line: 186 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy), EntryFrameHeight (copy), LineGraphHeight (copy), ServerScriptsEntryModule (copy), EntryCellSize (copy), CellOffset (copy), VerticalOffsets (copy), formatScriptsData (copy), getX (copy), getActivity (copy), getRate (copy), NoResultSearchStr (copy), constructHeader (copy), HeaderFrameHeight (copy)
	local SearchTerm: string = p1.props.searchTerm
	local ScriptFilters = p1.props.scriptFilters
	local LayoutOrder = p1.props.layoutOrder
	local Size = p1.props.size
	local ServerScriptsData = p1.state.serverScriptsData
	local ReverseSort = p1.state.reverseSort
	local AbsScrollSize = p1.state.absScrollSize
	local CanvasPos = p1.state.canvasPos
	local Elements = {}
	local CountServerScriptsData = #ServerScriptsData
	
	if CountServerScriptsData == 0 then
		return RoactModule.createElement("TextLabel", {
			Text = "Awaiting Server Scripts Information.",
			BackgroundTransparency = 1,
			Size = Size,
			Position = UDim2.new(0, 0, 0, 0),
			TextColor3 = ConstantsModule.Color.Text,
			LayoutOrder = LayoutOrder
		})
	end
	local YOffset1 = 0
	local YOffset = -1
	local Total = 0
	local Count = 0
	
	if CanvasPos and AbsScrollSize then
		for i, ScriptData in pairs(ServerScriptsData) do
			if not SearchTerm or string.find(ScriptData.name:lower(), SearchTerm:lower()) ~= nil then
				Count += 1
				local Flag = true
				local Active = ScriptFilters.Active
				local Inactive = ScriptFilters.Inactive
				local BackResult = ScriptData.dataStats.dataSet:back()
				
				if Active ~= Inactive then
					if BackResult.data[1] > 0 and Inactive then
						Flag = false
					elseif BackResult.data[1] == 0 and Active then
						Flag = false
					end
				end
				if Flag then
					local IsExpandIndexMatch = p1.state.expandIndex == ScriptData.name
					local NewEntryFrameHeight = IsExpandIndexMatch and EntryFrameHeight + 2 * LineGraphHeight or EntryFrameHeight
					
					if CanvasPos.Y <= YOffset1 + NewEntryFrameHeight then
						if Total < AbsScrollSize.Y then
							Elements[i] = RoactModule.createElement(ServerScriptsEntryModule, {
								scriptData = ScriptData,
								frameHeight = NewEntryFrameHeight,
								showGraph = IsExpandIndexMatch,
								layoutOrder = ReverseSort and CountServerScriptsData - i or i,
								activityBoxColor = BackResult.data[1] > 0 and ConstantsModule.Color.ActiveBox or ConstantsModule.Color.InactiveBox,
								entryCellSize = EntryCellSize,
								cellOffset = CellOffset,
								verticalOffsets = VerticalOffsets,
								onButtonPress = p1.getOnButtonPress(ScriptData.name),
								formatScriptsData = formatScriptsData,
								getX = getX,
								getActivity = getActivity,
								getRate = getRate,
								stringFormatY = formatScriptsData
							})
						end
						if YOffset < 0 then
							YOffset = YOffset1
						else
							Total += NewEntryFrameHeight
						end
					end
					YOffset1 += NewEntryFrameHeight
				end
			end
		end
		if Count > 0 then
			Elements.WindowingPadding = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, YOffset)
			})
		else
			Elements.emptySearch = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = Size,
				Text = string.format(NoResultSearchStr, SearchTerm),
				TextColor3 = ConstantsModule.Color.Text
			})
		end
	end
	Elements.UIListLayout = RoactModule.createElement("UIListLayout", {
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		LayoutOrder = LayoutOrder
	}, {
		Header = constructHeader(p1.onSortChanged),
		Entries = RoactModule.createElement("ScrollingFrame", {
			Position = UDim2.new(0, 0, 0, HeaderFrameHeight),
			Size = UDim2.new(1, 0, 1, -HeaderFrameHeight),
			BackgroundTransparency = 1,
			VerticalScrollBarInset = 1,
			ScrollBarThickness = 5,
			CanvasSize = UDim2.new(1, 0, 0, YOffset1),
			[RoactModule.Ref] = p1.scrollingRef
		}, Elements)
	})
end

return DataConsumerModule(ServerScripts, "ServerScriptsData")