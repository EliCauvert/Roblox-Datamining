local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local CellLabelModule = require(Components.CellLabel)
local BannerButtonModule = require(Components.BannerButton)
local _ = require(script.Parent.LuauHeapTypes)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local _ = ConstantsModule.GeneralFormatting.LineWidth
local _ = ConstantsModule.GeneralFormatting.LineColor
local PathEntryFrameHeight = ConstantsModule.LuauHeapFormatting.PathEntryFrameHeight
local DepthIndent = ConstantsModule.LuauHeapFormatting.DepthIndent
local _ = ConstantsModule.LuauHeapFormatting.ValueCellWidth
local CellPadding = ConstantsModule.LuauHeapFormatting.CellPadding
local _ = ConstantsModule.LuauHeapFormatting.ValuePadding
local LuauHeapViewPathEntry = RoactModule.PureComponent:extend("LuauHeapViewPathEntry")

function LuauHeapViewPathEntry.init(p1) --[[ Line: 25 ]]
	p1.state = { expanded = false }
	
	function p1.onButtonPress() --[[ Line: 30 ]]
		-- upvalues: p1 (copy)
		p1:setState(function(p2) --[[ Line: 31 ]]
			return { expanded = not p2.expanded }
		end)
	end
end

function LuauHeapViewPathEntry.renderChildren(p1, List) --[[ Line: 39 ]]
	-- upvalues: DepthIndent (copy), CellPadding (copy), RoactModule (copy), CellLabelModule (copy), PathEntryFrameHeight (copy)
	local Elements = {}
	local NewDepthIndent = 2 * DepthIndent + CellPadding
	
	if p1.state.expanded and List and #List then
		for LayoutOrder, Text in ipairs(List) do
			Elements[LayoutOrder] = RoactModule.createElement(CellLabelModule, {
				text = Text,
				layoutOrder = LayoutOrder,
				size = UDim2.new(UDim.new(1, -NewDepthIndent), UDim.new(0, PathEntryFrameHeight)),
				pos = UDim2.new(0, NewDepthIndent, 0, 0)
			})
		end
	end
	return Elements
end

function LuauHeapViewPathEntry.render(p2) --[[ Line: 58 ]]
	-- upvalues: PathEntryFrameHeight (copy), DepthIndent (copy), RoactModule (copy), BannerButtonModule (copy), CellLabelModule (copy), CellPadding (copy)
	local Props = p2.props
	local Data = Props.data
	local ScaledDepth = Props.depth * DepthIndent
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Props.size or UDim2.new(1, 0, 0, PathEntryFrameHeight),
		LayoutOrder = Props.layoutOrder or 0,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		button = RoactModule.createElement(BannerButtonModule, {
			layoutOrder = -1,
			size = UDim2.new(1, 0, 0, PathEntryFrameHeight),
			inset = ScaledDepth,
			isExpanded = p2.state.expanded,
			isExpandable = #Data ~= 0,
			onButtonPress = p2.onButtonPress
		}, {
			name = RoactModule.createElement(CellLabelModule, {
				text = Props.name,
				size = UDim2.new(UDim.new(1, -ScaledDepth), UDim.new(1, 0)),
				pos = UDim2.new(0, CellPadding + ScaledDepth, 0, 0)
			})
		}),
		children = RoactModule.createFragment(p2:renderChildren(Data))
	})
end

return LuauHeapViewPathEntry