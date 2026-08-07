local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local _ = require(script.Parent.ProfilerDataFormatV2)
local profilerUtilModule = require(script.Parent.ProfilerUtil)
local getDurations = profilerUtilModule.getDurations
local getNativeFlag = profilerUtilModule.getNativeFlag
local getPluginFlag = profilerUtilModule.getPluginFlag
local standardizeChildren = profilerUtilModule.standardizeChildren
local components = script.Parent.Parent.Parent.Components
local cellLabelModule = require(components.CellLabel)
local bannerButtonModule = require(components.BannerButton)
local tooltipModule = require(components.Tooltip)
local setScriptProfilerRootModule = require(script.Parent.Parent.Parent.Actions.SetScriptProfilerRoot)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local entryFrameHeight = constantsModule.GeneralFormatting.EntryFrameHeight
local depthIndent = constantsModule.ScriptProfilerFormatting.DepthIndent
local valueCellWidth = constantsModule.ScriptProfilerFormatting.ValueCellWidth
local cellPadding = constantsModule.ScriptProfilerFormatting.CellPadding
local valuePadding = constantsModule.ScriptProfilerFormatting.ValuePadding
local profilerViewEntry = roactModule.PureComponent:extend("ProfilerViewEntry")
local var10 = roactRoduxModule.UNSTABLE_connect2(nil, function(p0) --[[ line: 39 | named "mapDispatchToProps" ]]
	-- upvalues: setScriptProfilerRootModule (ref)
	return {
		dispatchSetScriptProfilerRoot = function(value, p1, p2) --[[ line: 41 ]]
			-- upvalues: p0 (ref), setScriptProfilerRootModule (copy)
			p0(setScriptProfilerRootModule(value, p1, p2))
		end
	}
end)(profilerViewEntry)

local function BorderedCellLabel(p3) --[[ line: 59 ]]
	-- upvalues: roactModule (ref), cellLabelModule (ref), lineWidth (ref), valuePadding (ref), lineColor (ref)
	return roactModule.createFragment({
		Label = roactModule.createElement(cellLabelModule, { text = p3.text, size = p3.size, pos = p3.pos }),
		LeftBorder = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(UDim.new(0, lineWidth), p3.size.Y),
			Position = UDim2.fromOffset(-valuePadding, 0) + p3.pos,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = lineColor
		})
	})
end

local function _(p4) --[[ line: 76 | named "getNodeName" ]]
	local depth = p4.depth
	local functionId = p4.functionId
	local _ = p4.data.Functions[functionId]
	local var12 = if depth == 0 and functionId == 0 then "<root>" else "<anonymous>"
	local nodeName = p4.nodeName
	
	if nodeName and #nodeName ~= 0 then
		return nodeName
	end
	nodeName = var12
	
	return nodeName
end

function profilerViewEntry.init(p5) --[[ line: 90 ]]
	p5.state = {
		showTooltip = false,
		expanded = if p5.props.depth ~= 0 then p5.props.expandedNodes[p5.props.nodeId] else true,
		tooltipPos = UDim2.fromOffset(0, 0)
	}
	
	function p5.onButtonPress() --[[ line: 97 ]]
		-- upvalues: p5 (ref)
		p5.props.expandedNodes[p5.props.nodeId] = not p5.state.expanded
		p5:setState(function(_) --[[ line: 100 ]]
			-- upvalues: p5 (copy)
			return { expanded = not p5.state.expanded }
		end)
	end
	
	function p5.onMouseEnter(_, p6, p7) --[[ line: 107 ]]
		-- upvalues: p5 (ref)
		p5:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(p6, p7)
		})
	end
	
	function p5.onMouseMove(_, p8, p9) --[[ line: 114 ]]
		-- upvalues: p5 (ref)
		p5:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(p8, p9)
		})
	end
	
	function p5.onMouseLeave() --[[ line: 121 ]]
		-- upvalues: p5 (ref)
		p5:setState({ showTooltip = false })
	end
	
	function p5.onMouse2Click() --[[ line: 127 ]]
		-- upvalues: p5 (ref)
		local dispatchSetScriptProfilerRoot = p5.props.dispatchSetScriptProfilerRoot
		local nodeId = p5.props.nodeId
		local functionId = p5.props.functionId
		local props = p5.props
		local depth = props.depth
		local functionId_1 = props.functionId
		local _ = props.data.Functions[functionId_1]
		local var13 = if depth == 0 and functionId_1 == 0 then "<root>" else "<anonymous>"
		local nodeName = props.nodeName
		
		if not nodeName or #nodeName == 0 then
			nodeName = var13
		end
		dispatchSetScriptProfilerRoot(nodeId, functionId, nodeName)
	end
end

function profilerViewEntry.renderChildren(p10, p11) --[[ line: 132 ]]
	-- upvalues: getDurations (ref), getPluginFlag (ref), roactModule (ref), var10 (ref)
	local t = {}
	
	if p10.state.expanded then
		local var17
		local percentageRatio = p10.props.percentageRatio
		local var15 = getDurations(p10.props.data, p10.props.nodeId)
		local var16 = p10.props.depth + 1
		local average = p10.props.average
		local searchTerm = p10.props.searchTerm
		local searchFilter = p10.props.searchFilter
		local showPlugins = p10.props.showPlugins
		local showGC = p10.props.showGC
		local gcNodeOffsets = p10.props.gcNodeOffsets
		local expandedNodes = p10.props.expandedNodes
		local data = p10.props.data
		local GCFuncId = data.GCFuncId
		
		if p11 then
			for i, v in pairs(p11) do
				if (#searchFilter <= 0 or searchFilter[v]) and (showGC or i ~= GCFuncId) then
					var17 = data.Nodes[v]
					local var18 = data.Functions[i]
					
					if showPlugins or not getPluginFlag(data, var18) then
						t[i] = roactModule.createElement(var10, {
							layoutOrder = (var15 - getDurations(data, v)) * 1000000,
							depth = var16,
							data = data,
							nodeId = v,
							functionId = i,
							nodeName = var18.Name,
							average = average,
							percentageRatio = percentageRatio,
							searchTerm = searchTerm,
							searchFilter = searchFilter,
							showPlugins = showPlugins,
							showGC = showGC,
							gcNodeOffsets = gcNodeOffsets,
							expandedNodes = expandedNodes
						})
					end
				end
			end
			return t
		elseif p10.props.nodeId == 0 then
			assert(p11 == nil)
			
			for i, v in data.Categories do
				if #searchFilter <= 0 or searchFilter[v.NodeId] then
					var17 = data.Nodes[v.NodeId]
					local var19 = getDurations(data, v.NodeId)
					local var20 = p10.props.pluginOffsets[i]
					local var21 = p10.props.pluginGCOffsets[i]
					
					if not showPlugins then
						var19 -= var20
						
						if showGC then
							var19 -= var21
						end
					end
					t[i] = roactModule.createElement(var10, {
						functionId = nil,
						layoutOrder = (var15 - var19) * 1000000,
						depth = var16,
						data = data,
						nodeId = v.NodeId,
						nodeName = v.Name,
						average = average,
						percentageRatio = percentageRatio,
						searchTerm = searchTerm,
						searchFilter = searchFilter,
						showPlugins = showPlugins,
						pluginOffset = var20,
						pluginGCOffset = var21,
						showGC = showGC,
						gcNodeOffsets = gcNodeOffsets,
						expandedNodes = expandedNodes
					})
				end
			end
		end
	end
	return t
end

function profilerViewEntry.renderValues(_, p12) --[[ line: 231 ]]
	-- upvalues: valueCellWidth (ref), valuePadding (ref), entryFrameHeight (ref), roactModule (ref), BorderedCellLabel (ref)
	local t = {}
	local uDim2 = UDim2.new(valueCellWidth, -valuePadding, 0, entryFrameHeight)
	local uDim2_1 = UDim2.new(1 - valueCellWidth * #p12, valuePadding, 0, 0)
	
	for i, v in ipairs(p12) do
		t[tostring(i)] = roactModule.createElement(BorderedCellLabel, {
			text = tostring(v),
			size = uDim2,
			pos = uDim2_1 + UDim2.fromScale(valueCellWidth * (i - 1), 0)
		})
	end
	return t
end

function profilerViewEntry.render(p13) --[[ line: 246 ]]
	-- upvalues: entryFrameHeight (ref), depthIndent (ref), getDurations (ref), standardizeChildren (ref), profilerUtilModule (ref), getNativeFlag (ref), getPluginFlag (ref), valueCellWidth (ref), roactModule (ref), tooltipModule (ref), bannerButtonModule (ref), cellLabelModule (ref), cellPadding (ref)
	local props = p13.props
	local size = props.size or UDim2.new(1, 0, 0, entryFrameHeight)
	local depth = props.depth
	local layoutOrder = props.layoutOrder or 0
	local var27 = depth * depthIndent
	local percentageRatio = props.percentageRatio
	local data = props.data
	local showPlugins = props.showPlugins
	local showGC = props.showGC
	local nodeId = props.nodeId
	local functionId = data.Functions[props.functionId]
	local var28 = data.Nodes[nodeId]
	local var29, var30 = getDurations(data, nodeId)
	var29 /= p13.props.average
	var30 /= p13.props.average
	local var31 = standardizeChildren(data, var28)
	
	if not showPlugins then
		if nodeId == 0 then
			var29 -= p13.props.pluginOffsets.Total or 0
			
			if showGC then
				var29 -= p13.props.pluginGCOffsets.Total or 0
			end
		else
			var29 -= p13.props.pluginOffset or 0
			
			if showGC then
				var29 -= p13.props.pluginGCOffset or 0
			end
		end
	end
	if not showGC then
		local gcNodeOffsets = props.gcNodeOffsets
		var29 = if nodeId == 0 then var29 - (gcNodeOffsets.Total or 0) else var29 - (gcNodeOffsets[nodeId] or 0)
	end
	local var32, var33
	local _ = nil
	local _ = nil
	
	if not percentageRatio then
		var32 = string.format("%.3f", var29 * 1000)
		var33 = string.format("%.3f", var30 * 1000)
	elseif percentageRatio == 0 then
		var32 = "N/A"
		var33 = "N/A"
	else
		var32 = string.format("%.3f%%", var29 / percentageRatio)
		var33 = string.format("%.3f%%", var30 / percentageRatio)
	end
	local list = { var32, var33 }
	local depth_1 = props.depth
	local functionId_1 = props.functionId
	local _ = props.data.Functions[functionId_1]
	local var35 = if depth_1 == 0 and functionId_1 == 0 then "<root>" else "<anonymous>"
	local nodeName = props.nodeName
	
	if not nodeName or #nodeName == 0 then
		nodeName = var35
	end
	local var36 = nodeName
	depth_1 = profilerUtilModule.getSourceLocationString(data, functionId, var36)
	local var37 = getNativeFlag(data, functionId)
	
	if getPluginFlag(data, functionId) then
		var36 ..= " <plugin>"
	end
	if var37 then
		var36 ..= " <native>"
	end
	local var42
	local uDim = UDim.new(1 - valueCellWidth * #list, -var27)
	local createElement = roactModule.createElement
	nodeName = "Frame"
	local t = {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}
	local t_1 = {
		tooltip = if p13.state.showTooltip then roactModule.createElement(tooltipModule, { text = depth_1, pos = p13.state.tooltipPos }) else nil,
		layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local createElement_1 = roactModule.createElement
	local t_2 = {
		layoutOrder = -1,
		size = UDim2.new(1, 0, 0, entryFrameHeight),
		inset = var27,
		isExpanded = p13.state.expanded
	}
	
	if var31 then
		var42 = if next(var31) == nil then depth == 0 else true
	end
	t_2.isExpandable = var42
	t_2.onButtonPress = p13.onButtonPress
	t_2.onMouseEnter = p13.onMouseEnter
	t_2.onMouseLeave = p13.onMouseLeave
	t_2.onMouseMove = p13.onMouseMove
	t_2.onMouse2Click = p13.onMouse2Click
	t_1.button = createElement_1(bannerButtonModule, t_2, {
		name = roactModule.createElement(cellLabelModule, {
			text = var36,
			size = UDim2.new(uDim, UDim.new(1, 0)),
			pos = UDim2.new(0, cellPadding + var27, 0, 0)
		}),
		values = roactModule.createFragment(p13:renderValues(list))
	})
	t_1.children = roactModule.createFragment(p13:renderChildren(var31))
	
	return createElement(nodeName, t, t_1)
end

return var10