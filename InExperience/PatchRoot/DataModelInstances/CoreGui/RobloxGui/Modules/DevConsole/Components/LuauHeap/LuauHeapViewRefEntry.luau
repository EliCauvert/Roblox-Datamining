local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local CellLabelModule = require(Components.CellLabel)
local BannerButtonModule = require(Components.BannerButton)
local _ = require(script.Parent.LuauHeapTypes)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local RefEntryFrameHeight = ConstantsModule.LuauHeapFormatting.RefEntryFrameHeight
local _ = ConstantsModule.LuauHeapFormatting.DepthIndent
local ValueCellWidth = ConstantsModule.LuauHeapFormatting.ValueCellWidth
local CellPadding = ConstantsModule.LuauHeapFormatting.CellPadding
local ValuePadding = ConstantsModule.LuauHeapFormatting.ValuePadding
local LuauHeapViewPathEntryModule = require(script.Parent.LuauHeapViewPathEntry)
local LuauHeapViewRefEntry = RoactModule.PureComponent:extend("LuauHeapViewRefEntry")

local function BorderedCellLabel(p1) --[[ Line: 33 ]]
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

function LuauHeapViewRefEntry.init(p1) --[[ Line: 51 ]]
	p1.state = { expanded = false }
	
	function p1.onButtonPress() --[[ Line: 56 ]]
		-- upvalues: p1 (copy)
		p1:setState(function(p2) --[[ Line: 57 ]]
			return { expanded = not p2.expanded }
		end)
	end
end

function LuauHeapViewRefEntry:renderValues(List) --[[ Line: 65 ]]
	-- upvalues: ValueCellWidth (copy), ValuePadding (copy), RefEntryFrameHeight (copy), RoactModule (copy), BorderedCellLabel (copy)
	local Elements = {}
	local _UDim2 = UDim2.new(ValueCellWidth, -ValuePadding, 0, RefEntryFrameHeight)
	local _UDim2_1 = UDim2.new(1 - ValueCellWidth * #List, ValuePadding, 0, 0)
	
	for i, value in List do
		Elements[tostring(i)] = RoactModule.createElement(BorderedCellLabel, {
			text = tostring(value),
			size = _UDim2,
			pos = _UDim2_1 + UDim2.fromScale(ValueCellWidth * (i - 1), 0)
		})
	end
	return Elements
end

function LuauHeapViewRefEntry.renderChildren(p1, Paths) --[[ Line: 80 ]]
	-- upvalues: RoactModule (copy), LuauHeapViewPathEntryModule (copy)
	local Elements = {}
	
	if p1.state.expanded and Paths and #Paths then
		for LayoutOrder, path in ipairs(Paths) do
			Elements[LayoutOrder] = RoactModule.createElement(LuauHeapViewPathEntryModule, {
				depth = 1,
				layoutOrder = LayoutOrder,
				name = `Path #{LayoutOrder}`,
				data = path
			})
		end
	end
	return Elements
end

function LuauHeapViewRefEntry.render(p2) --[[ Line: 97 ]]
	-- upvalues: RefEntryFrameHeight (copy), ValueCellWidth (copy), RoactModule (copy), BannerButtonModule (copy), CellLabelModule (copy), CellPadding (copy)
	local Props = p2.props
	local Data = Props.data
	local list = { `{Data.Count}`, `{Data.Instances}` }
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Props.size or UDim2.new(1, 0, 0, RefEntryFrameHeight),
		LayoutOrder = Props.layoutOrder or 0,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		button = RoactModule.createElement(BannerButtonModule, {
			inset = 0,
			layoutOrder = -1,
			size = UDim2.new(1, 0, 0, RefEntryFrameHeight),
			isExpanded = p2.state.expanded,
			isExpandable = Data.Paths and #Data.Paths ~= 0,
			onButtonPress = p2.onButtonPress
		}, {
			name = RoactModule.createElement(CellLabelModule, {
				text = Data.Name,
				size = UDim2.new(UDim.new(1 - ValueCellWidth * #list, 0), UDim.new(1, 0)),
				pos = UDim2.new(0, CellPadding, 0, 0)
			}),
			values = RoactModule.createFragment(p2:renderValues(list))
		}),
		children = RoactModule.createFragment(p2:renderChildren(Data.Paths))
	})
end

return LuauHeapViewRefEntry