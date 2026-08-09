local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local fixActionBindingSecurity = game:DefineFastFlag("FixActionBindingSecurity", false)
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
local var6 = 0

for i, v in ipairs(chartCellWidths) do
	var6 += v
end
local var7 = -var6
local t = {}
local t_1 = {}
local t_2 = {}
var7 /= 2
table.insert(t, UDim2.new(0, cellPadding, 0, 0))
table.insert(t_1, UDim2.new(0.5, var7 - cellPadding, 0, headerFrameHeight))
table.insert(t_2, UDim2.new(0.5, var7 - cellPadding, 0, entryFrameHeight))

for i_1, v_1 in ipairs(chartCellWidths) do
	table.insert(t, UDim2.new(0.5, var7 + cellPadding, 0, 0))
	table.insert(t_1, UDim2.new(0, v_1 - cellPadding, 0, headerFrameHeight))
	table.insert(t_2, UDim2.new(0, v_1 - cellPadding, 0, entryFrameHeight))
	var7 += v_1
end
table.insert(t, UDim2.new(0.5, var7 + cellPadding, 0, 0))
table.insert(t_1, UDim2.new(0.5, -var6 / 2 - cellPadding, 0, headerFrameHeight))
table.insert(t_2, UDim2.new(0.5, -var6 / 2 - cellPadding, 0, entryFrameHeight))
local t_3 = {}

for i_2, v_2 in ipairs(t) do
	t_3[i_2] = UDim2.new(v_2.X.Scale, v_2.X.Offset - cellPadding, v_2.Y.Scale, v_2.Y.Offset)
end
local actionBindingsChart = roactModule.Component:extend("ActionBindingsChart")

local function constructHeader(p0, p1) --[[ line: 63 ]]
	-- upvalues: chartHeaderNames (ref), roactModule (ref), headerButtonModule (ref), t_1 (ref), t (ref), lineWidth (ref), lineColor (ref), t_3 (ref), headerFrameHeight (ref)
	local t_2 = {}
	
	for i, v in ipairs(chartHeaderNames) do
		t_2[v] = roactModule.createElement(headerButtonModule, { text = v, size = t_1[i], pos = t[i], sortfunction = p0 })
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
		Size = UDim2.new(0, p1, 0, headerFrameHeight)
	}, t_2)
end

local function constructEntry(p2, p3, p4) --[[ line: 105 ]]
	-- upvalues: fixActionBindingSecurity (ref), t_3 (ref), roactModule (ref), lineWidth (ref), lineColor (ref), cellLabelModule (ref), t_2 (ref), t (ref), entryFrameHeight (ref)
	local name = p2.name
	local actionInfo = p2.actionInfo
	local var16 = tostring(actionInfo.inputTypes[1])
	local var17 = if fixActionBindingSecurity then if actionInfo.isCore then "Core" else "Developer" elseif actionInfo.isCore then "Developer" else "Core"
	local t_1 = {}
	
	for i = 2, #t_3 do
		t_1[string.format("line_%d", i)] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, lineWidth, 1, 0),
			Position = t_3[i],
			BackgroundColor3 = lineColor
		})
	end
	t_1[name] = roactModule.createElement(cellLabelModule, { text = var16, size = t_2[1], pos = t[1] })
	t_1.priorityLevel = roactModule.createElement(cellLabelModule, {
		text = actionInfo.priorityLevel,
		size = t_2[2],
		pos = t[2]
	})
	t_1.isCore = roactModule.createElement(cellLabelModule, { text = var17, size = t_2[3], pos = t[3] })
	t_1.actionName = roactModule.createElement(cellLabelModule, { text = name, size = t_2[4], pos = t[4] })
	t_1.inputTypes = roactModule.createElement(cellLabelModule, { text = var16, size = t_2[5], pos = t[5] })
	t_1.lowerHorizontalLine = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, lineWidth),
		Position = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = lineColor
	})
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, p3, 0, entryFrameHeight),
		LayoutOrder = p4
	}, t_1)
end

function actionBindingsChart.init(p5, p6) --[[ line: 182 ]]
	-- upvalues: roactModule (ref)
	local currentData = p6.ActionBindingsData:getCurrentData()
	
	function p5.onSortChanged(p7) --[[ line: 185 ]]
		-- upvalues: p6 (ref), p5 (ref)
		if p7 == p6.ActionBindingsData:getSortType() then
			p5:setState({ reverseSort = not p5.state.reverseSort })
			
			return
		end
		p6.ActionBindingsData:setSortType(p7)
		p5:setState({ reverseSort = false })
	end
	
	function p5.onCanvasPosChanged() --[[ line: 199 ]]
		-- upvalues: p5 (ref)
		local canvasPosition = p5.scrollingRef.current.CanvasPosition
		
		if p5.state.canvasPos ~= canvasPosition then
			p5:setState({ canvasPos = canvasPosition })
		end
	end
	
	p5.scrollingRef = roactModule.createRef()
	p5.state = { reverseSort = false, actionBindingEntries = currentData }
end

function actionBindingsChart.willUpdate(p8) --[[ line: 216 ]]
	if p8.canvasPosConnector then
		p8.canvasPosConnector:Disconnect()
	end
end

function actionBindingsChart.didUpdate(p9) --[[ line: 222 ]]
	if p9.scrollingRef.current then
		p9.canvasPosConnector = p9.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p9.onCanvasPosChanged)
		local absoluteSize = p9.scrollingRef.current.AbsoluteSize
		local absScrollSize = p9.state.absScrollSize
		
		if absoluteSize.X ~= absScrollSize.X or absoluteSize.Y ~= absScrollSize.Y then
			p9:setState({ absScrollSize = absoluteSize })
		end
	end
end

function actionBindingsChart.didMount(p10) --[[ line: 237 ]]
	p10.bindingsUpdated = p10.props.ActionBindingsData:Signal():Connect(function(p11) --[[ line: 238 ]]
		-- upvalues: p10 (ref)
		p10:setState({ actionBindingEntries = p11 })
	end)
	
	if p10.scrollingRef.current then
		p10.canvasPosConnector = p10.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p10.onCanvasPosChanged)
		p10:setState({
			absScrollSize = p10.scrollingRef.current.AbsoluteSize,
			canvasPos = p10.scrollingRef.current.CanvasPosition
		})
	end
end

function actionBindingsChart.willUnmount(p12) --[[ line: 255 ]]
	p12.bindingsUpdated:Disconnect()
	p12.bindingsUpdated = nil
	p12.canvasPosConnector:Disconnect()
	p12.canvasPosConnector = nil
end

function actionBindingsChart.render(p13) --[[ line: 262 ]]
	-- upvalues: minFrameWidth (ref), roactModule (ref), entryFrameHeight (ref), constructEntry (ref), lineColor (ref), constructHeader (ref), headerFrameHeight (ref), constantsModule (ref)
	local t = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local searchTerm = p13.props.searchTerm
	local size = p13.props.size
	local layoutOrder = p13.props.layoutOrder
	local actionBindingEntries = p13.state.actionBindingEntries
	local reverseSort = p13.state.reverseSort
	local canvasPos = p13.state.canvasPos
	local absScrollSize = p13.state.absScrollSize
	local x = absScrollSize and math.max(absScrollSize.X, minFrameWidth) or minFrameWidth
	local actionBindingEntriesCount = #actionBindingEntries
	local var23 = 0
	
	if absScrollSize and canvasPos then
		local var24 = -1
		local var25 = 0
		local var26 = 0
		
		for i, v in ipairs(actionBindingEntries) do
			local var27 = false
			
			if searchTerm then
				var27 = if string.find(tostring(v.actionInfo.inputTypes[1]):lower(), searchTerm:lower()) == nil then string.find(v.name:lower(), searchTerm:lower()) ~= nil else string.find(tostring(v.actionInfo.inputTypes[1]):lower(), searchTerm:lower()) ~= nil
			end
			if not searchTerm or var27 then
				if canvasPos.Y <= var23 + entryFrameHeight then
					if var25 < absScrollSize.Y then
						t[i] = constructEntry(v, x, (if reverseSort then actionBindingEntriesCount - i else i) + 1)
					end
					if var24 < 0 then
						var24 = var23
					else
						var25 += entryFrameHeight
					end
					var26 += 1
				end
				var23 += entryFrameHeight
			end
		end
		if var26 == 0 then
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
				Size = UDim2.new(1, 0, 0, var24)
			})
		end
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		Header = constructHeader(p13.onSortChanged, x),
		MainChart = roactModule.createElement("ScrollingFrame", {
			Position = UDim2.new(0, 0, 0, headerFrameHeight),
			Size = UDim2.new(1, 0, 1, -headerFrameHeight),
			CanvasSize = UDim2.new(0, x, 0, var23),
			ScrollBarThickness = 6,
			BackgroundColor3 = constantsModule.Color.BaseGray,
			BackgroundTransparency = 1,
			[roactModule.Ref] = p13.scrollingRef
		}, t)
	})
end

return dataConsumerModule(actionBindingsChart, "ActionBindingsData")