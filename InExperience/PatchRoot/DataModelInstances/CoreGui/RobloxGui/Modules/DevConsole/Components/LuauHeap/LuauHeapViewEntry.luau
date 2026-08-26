local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local cellLabelModule = require(components.CellLabel)
local bannerButtonModule = require(components.BannerButton)
local tooltipModule = require(components.Tooltip)
local _ = require(script.Parent.LuauHeapTypes)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local graphEntryFrameHeight = constantsModule.LuauHeapFormatting.GraphEntryFrameHeight
local depthIndent = constantsModule.LuauHeapFormatting.DepthIndent
local valueCellWidth = constantsModule.LuauHeapFormatting.ValueCellWidth
local cellPadding = constantsModule.LuauHeapFormatting.CellPadding
local valuePadding = constantsModule.LuauHeapFormatting.ValuePadding
local luauHeapViewEntry = roactModule.PureComponent:extend("LuauHeapViewEntry")

local function BorderedCellLabel(p1)
	-- upvalues: roactModule (ref), cellLabelModule (ref), lineWidth (ref), valuePadding (ref), lineColor (ref)
	return roactModule.createFragment({
		Label = roactModule.createElement(cellLabelModule, {
			richText = true,
			text = p1.text,
			size = p1.size,
			pos = p1.pos
		}),
		LeftBorder = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(UDim.new(0, lineWidth), p1.size.Y),
			Position = UDim2.fromOffset(-valuePadding, 0) + p1.pos,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = lineColor
		})
	})
end

function luauHeapViewEntry.init(p1)
	p1.state = {
		expandedEllipsis = false,
		showTooltip = false,
		expanded = p1.props.depth == 0,
		tooltipPos = UDim2.fromOffset(0, 0)
	}
	
	function p1.onButtonPress()
		-- upvalues: p1 (ref)
		p1:setState(function(p2)
			return { expanded = not p2.expanded }
		end)
	end
	
	function p1.onExpandEllipsis()
		-- upvalues: p1 (ref)
		p1:setState({ expandedEllipsis = true })
	end
	
	function p1.onMouseEnter(_, p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(p2, p3)
		})
	end
	
	function p1.onMouseMove(_, p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(p2, p3)
		})
	end
	
	function p1.onMouseLeave()
		-- upvalues: p1 (ref)
		p1:setState({ showTooltip = false })
	end
end

function luauHeapViewEntry.renderChildren(p1, p2, p3)
	-- upvalues: roactModule (ref), luauHeapViewEntry (ref)
	if not p1.state.expanded then
		return {}
	elseif not (if #p2 == 0 then p3 ~= nil and #p3 ~= 0 else true) then
		return {}
	end
	local t = {}
	local totalSize = p1.props.data.TotalSize
	local var1 = p1.props.depth + 1
	local var2 = 0
	local var3 = 0
	local var4 = 0
	
	local function _(p4)
		-- upvalues: p3 (ref)
		if p3 then
			for i, v in ipairs(p3) do
				if p4.Name == v.Name then
					return v
				end
			end
		end
		return nil
	end
	
	for i, v in ipairs(p2) do
		local var5
		if not p3 then break end
		for i_2, v_2 in ipairs(p3) do
			if v.Name == v_2.Name then
				var5 = v_2
				if v.TotalSize <= 128 and #p2 > 4 and not p1.state.expandedEllipsis then
					var2 += v.TotalSize
					
					if var5 then
						var3 += var5.TotalSize
					end
				else
					var4 += 1
					t[var4] = roactModule.createElement(luauHeapViewEntry, {
						layoutOrder = totalSize - v.TotalSize,
						depth = var1,
						data = v,
						compare = var5
					})
				end
			end
		end
		var5 = nil
	end
	if var2 > 0 then
		var4 += 1
		t[var4] = roactModule.createElement(luauHeapViewEntry, {
			layoutOrder = totalSize,
			depth = var1,
			data = {
				Name = "...",
				Size = var2,
				TotalSize = var2,
				Children = {}
			},
			compare = if p3 then {
				Name = "...",
				Size = var3,
				TotalSize = var3,
				Children = {}
			} else nil,
			customButtonPress = p1.onExpandEllipsis
		})
	end
	if p3 then
		local var6
		for i, v in ipairs(p3) do
			var6 = false
			
			for i_2, v_2 in ipairs(p2) do
				if v_2.Name == v.Name then
					var6 = true
					break
				end
			end
			if not var6 then
				var4 += 1
				t[var4] = roactModule.createElement(luauHeapViewEntry, {
					layoutOrder = totalSize,
					depth = var1,
					data = {
						Size = 0,
						TotalSize = 0,
						Name = v.Name,
						Source = v.Source,
						Children = {}
					},
					compare = v
				})
			end
		end
	end
	return t
end

function luauHeapViewEntry.renderValues(_, p5)
	-- upvalues: valueCellWidth (ref), valuePadding (ref), graphEntryFrameHeight (ref), roactModule (ref), BorderedCellLabel (ref)
	local t = {}
	local uDim2 = UDim2.new(valueCellWidth, -valuePadding, 0, graphEntryFrameHeight)
	local uDim2_1 = UDim2.new(1 - valueCellWidth * #p5, valuePadding, 0, 0)
	
	for i, v in ipairs(p5) do
		t[tostring(i)] = roactModule.createElement(BorderedCellLabel, {
			text = tostring(v),
			size = uDim2,
			pos = uDim2_1 + UDim2.fromScale(valueCellWidth * (i - 1), 0)
		})
	end
	return t
end

function luauHeapViewEntry.render(p6)
	-- upvalues: graphEntryFrameHeight (ref), depthIndent (ref), valueCellWidth (ref), cellPadding (ref), roactModule (ref), tooltipModule (ref), bannerButtonModule (ref), cellLabelModule (ref)
	local props = p6.props
	local size = props.size or UDim2.new(1, 0, 0, graphEntryFrameHeight)
	local depth = props.depth
	local layoutOrder = props.layoutOrder or 0
	local var7 = depth * depthIndent
	local data = props.data
	local compare = props.compare
	local _ = ""
	local _ = ""
	local list = {
		if compare and compare.TotalSize ~= data.TotalSize then string.format("%d <font color=\"#%s\">(%s%d)</font>", data.TotalSize, if data.TotalSize < compare.TotalSize then "0f0" else "f00", if data.TotalSize < compare.TotalSize then "" else "+", data.TotalSize - compare.TotalSize) else string.format("%.0f", data.TotalSize),
		if compare and compare.Size ~= data.Size then string.format("%d <font color=\"#%s\">(%s%d)</font>", data.Size, if data.Size < compare.Size then "0f0" else "f00", if data.Size < compare.Size then "" else "+", data.Size - compare.Size) else string.format("%.0f", data.Size)
	}
	local var8 = if data.Name and #data.Name ~= 0 then data.Name elseif depth == 0 then "<root>" else "<anonymous>"
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		tooltip = if p6.state.showTooltip then roactModule.createElement(tooltipModule, {
			text = if data.Source and #data.Source ~= 0 then data.Source else var8,
			pos = p6.state.tooltipPos
		}) else nil,
		layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		button = roactModule.createElement(bannerButtonModule, {
			layoutOrder = -1,
			size = UDim2.new(1, 0, 0, graphEntryFrameHeight),
			inset = var7,
			isExpanded = p6.state.expanded,
			isExpandable = if #data.Children == 0 and compare ~= nil then if #compare.Children == 0 then props.customButtonPress ~= nil else true else true,
			onButtonPress = if props.customButtonPress then props.customButtonPress else p6.onButtonPress,
			onMouseEnter = p6.onMouseEnter,
			onMouseLeave = p6.onMouseLeave,
			onMouseMove = p6.onMouseMove
		}, {
			name = roactModule.createElement(cellLabelModule, {
				textWrapped = false,
				text = var8,
				size = UDim2.new(UDim.new(1 - valueCellWidth * #list, -(cellPadding + var7)), UDim.new(1, 0)),
				pos = UDim2.new(0, cellPadding + var7, 0, 0),
				textTruncate = Enum.TextTruncate.SplitWord
			}),
			values = roactModule.createFragment(p6:renderValues(list))
		}),
		children = roactModule.createFragment(p6:renderChildren(data.Children, if compare then compare.Children else nil))
	})
end

return luauHeapViewEntry