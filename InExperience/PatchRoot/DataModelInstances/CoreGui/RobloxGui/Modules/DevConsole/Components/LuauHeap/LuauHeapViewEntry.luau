local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local CellLabelModule = require(Components.CellLabel)
local BannerButtonModule = require(Components.BannerButton)
local TooltipModule = require(Components.Tooltip)
local _ = require(script.Parent.LuauHeapTypes)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local GraphEntryFrameHeight = ConstantsModule.LuauHeapFormatting.GraphEntryFrameHeight
local DepthIndent = ConstantsModule.LuauHeapFormatting.DepthIndent
local ValueCellWidth = ConstantsModule.LuauHeapFormatting.ValueCellWidth
local CellPadding = ConstantsModule.LuauHeapFormatting.CellPadding
local ValuePadding = ConstantsModule.LuauHeapFormatting.ValuePadding
local LuauHeapViewEntry = RoactModule.PureComponent:extend("LuauHeapViewEntry")

local function BorderedCellLabel(p1) --[[ Line: 32 ]]
	-- upvalues: RoactModule (copy), CellLabelModule (copy), LineWidth (copy), ValuePadding (copy), LineColor (copy)
	return RoactModule.createFragment({
		Label = RoactModule.createElement(CellLabelModule, {
			richText = true,
			text = p1.text,
			size = p1.size,
			pos = p1.pos
		}),
		LeftBorder = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(UDim.new(0, LineWidth), p1.size.Y),
			Position = UDim2.fromOffset(-ValuePadding, 0) + p1.pos,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = LineColor
		})
	})
end

function LuauHeapViewEntry.init(p1) --[[ Line: 50 ]]
	p1.state = {
		expandedEllipsis = false,
		showTooltip = false,
		expanded = p1.props.depth == 0,
		tooltipPos = UDim2.fromOffset(0, 0)
	}
	
	function p1.onButtonPress() --[[ Line: 58 ]]
		-- upvalues: p1 (copy)
		p1:setState(function(p2) --[[ Line: 59 ]]
			return { expanded = not p2.expanded }
		end)
	end
	
	function p1.onExpandEllipsis() --[[ Line: 66 ]]
		-- upvalues: p1 (copy)
		p1:setState({ expandedEllipsis = true })
	end
	
	function p1:onMouseEnter(XOffset, YOffset) --[[ Line: 72 ]]
		-- upvalues: p1 (copy)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(XOffset, YOffset)
		})
	end
	
	function p1:onMouseMove(XOffset, YOffset) --[[ Line: 79 ]]
		-- upvalues: p1 (copy)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(XOffset, YOffset)
		})
	end
	
	function p1.onMouseLeave() --[[ Line: 86 ]]
		-- upvalues: p1 (copy)
		p1:setState({ showTooltip = false })
	end
end

function LuauHeapViewEntry.renderChildren(p1, List, List1) --[[ Line: 93 ]]
	-- upvalues: RoactModule (copy), LuauHeapViewEntry (copy)
	if not p1.state.expanded then
		return {}
	end
	if #List == 0 and (List1 == nil or #List1 == 0) then
		return {}
	end
	local Elements = {}
	local TotalSize = p1.props.data.TotalSize
	local NewDepth = p1.props.depth + 1
	local NewTotalSize = 0
	local NewTotalSize1 = 0
	local Count = 0
	
	local function _(p2) --[[ Line: 117 | Named "getCompareInfo" ]]
		-- upvalues: List1 (copy)
		if List1 then
			for _, value in ipairs(List1) do
				if p2.Name == value.Name then
					return value
				end
			end
		end
		return nil
	end
	
	for _, Data in ipairs(List) do
		repeat
			if not List1 then break end
			for _, value in ipairs(List1) do
				if Data.Name == value.Name then
					local Compare = value
					break
				end
			end
			local Compare = nil
		until true
		if Data.TotalSize <= 128 and #List > 4 and not p1.state.expandedEllipsis then
			NewTotalSize += Data.TotalSize
			
			if Compare then
				NewTotalSize1 += Compare.TotalSize
			end
		else
			Count += 1
			Elements[Count] = RoactModule.createElement(LuauHeapViewEntry, {
				layoutOrder = TotalSize - Data.TotalSize,
				depth = NewDepth,
				data = Data,
				compare = Compare
			})
		end
	end
	if NewTotalSize > 0 then
		Count += 1
		Elements[Count] = RoactModule.createElement(LuauHeapViewEntry, {
			layoutOrder = TotalSize,
			depth = NewDepth,
			data = {
				Name = "...",
				Size = NewTotalSize,
				TotalSize = NewTotalSize,
				Children = {}
			},
			compare = if List1 then {
				Name = "...",
				Size = NewTotalSize1,
				TotalSize = NewTotalSize1,
				Children = {}
			} else nil,
			customButtonPress = p1.onExpandEllipsis
		})
	end
	if List1 then
		local Flag = nil
		for _, Compare in ipairs(List1) do
			Flag = false
			
			for _, value1 in ipairs(List) do
				if value1.Name == Compare.Name then
					Flag = true
					break
				end
			end
			if not Flag then
				Count += 1
				Elements[Count] = RoactModule.createElement(LuauHeapViewEntry, {
					layoutOrder = TotalSize,
					depth = NewDepth,
					data = {
						Size = 0,
						TotalSize = 0,
						Name = Compare.Name,
						Source = Compare.Source,
						Children = {}
					},
					compare = Compare
				})
			end
		end
	end
	return Elements
end

function LuauHeapViewEntry:renderValues(List) --[[ Line: 223 ]]
	-- upvalues: ValueCellWidth (copy), ValuePadding (copy), GraphEntryFrameHeight (copy), RoactModule (copy), BorderedCellLabel (copy)
	local Elements = {}
	local _UDim2 = UDim2.new(ValueCellWidth, -ValuePadding, 0, GraphEntryFrameHeight)
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

function LuauHeapViewEntry.render(p3) --[[ Line: 238 ]]
	-- upvalues: GraphEntryFrameHeight (copy), DepthIndent (copy), ValueCellWidth (copy), CellPadding (copy), RoactModule (copy), TooltipModule (copy), BannerButtonModule (copy), CellLabelModule (copy)
	local Props = p3.props
	local Depth = Props.depth
	local ScaledDepth = Depth * DepthIndent
	local Data = Props.data
	local Compare = Props.compare
	local list = {
		if Compare and Compare.TotalSize ~= Data.TotalSize then string.format("%d <font color=\"#%s\">(%s%d)</font>", Data.TotalSize, if Data.TotalSize < Compare.TotalSize then "0f0" else "f00", if Data.TotalSize < Compare.TotalSize then "" else "+", Data.TotalSize - Compare.TotalSize) else string.format("%.0f", Data.TotalSize),
		if Compare and Compare.Size ~= Data.Size then string.format("%d <font color=\"#%s\">(%s%d)</font>", Data.Size, if Data.Size < Compare.Size then "0f0" else "f00", if Data.Size < Compare.Size then "" else "+", Data.Size - Compare.Size) else string.format("%.0f", Data.Size)
	}
	local Root: string = if Depth == 0 then "<root>" else "<anonymous>"
	local Name = if Data.Name and #Data.Name ~= 0 then Data.Name else Root
	local Source = if Data.Source and #Data.Source ~= 0 then Data.Source else Name
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Props.size or UDim2.new(1, 0, 0, GraphEntryFrameHeight),
		LayoutOrder = Props.layoutOrder or 0,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		tooltip = if p3.state.showTooltip then RoactModule.createElement(TooltipModule, { text = Source, pos = p3.state.tooltipPos }) else nil,
		layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		button = RoactModule.createElement(BannerButtonModule, {
			layoutOrder = -1,
			size = UDim2.new(1, 0, 0, GraphEntryFrameHeight),
			inset = ScaledDepth,
			isExpanded = p3.state.expanded,
			isExpandable = #Data.Children ~= 0 or (if Compare == nil then Props.customButtonPress ~= nil else #Compare.Children ~= 0 or Props.customButtonPress ~= nil),
			onButtonPress = if Props.customButtonPress then Props.customButtonPress else p3.onButtonPress,
			onMouseEnter = p3.onMouseEnter,
			onMouseLeave = p3.onMouseLeave,
			onMouseMove = p3.onMouseMove
		}, {
			name = RoactModule.createElement(CellLabelModule, {
				textWrapped = false,
				text = Name,
				size = UDim2.new(UDim.new(1 - ValueCellWidth * #list, -(CellPadding + ScaledDepth)), UDim.new(1, 0)),
				pos = UDim2.new(0, CellPadding + ScaledDepth, 0, 0),
				textTruncate = Enum.TextTruncate.SplitWord
			}),
			values = RoactModule.createFragment(p3:renderValues(list))
		}),
		children = RoactModule.createFragment(p3:renderChildren(Data.Children, if Compare then Compare.Children else nil))
	})
end

return LuauHeapViewEntry