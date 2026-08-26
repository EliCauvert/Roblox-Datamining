local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local dataConsumerModule = require(components.DataConsumer)
local headerButtonModule = require(components.HeaderButton)
local cellLabelModule = require(components.CellLabel)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local generalFormatting = constantsModule.GeneralFormatting
local lineWidth = generalFormatting.LineWidth
local lineColor = generalFormatting.LineColor
local actionBindingsFormatting = constantsModule.ActionBindingsFormatting
local chartHeaderNames = actionBindingsFormatting.ChartHeaderNames
local chartCellWidths = actionBindingsFormatting.ChartCellWidths
local headerFrameHeight = actionBindingsFormatting.HeaderFrameHeight
local entryFrameHeight = actionBindingsFormatting.EntryFrameHeight
local cellPadding = actionBindingsFormatting.CellPadding
local minFrameWidth = actionBindingsFormatting.MinFrameWidth
local var1 = 0

for i, v in ipairs(chartCellWidths) do
	var1 += v
end
local var2 = -var1
local t = {}
local t_1 = {}
local t_2 = {}
var2 /= 2
table.insert(t, UDim2.new(0, cellPadding, 0, 0))
table.insert(t_1, UDim2.new(0.5, var2 - cellPadding, 0, headerFrameHeight))
table.insert(t_2, UDim2.new(0.5, var2 - cellPadding, 0, entryFrameHeight))

for i_1, v_1 in ipairs(chartCellWidths) do
	table.insert(t, UDim2.new(0.5, var2 + cellPadding, 0, 0))
	table.insert(t_1, UDim2.new(0, v_1 - cellPadding, 0, headerFrameHeight))
	table.insert(t_2, UDim2.new(0, v_1 - cellPadding, 0, entryFrameHeight))
	var2 += v_1
end
table.insert(t, UDim2.new(0.5, var2 + cellPadding, 0, 0))
table.insert(t_1, UDim2.new(0.5, -var1 / 2 - cellPadding, 0, headerFrameHeight))
table.insert(t_2, UDim2.new(0.5, -var1 / 2 - cellPadding, 0, entryFrameHeight))
local t_3 = {}

for i_2, v_2 in ipairs(t) do
	t_3[i_2] = UDim2.new(v_2.X.Scale, v_2.X.Offset - cellPadding, v_2.Y.Scale, v_2.Y.Offset)
end
local actionBindingsChart = roactModule.Component:extend("ActionBindingsChart")

local function constructHeader(p1, p2)
	-- upvalues: chartHeaderNames (ref), roactModule (ref), headerButtonModule (ref), t_1 (ref), t (ref), lineWidth (ref), lineColor (ref), t_3 (ref), headerFrameHeight (ref)
	local t_2 = {}
	
	for i, v in ipairs(chartHeaderNames) do
		t_2[v] = roactModule.createElement(headerButtonModule, { text = v, size = t_1[i], pos = t[i], sortfunction = p1 })
	end
	t_2.upperHorizontalLine = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, lineWidth),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = lineColor
	})
	t_2.lowerHorizontalLine = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, lineWidth),
		Position = UDim2.new(0, 0, 1, -lineWidth),
		BackgroundColor3 = lineColor
	})
	
	for i_1 = 2, #t_3 do
		t_2[string.format("VerticalLine_%d", i_1)] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, lineWidth, 1, 0),
			Position = t_3[i_1],
			BackgroundColor3 = lineColor
		})
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, p2, 0, headerFrameHeight)
	}, t_2)
end

local function constructEntry(p3, p4, p5)
	-- upvalues: t_3 (ref), roactModule (ref), lineWidth (ref), lineColor (ref), cellLabelModule (ref), t_2 (ref), t (ref), entryFrameHeight (ref)
	local name = p3.name
	local actionInfo = p3.actionInfo
	local var3 = tostring(actionInfo.inputTypes[1])
	local var4 = if actionInfo.isCore then "Core" else "Developer"
	local t_1 = {}
	
	for i = 2, #t_3 do
		t_1[string.format("line_%d", i)] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, lineWidth, 1, 0),
			Position = t_3[i],
			BackgroundColor3 = lineColor
		})
	end
	t_1[name] = roactModule.createElement(cellLabelModule, { text = var3, size = t_2[1], pos = t[1] })
	t_1.priorityLevel = roactModule.createElement(cellLabelModule, {
		text = actionInfo.priorityLevel,
		size = t_2[2],
		pos = t[2]
	})
	t_1.isCore = roactModule.createElement(cellLabelModule, { text = var4, size = t_2[3], pos = t[3] })
	t_1.actionName = roactModule.createElement(cellLabelModule, { text = name, size = t_2[4], pos = t[4] })
	t_1.inputTypes = roactModule.createElement(cellLabelModule, { text = var3, size = t_2[5], pos = t[5] })
	t_1.lowerHorizontalLine = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, lineWidth),
		Position = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = lineColor
	})
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, p4, 0, entryFrameHeight),
		LayoutOrder = p5
	}, t_1)
end

function actionBindingsChart.init(p6, p7)
	-- upvalues: roactModule (ref)
	local currentData = p7.ActionBindingsData:getCurrentData()
	
	function p5.onSortChanged(p8)
		-- upvalues: p7 (ref), p6 (ref)
		if p8 == p7.ActionBindingsData:getSortType() then
			p6:setState({ reverseSort = not p6.state.reverseSort })
			
			return
		end
		p7.ActionBindingsData:setSortType(p8)
		p6:setState({ reverseSort = false })
	end
	
	function p5.onCanvasPosChanged()
		-- upvalues: p6 (ref)
		local canvasPosition = p6.scrollingRef.current.CanvasPosition
		
		if p6.state.canvasPos ~= canvasPosition then
			p6:setState({ canvasPos = canvasPosition })
		end
	end
	
	p6.scrollingRef = roactModule.createRef()
	p6.state = { reverseSort = false, actionBindingEntries = currentData }
end

function actionBindingsChart.willUpdate(p6)
	if p6.canvasPosConnector then
		p6.canvasPosConnector:Disconnect()
	end
end

function actionBindingsChart.didUpdate(p6)
	if p6.scrollingRef.current then
		p6.canvasPosConnector = p6.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p6.onCanvasPosChanged)
		local absoluteSize = p6.scrollingRef.current.AbsoluteSize
		local absScrollSize = p6.state.absScrollSize
		
		if absoluteSize.X ~= absScrollSize.X or absoluteSize.Y ~= absScrollSize.Y then
			p6:setState({ absScrollSize = absoluteSize })
		end
	end
end

function actionBindingsChart.didMount(p6)
	p6.bindingsUpdated = p6.props.ActionBindingsData:Signal():Connect(function(p7)
		-- upvalues: p6 (ref)
		p6:setState({ actionBindingEntries = p7 })
	end)
	
	if p6.scrollingRef.current then
		p6.canvasPosConnector = p6.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p6.onCanvasPosChanged)
		p6:setState({
			absScrollSize = p6.scrollingRef.current.AbsoluteSize,
			canvasPos = p6.scrollingRef.current.CanvasPosition
		})
	end
end

function actionBindingsChart.willUnmount(p6)
	p6.bindingsUpdated:Disconnect()
	p6.bindingsUpdated = nil
	p6.canvasPosConnector:Disconnect()
	p6.canvasPosConnector = nil
end

function actionBindingsChart.render(p6)
	-- upvalues: minFrameWidth (ref), roactModule (ref), entryFrameHeight (ref), constructEntry (ref), lineColor (ref), constructHeader (ref), headerFrameHeight (ref), constantsModule (ref)
	local t = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local searchTerm = p6.props.searchTerm
	local size = p6.props.size
	local layoutOrder = p6.props.layoutOrder
	local actionBindingEntries = p6.state.actionBindingEntries
	local reverseSort = p6.state.reverseSort
	local canvasPos = p6.state.canvasPos
	local absScrollSize = p6.state.absScrollSize
	local x = absScrollSize and math.max(absScrollSize.X, minFrameWidth) or minFrameWidth
	local actionBindingEntriesCount = #actionBindingEntries
	local var5 = 0
	
	if absScrollSize and canvasPos then
		local var6 = -1
		local var7 = 0
		local var8 = 0
		
		for i, v in ipairs(actionBindingEntries) do
			local var9 = false
			
			if searchTerm then
				var9 = if string.find(tostring(v.actionInfo.inputTypes[1]):lower(), searchTerm:lower()) == nil then string.find(v.name:lower(), searchTerm:lower()) ~= nil else string.find(tostring(v.actionInfo.inputTypes[1]):lower(), searchTerm:lower()) ~= nil
			end
			if not searchTerm or var9 then
				if canvasPos.Y <= var5 + entryFrameHeight then
					if var7 < absScrollSize.Y then
						t[i] = constructEntry(v, x, (if reverseSort then actionBindingEntriesCount - i else i) + 1)
					end
					if var6 < 0 then
						var6 = var5
					else
						var7 += entryFrameHeight
					end
					var8 += 1
				end
				var5 += entryFrameHeight
			end
		end
		if var8 == 0 then
			t.NoneFound = roactModule.createElement("TextLabel", {
				Text = "No ActionBindings Found",
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 1, 0),
				TextColor3 = lineColor
			})
		else
			t.WindowingPadding = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, var6)
			})
		end
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		Header = constructHeader(p6.onSortChanged, x),
		MainChart = roactModule.createElement("ScrollingFrame", {
			Position = UDim2.new(0, 0, 0, headerFrameHeight),
			Size = UDim2.new(1, 0, 1, -headerFrameHeight),
			CanvasSize = UDim2.new(0, x, 0, var5),
			ScrollBarThickness = 6,
			BackgroundColor3 = constantsModule.Color.BaseGray,
			BackgroundTransparency = 1,
			[roactModule.Ref] = p6.scrollingRef
		}, t)
	})
end

return dataConsumerModule(actionBindingsChart, "ActionBindingsData")