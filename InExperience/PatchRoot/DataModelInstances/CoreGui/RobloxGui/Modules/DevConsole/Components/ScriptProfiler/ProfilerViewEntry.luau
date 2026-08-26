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
local var1 = roactRoduxModule.UNSTABLE_connect2(nil, function(p1)
	-- upvalues: setScriptProfilerRootModule (ref)
	return {
		dispatchSetScriptProfilerRoot = function(value, p2, p3)
			-- upvalues: p1 (ref), setScriptProfilerRootModule (copy)
			p1(setScriptProfilerRootModule(value, p2, p3))
		end
	}
end)(profilerViewEntry)

local function BorderedCellLabel(p1)
	-- upvalues: roactModule (ref), cellLabelModule (ref), lineWidth (ref), valuePadding (ref), lineColor (ref)
	return roactModule.createFragment({
		Label = roactModule.createElement(cellLabelModule, { text = p1.text, size = p1.size, pos = p1.pos }),
		LeftBorder = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(UDim.new(0, lineWidth), p1.size.Y),
			Position = UDim2.fromOffset(-valuePadding, 0) + p1.pos,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = lineColor
		})
	})
end

local function _(p1)
	local depth = p1.depth
	local functionId = p1.functionId
	local _ = p1.data.Functions[functionId]
	local var2 = if depth == 0 and functionId == 0 then "<root>" else "<anonymous>"
	local nodeName = p1.nodeName
	
	if nodeName and #nodeName ~= 0 then
		return nodeName
	end
	nodeName = var2
	
	return nodeName
end

function profilerViewEntry.init(p1)
	p1.state = {
		showTooltip = false,
		expanded = if p1.props.depth ~= 0 then p1.props.expandedNodes[p1.props.nodeId] else true,
		tooltipPos = UDim2.fromOffset(0, 0)
	}
	
	function p5.onButtonPress()
		-- upvalues: p1 (ref)
		p1.props.expandedNodes[p1.props.nodeId] = not p1.state.expanded
		p1:setState(function(_)
			-- upvalues: p1 (copy)
			return { expanded = not p1.state.expanded }
		end)
	end
	
	function p5.onMouseEnter(_, p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(p2, p3)
		})
	end
	
	function p5.onMouseMove(_, p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(p2, p3)
		})
	end
	
	function p5.onMouseLeave()
		-- upvalues: p1 (ref)
		p1:setState({ showTooltip = false })
	end
	
	function p5.onMouse2Click()
		-- upvalues: p1 (ref)
		local dispatchSetScriptProfilerRoot = p1.props.dispatchSetScriptProfilerRoot
		local nodeId = p1.props.nodeId
		local functionId = p1.props.functionId
		local props = p1.props
		local depth = props.depth
		local functionId_1 = props.functionId
		local _ = props.data.Functions[functionId_1]
		local var2 = if depth == 0 and functionId_1 == 0 then "<root>" else "<anonymous>"
		local nodeName = props.nodeName
		
		if not nodeName or #nodeName == 0 then
			nodeName = var2
		end
		dispatchSetScriptProfilerRoot(nodeId, functionId, nodeName)
	end
end

function profilerViewEntry.renderChildren(p1, p2)
	-- upvalues: getDurations (ref), getPluginFlag (ref), roactModule (ref), var1 (ref)
	local t = {}
	
	if p1.state.expanded then
		local var2
		local percentageRatio = p1.props.percentageRatio
		local var3 = getDurations(p1.props.data, p1.props.nodeId)
		local var4 = p1.props.depth + 1
		local average = p1.props.average
		local searchTerm = p1.props.searchTerm
		local searchFilter = p1.props.searchFilter
		local showPlugins = p1.props.showPlugins
		local showGC = p1.props.showGC
		local gcNodeOffsets = p1.props.gcNodeOffsets
		local expandedNodes = p1.props.expandedNodes
		local data = p1.props.data
		local GCFuncId = data.GCFuncId
		
		if p2 then
			for i, v in pairs(p2) do
				if (#searchFilter <= 0 or searchFilter[v]) and (showGC or i ~= GCFuncId) then
					var2 = data.Nodes[v]
					local var5 = data.Functions[i]
					
					if showPlugins or not getPluginFlag(data, var5) then
						t[i] = roactModule.createElement(var1, {
							layoutOrder = (var3 - getDurations(data, v)) * 1000000,
							depth = var4,
							data = data,
							nodeId = v,
							functionId = i,
							nodeName = var5.Name,
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
		elseif p1.props.nodeId == 0 then
			assert(p2 == nil)
			
			for i, v in data.Categories do
				if #searchFilter <= 0 or searchFilter[v.NodeId] then
					var2 = data.Nodes[v.NodeId]
					local var6 = getDurations(data, v.NodeId)
					local var7 = p1.props.pluginOffsets[i]
					local var8 = p1.props.pluginGCOffsets[i]
					
					if not showPlugins then
						var6 -= var7
						
						if showGC then
							var6 -= var8
						end
					end
					t[i] = roactModule.createElement(var1, {
						functionId = nil,
						layoutOrder = (var3 - var6) * 1000000,
						depth = var4,
						data = data,
						nodeId = v.NodeId,
						nodeName = v.Name,
						average = average,
						percentageRatio = percentageRatio,
						searchTerm = searchTerm,
						searchFilter = searchFilter,
						showPlugins = showPlugins,
						pluginOffset = var7,
						pluginGCOffset = var8,
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

function profilerViewEntry.renderValues(_, p3)
	-- upvalues: valueCellWidth (ref), valuePadding (ref), entryFrameHeight (ref), roactModule (ref), BorderedCellLabel (ref)
	local t = {}
	local uDim2 = UDim2.new(valueCellWidth, -valuePadding, 0, entryFrameHeight)
	local uDim2_1 = UDim2.new(1 - valueCellWidth * #p3, valuePadding, 0, 0)
	
	for i, v in ipairs(p3) do
		t[tostring(i)] = roactModule.createElement(BorderedCellLabel, {
			text = tostring(v),
			size = uDim2,
			pos = uDim2_1 + UDim2.fromScale(valueCellWidth * (i - 1), 0)
		})
	end
	return t
end

function profilerViewEntry.render(p4)
	-- upvalues: entryFrameHeight (ref), depthIndent (ref), getDurations (ref), standardizeChildren (ref), profilerUtilModule (ref), getNativeFlag (ref), getPluginFlag (ref), valueCellWidth (ref), roactModule (ref), tooltipModule (ref), bannerButtonModule (ref), cellLabelModule (ref), cellPadding (ref)
	local props = p4.props
	local size = props.size or UDim2.new(1, 0, 0, entryFrameHeight)
	local depth = props.depth
	local layoutOrder = props.layoutOrder or 0
	local var9 = depth * depthIndent
	local percentageRatio = props.percentageRatio
	local data = props.data
	local showPlugins = props.showPlugins
	local showGC = props.showGC
	local nodeId = props.nodeId
	local functionId = data.Functions[props.functionId]
	local var10 = data.Nodes[nodeId]
	local var11, var12 = getDurations(data, nodeId)
	var11 /= p4.props.average
	var12 /= p4.props.average
	local var13 = standardizeChildren(data, var10)
	
	if not showPlugins then
		if nodeId == 0 then
			var11 -= p4.props.pluginOffsets.Total or 0
			
			if showGC then
				var11 -= p4.props.pluginGCOffsets.Total or 0
			end
		else
			var11 -= p4.props.pluginOffset or 0
			
			if showGC then
				var11 -= p4.props.pluginGCOffset or 0
			end
		end
	end
	if not showGC then
		local gcNodeOffsets = props.gcNodeOffsets
		var11 = if nodeId == 0 then var11 - (gcNodeOffsets.Total or 0) else var11 - (gcNodeOffsets[nodeId] or 0)
	end
	local var14, var15
	local _ = nil
	local _ = nil
	
	if not percentageRatio then
		var14 = string.format("%.3f", var11 * 1000)
		var15 = string.format("%.3f", var12 * 1000)
	elseif percentageRatio == 0 then
		var14 = "N/A"
		var15 = "N/A"
	else
		var14 = string.format("%.3f%%", var11 / percentageRatio)
		var15 = string.format("%.3f%%", var12 / percentageRatio)
	end
	local list = { var14, var15 }
	local depth_1 = props.depth
	local functionId_1 = props.functionId
	local _ = props.data.Functions[functionId_1]
	local var16 = if depth_1 == 0 and functionId_1 == 0 then "<root>" else "<anonymous>"
	local nodeName = props.nodeName
	
	if not nodeName or #nodeName == 0 then
		nodeName = var16
	end
	local var17 = nodeName
	depth_1 = profilerUtilModule.getSourceLocationString(data, functionId, var17)
	local var18 = getNativeFlag(data, functionId)
	
	if getPluginFlag(data, functionId) then
		var17 ..= " <plugin>"
	end
	if var18 then
		var17 ..= " <native>"
	end
	local var19
	local uDim = UDim.new(1 - valueCellWidth * #list, -var9)
	local createElement = roactModule.createElement
	nodeName = "Frame"
	local t = {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}
	local t_1 = {
		tooltip = if p4.state.showTooltip then roactModule.createElement(tooltipModule, { text = depth_1, pos = p4.state.tooltipPos }) else nil,
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
		inset = var9,
		isExpanded = p4.state.expanded
	}
	
	if var13 then
		var19 = if next(var13) == nil then depth == 0 else true
	end
	t_2.isExpandable = var19
	t_2.onButtonPress = p4.onButtonPress
	t_2.onMouseEnter = p4.onMouseEnter
	t_2.onMouseLeave = p4.onMouseLeave
	t_2.onMouseMove = p4.onMouseMove
	t_2.onMouse2Click = p4.onMouse2Click
	t_1.button = createElement_1(bannerButtonModule, t_2, {
		name = roactModule.createElement(cellLabelModule, {
			text = var17,
			size = UDim2.new(uDim, UDim.new(1, 0)),
			pos = UDim2.new(0, cellPadding + var9, 0, 0)
		}),
		values = roactModule.createFragment(p4:renderValues(list))
	})
	t_1.children = roactModule.createFragment(p4:renderChildren(var13))
	
	return createElement(nodeName, t, t_1)
end

return var1