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

local function BorderedCellLabel(p0)
	-- upvalues: roactModule (ref), cellLabelModule (ref), lineWidth (ref), valuePadding (ref), lineColor (ref)
	return roactModule.createFragment({
		Label = roactModule.createElement(cellLabelModule, {
			richText = true,
			text = p0.text,
			size = p0.size,
			pos = p0.pos
		}),
		LeftBorder = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(UDim.new(0, lineWidth), p0.size.Y),
			Position = UDim2.fromOffset(-valuePadding, 0) + p0.pos,
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
	
	function p1.onMouseEnter(_, p3, p4)
		-- upvalues: p1 (ref)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(p3, p4)
		})
	end
	
	function p1.onMouseMove(_, p5, p6)
		-- upvalues: p1 (ref)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(p5, p6)
		})
	end
	
	function p1.onMouseLeave()
		-- upvalues: p1 (ref)
		p1:setState({ showTooltip = false })
	end
end

function luauHeapViewEntry.renderChildren(p7, p8, p9)
	-- upvalues: roactModule (ref), luauHeapViewEntry (ref)
	if not p7.state.expanded then
		return {}
	elseif not (if #p8 == 0 then p9 ~= nil and #p9 ~= 0 else true) then
		return {}
	end
	local t = {}
	local totalSize = p7.props.data.TotalSize
	local var8 = p7.props.depth + 1
	local var9 = 0
	local var10 = 0
	local var11 = 0
	
	local function _(p10)
		-- upvalues: p9 (ref)
		if p9 then
			for i, v in ipairs(p9) do
				if p10.Name == v.Name then
					return v
				end
			end
		end
		return nil
	end
	
	for i, v in ipairs(p8) do
		local var13
		if not p9 then break end
		for i_2, v_2 in ipairs(p9) do
			if v.Name == v_2.Name then
				var13 = v_2
				if v.TotalSize <= 128 and #p8 > 4 and not p7.state.expandedEllipsis then
					var9 += v.TotalSize
					
					if var13 then
						var10 += var13.TotalSize
					end
				else
					var11 += 1
					t[var11] = roactModule.createElement(luauHeapViewEntry, {
						layoutOrder = totalSize - v.TotalSize,
						depth = var8,
						data = v,
						compare = var13
					})
				end
			end
		end
		var13 = nil
	end
	if var9 > 0 then
		var11 += 1
		t[var11] = roactModule.createElement(luauHeapViewEntry, {
			layoutOrder = totalSize,
			depth = var8,
			data = {
				Name = "...",
				Size = var9,
				TotalSize = var9,
				Children = {}
			},
			compare = if p9 then {
				Name = "...",
				Size = var10,
				TotalSize = var10,
				Children = {}
			} else nil,
			customButtonPress = p7.onExpandEllipsis
		})
	end
	if p9 then
		local var12
		for i, v in ipairs(p9) do
			var12 = false
			
			for i_2, v_2 in ipairs(p8) do
				if v_2.Name == v.Name then
					var12 = true
					break
				end
			end
			if not var12 then
				var11 += 1
				t[var11] = roactModule.createElement(luauHeapViewEntry, {
					layoutOrder = totalSize,
					depth = var8,
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

function luauHeapViewEntry.renderValues(_, p11)
	-- upvalues: valueCellWidth (ref), valuePadding (ref), graphEntryFrameHeight (ref), roactModule (ref), BorderedCellLabel (ref)
	local t = {}
	local uDim2 = UDim2.new(valueCellWidth, -valuePadding, 0, graphEntryFrameHeight)
	local uDim2_1 = UDim2.new(1 - valueCellWidth * #p11, valuePadding, 0, 0)
	
	for i, v in ipairs(p11) do
		t[tostring(i)] = roactModule.createElement(BorderedCellLabel, {
			text = tostring(v),
			size = uDim2,
			pos = uDim2_1 + UDim2.fromScale(valueCellWidth * (i - 1), 0)
		})
	end
	return t
end

function luauHeapViewEntry.render(p12)
	-- upvalues: graphEntryFrameHeight (ref), depthIndent (ref), valueCellWidth (ref), cellPadding (ref), roactModule (ref), tooltipModule (ref), bannerButtonModule (ref), cellLabelModule (ref)
	local props = p12.props
	local size = props.size or UDim2.new(1, 0, 0, graphEntryFrameHeight)
	local depth = props.depth
	local layoutOrder = props.layoutOrder or 0
	local var19 = depth * depthIndent
	local data = props.data
	local compare = props.compare
	local _ = ""
	local _ = ""
	local list = {
		if compare and compare.TotalSize ~= data.TotalSize then string.format("%d <font color=\"#%s\">(%s%d)</font>", data.TotalSize, if data.TotalSize < compare.TotalSize then "0f0" else "f00", if data.TotalSize < compare.TotalSize then "" else "+", data.TotalSize - compare.TotalSize) else string.format("%.0f", data.TotalSize),
		if compare and compare.Size ~= data.Size then string.format("%d <font color=\"#%s\">(%s%d)</font>", data.Size, if data.Size < compare.Size then "0f0" else "f00", if data.Size < compare.Size then "" else "+", data.Size - compare.Size) else string.format("%.0f", data.Size)
	}
	local var21 = if data.Name and #data.Name ~= 0 then data.Name elseif depth == 0 then "<root>" else "<anonymous>"
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		tooltip = if p12.state.showTooltip then roactModule.createElement(tooltipModule, {
			text = if data.Source and #data.Source ~= 0 then data.Source else var21,
			pos = p12.state.tooltipPos
		}) else nil,
		layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		button = roactModule.createElement(bannerButtonModule, {
			layoutOrder = -1,
			size = UDim2.new(1, 0, 0, graphEntryFrameHeight),
			inset = var19,
			isExpanded = p12.state.expanded,
			isExpandable = if #data.Children == 0 and compare ~= nil then if #compare.Children == 0 then props.customButtonPress ~= nil else true else true,
			onButtonPress = if props.customButtonPress then props.customButtonPress else p12.onButtonPress,
			onMouseEnter = p12.onMouseEnter,
			onMouseLeave = p12.onMouseLeave,
			onMouseMove = p12.onMouseMove
		}, {
			name = roactModule.createElement(cellLabelModule, {
				textWrapped = false,
				text = var21,
				size = UDim2.new(UDim.new(1 - valueCellWidth * #list, -(cellPadding + var19)), UDim.new(1, 0)),
				pos = UDim2.new(0, cellPadding + var19, 0, 0),
				textTruncate = Enum.TextTruncate.SplitWord
			}),
			values = roactModule.createFragment(p12:renderValues(list))
		}),
		children = roactModule.createFragment(p12:renderChildren(data.Children, if compare then compare.Children else nil))
	})
end

return luauHeapViewEntry