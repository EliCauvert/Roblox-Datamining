local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local _ = require(script.Parent.ProfilerDataFormatV2)
local ProfilerUtilModule = require(script.Parent.ProfilerUtil)
local GetDurationsFunction = ProfilerUtilModule.getDurations
local GetNativeFlagFunction = ProfilerUtilModule.getNativeFlag
local GetPluginFlagFunction = ProfilerUtilModule.getPluginFlag
local StandardizeChildrenFunction = ProfilerUtilModule.standardizeChildren
local Components = script.Parent.Parent.Parent.Components
local CellLabelModule = require(Components.CellLabel)
local BannerButtonModule = require(Components.BannerButton)
local TooltipModule = require(Components.Tooltip)
local SetScriptProfilerRootModule = require(script.Parent.Parent.Parent.Actions.SetScriptProfilerRoot)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local EntryFrameHeight = ConstantsModule.GeneralFormatting.EntryFrameHeight
local DepthIndent = ConstantsModule.ScriptProfilerFormatting.DepthIndent
local ValueCellWidth = ConstantsModule.ScriptProfilerFormatting.ValueCellWidth
local CellPadding = ConstantsModule.ScriptProfilerFormatting.CellPadding
local ValuePadding = ConstantsModule.ScriptProfilerFormatting.ValuePadding
local ProfilerViewEntry = RoactModule.PureComponent:extend("ProfilerViewEntry")
local v1 = require(CorePackages.Packages.RoactRodux).UNSTABLE_connect2(nil, function(Callback)
	-- upvalues: SetScriptProfilerRootModule (copy)
	return {
		dispatchSetScriptProfilerRoot = function(p1, p2, p3)
			-- upvalues: Callback (copy), SetScriptProfilerRootModule (upval)
			Callback(SetScriptProfilerRootModule(p1, p2, p3))
		end
	}
end)(ProfilerViewEntry)

local function BorderedCellLabel(p1)
	-- upvalues: RoactModule (copy), CellLabelModule (copy), LineWidth (copy), ValuePadding (copy), LineColor (copy)
	return RoactModule.createFragment({
		Label = RoactModule.createElement(CellLabelModule, { text = p1.text, size = p1.size, pos = p1.pos }),
		LeftBorder = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(UDim.new(0, LineWidth), p1.size.Y),
			Position = UDim2.fromOffset(-ValuePadding, 0) + p1.pos,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = LineColor
		})
	})
end

local function _(p1)
	local FunctionId = p1.functionId
	local _ = p1.data.Functions[FunctionId]
	local Root: string = if p1.depth == 0 and FunctionId == 0 then "<root>" else "<anonymous>"
	local NodeName = p1.nodeName
	
	return if NodeName and #NodeName ~= 0 then NodeName else Root
end

function ProfilerViewEntry.init(p1)
	p1.state = {
		showTooltip = false,
		expanded = p1.props.depth == 0 or p1.props.expandedNodes[p1.props.nodeId],
		tooltipPos = UDim2.fromOffset(0, 0)
	}
	
	function p1.onButtonPress()
		-- upvalues: p1 (copy)
		p1.props.expandedNodes[p1.props.nodeId] = not p1.state.expanded
		p1:setState(function(_)
			-- upvalues: p1 (upval)
			return { expanded = not p1.state.expanded }
		end)
	end
	
	function p1:onMouseEnter(XOffset, YOffset)
		-- upvalues: p1 (copy)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(XOffset, YOffset)
		})
	end
	
	function p1:onMouseMove(XOffset, YOffset)
		-- upvalues: p1 (copy)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(XOffset, YOffset)
		})
	end
	
	function p1.onMouseLeave()
		-- upvalues: p1 (copy)
		p1:setState({ showTooltip = false })
	end
	
	function p1.onMouse2Click()
		-- upvalues: p1 (copy)
		local DispatchSetScriptProfilerRootFunction: (any, any, any) -> () = p1.props.dispatchSetScriptProfilerRoot
		local NodeId = p1.props.nodeId
		local FunctionId = p1.props.functionId
		local Props = p1.props
		local FunctionId1 = Props.functionId
		local _ = Props.data.Functions[FunctionId1]
		local Root: string = if Props.depth == 0 and FunctionId1 == 0 then "<root>" else "<anonymous>"
		local NodeName = Props.nodeName
		
		if not NodeName or #NodeName == 0 then
			NodeName = Root
		end
		DispatchSetScriptProfilerRootFunction(NodeId, FunctionId, NodeName)
	end
end

function ProfilerViewEntry.renderChildren(p1, List)
	-- upvalues: GetDurationsFunction (copy), GetPluginFlagFunction (copy), RoactModule (copy), v1 (copy)
	local Elements = {}
	
	if p1.state.expanded then
		local PercentageRatio = p1.props.percentageRatio
		local Durations = GetDurationsFunction(p1.props.data, p1.props.nodeId)
		local NewDepth = p1.props.depth + 1
		local Average = p1.props.average
		local SearchTerm = p1.props.searchTerm
		local SearchFilter = p1.props.searchFilter
		local ShowPlugins = p1.props.showPlugins
		local ShowGC = p1.props.showGC
		local GcNodeOffsets = p1.props.gcNodeOffsets
		local ExpandedNodes = p1.props.expandedNodes
		local Data = p1.props.data
		local GCFuncId = Data.GCFuncId
		
		if List then
			for FunctionId, NodeId in pairs(List) do
				if (#SearchFilter <= 0 or SearchFilter[NodeId]) and (ShowGC or FunctionId ~= GCFuncId) then
					local _ = Data.Nodes[NodeId]
					local Function = Data.Functions[FunctionId]
					
					if ShowPlugins or not GetPluginFlagFunction(Data, Function) then
						Elements[FunctionId] = RoactModule.createElement(v1, {
							layoutOrder = (Durations - GetDurationsFunction(Data, NodeId)) * 1000000,
							depth = NewDepth,
							data = Data,
							nodeId = NodeId,
							functionId = FunctionId,
							nodeName = Function.Name,
							average = Average,
							percentageRatio = PercentageRatio,
							searchTerm = SearchTerm,
							searchFilter = SearchFilter,
							showPlugins = ShowPlugins,
							showGC = ShowGC,
							gcNodeOffsets = GcNodeOffsets,
							expandedNodes = ExpandedNodes
						})
					end
				end
			end
			return Elements
		elseif p1.props.nodeId == 0 then
			assert(List == nil)
			
			for i, category in Data.Categories do
				if #SearchFilter <= 0 or SearchFilter[category.NodeId] then
					local _ = Data.Nodes[category.NodeId]
					local Durations1 = GetDurationsFunction(Data, category.NodeId)
					local PluginOffset = p1.props.pluginOffsets[i]
					local PluginGCOffset = p1.props.pluginGCOffsets[i]
					
					if not ShowPlugins then
						Durations1 -= PluginOffset
						
						if ShowGC then
							Durations1 -= PluginGCOffset
						end
					end
					Elements[i] = RoactModule.createElement(v1, {
						functionId = nil,
						layoutOrder = (Durations - Durations1) * 1000000,
						depth = NewDepth,
						data = Data,
						nodeId = category.NodeId,
						nodeName = category.Name,
						average = Average,
						percentageRatio = PercentageRatio,
						searchTerm = SearchTerm,
						searchFilter = SearchFilter,
						showPlugins = ShowPlugins,
						pluginOffset = PluginOffset,
						pluginGCOffset = PluginGCOffset,
						showGC = ShowGC,
						gcNodeOffsets = GcNodeOffsets,
						expandedNodes = ExpandedNodes
					})
				end
			end
		end
	end
	return Elements
end

function ProfilerViewEntry:renderValues(List)
	-- upvalues: ValueCellWidth (copy), ValuePadding (copy), EntryFrameHeight (copy), RoactModule (copy), BorderedCellLabel (copy)
	local Elements = {}
	local _UDim2 = UDim2.new(ValueCellWidth, -ValuePadding, 0, EntryFrameHeight)
	local _UDim2_1 = UDim2.new(1 - ValueCellWidth * #List, ValuePadding, 0, 0)
	
	for i, value in ipairs(List) do
		Elements[tostring(i)] = RoactModule.createElement(BorderedCellLabel, {
			text = tostring(value),
			size = _UDim2,
			pos = _UDim2_1 + UDim2.fromScale(ValueCellWidth * (i - 1), 0)
		})
	end
	return Elements
end

function ProfilerViewEntry.render(p2)
	-- upvalues: EntryFrameHeight (copy), DepthIndent (copy), GetDurationsFunction (copy), StandardizeChildrenFunction (copy), ProfilerUtilModule (copy), GetNativeFlagFunction (copy), GetPluginFlagFunction (copy), ValueCellWidth (copy), RoactModule (copy), TooltipModule (copy), BannerButtonModule (copy), CellLabelModule (copy), CellPadding (copy)
	local Props = p2.props
	local Size = Props.size or UDim2.new(1, 0, 0, EntryFrameHeight)
	local Depth = Props.depth
	local LayoutOrder = Props.layoutOrder or 0
	local ScaledDepth = Depth * DepthIndent
	local PercentageRatio = Props.percentageRatio
	local Data = Props.data
	local ShowPlugins = Props.showPlugins
	local ShowGC = Props.showGC
	local NodeId = Props.nodeId
	local Function = Data.Functions[Props.functionId]
	local Node = Data.Nodes[NodeId]
	local Durations, Durations2 = GetDurationsFunction(Data, NodeId)
	local DurationsRatio = Durations / p2.props.average
	local DurationsRatio1 = Durations2 / p2.props.average
	local StandardizeChildrenResult = StandardizeChildrenFunction(Data, Node)
	
	if not ShowPlugins then
		if NodeId == 0 then
			DurationsRatio -= p2.props.pluginOffsets.Total or 0
			
			if ShowGC then
				DurationsRatio -= p2.props.pluginGCOffsets.Total or 0
			end
		else
			DurationsRatio -= p2.props.pluginOffset or 0
			
			if ShowGC then
				DurationsRatio -= p2.props.pluginGCOffset or 0
			end
		end
	end
	if not ShowGC then
		local GcNodeOffsets = Props.gcNodeOffsets
		
		if NodeId == 0 then
			DurationsRatio -= GcNodeOffsets.Total or 0
		else
			DurationsRatio -= GcNodeOffsets[NodeId] or 0
		end
	end
	local Formatted1 = nil
	local Formatted = nil
	if PercentageRatio then
		if PercentageRatio == 0 then
			Formatted = "N/A"
			Formatted1 = "N/A"
		else
			Formatted = string.format("%.3f%%", DurationsRatio / PercentageRatio)
			Formatted1 = string.format("%.3f%%", DurationsRatio1 / PercentageRatio)
		end
	else
		Formatted = string.format("%.3f", DurationsRatio * 1000)
		Formatted1 = string.format("%.3f", DurationsRatio1 * 1000)
	end
	local list = { Formatted, Formatted1 }
	local FunctionId = Props.functionId
	local _ = Props.data.Functions[FunctionId]
	local Root: string = if Props.depth == 0 and FunctionId == 0 then "<root>" else "<anonymous>"
	local NodeName = Props.nodeName
	
	if not NodeName or #NodeName == 0 then
		NodeName = Root
	end
	local Text: string = NodeName
	local SourceLocationString = ProfilerUtilModule.getSourceLocationString(Data, Function, Text)
	local NativeFlag = GetNativeFlagFunction(Data, Function)
	
	if GetPluginFlagFunction(Data, Function) then
		Text ..= " <plugin>"
	end
	if NativeFlag then
		Text ..= " <native>"
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		LayoutOrder = LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		tooltip = if p2.state.showTooltip then RoactModule.createElement(TooltipModule, { text = SourceLocationString, pos = p2.state.tooltipPos }) else nil,
		layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		button = RoactModule.createElement(BannerButtonModule, {
			layoutOrder = -1,
			size = UDim2.new(1, 0, 0, EntryFrameHeight),
			inset = ScaledDepth,
			isExpanded = p2.state.expanded,
			isExpandable = StandardizeChildrenResult and next(StandardizeChildrenResult) ~= nil or Depth == 0,
			onButtonPress = p2.onButtonPress,
			onMouseEnter = p2.onMouseEnter,
			onMouseLeave = p2.onMouseLeave,
			onMouseMove = p2.onMouseMove,
			onMouse2Click = p2.onMouse2Click
		}, {
			name = RoactModule.createElement(CellLabelModule, {
				text = Text,
				size = UDim2.new(UDim.new(1 - ValueCellWidth * #list, -ScaledDepth), UDim.new(1, 0)),
				pos = UDim2.new(0, CellPadding + ScaledDepth, 0, 0)
			}),
			values = RoactModule.createFragment(p2:renderValues(list))
		}),
		children = RoactModule.createFragment(p2:renderChildren(StandardizeChildrenResult))
	})
end

return v1