local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local CellLabelModule = require(Components.CellLabel)
local BannerButtonModule = require(Components.BannerButton)
local _ = require(script.Parent.LuauHeapTypes)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local StatEntryFrameHeight = ConstantsModule.LuauHeapFormatting.StatEntryFrameHeight
local _ = ConstantsModule.LuauHeapFormatting.DepthIndent
local ValueCellWidth = ConstantsModule.LuauHeapFormatting.ValueCellWidth
local CellPadding = ConstantsModule.LuauHeapFormatting.CellPadding
local ValuePadding = ConstantsModule.LuauHeapFormatting.ValuePadding
local LuauHeapViewStatEntry = RoactModule.PureComponent:extend("LuauHeapViewStatEntry")

local function BorderedCellLabel(p1) --[[ Line: 31 ]]
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

function LuauHeapViewStatEntry:renderValues(List) --[[ Line: 49 ]]
	-- upvalues: ValueCellWidth (copy), ValuePadding (copy), StatEntryFrameHeight (copy), RoactModule (copy), BorderedCellLabel (copy)
	local Elements = {}
	local _UDim2 = UDim2.new(ValueCellWidth, -ValuePadding, 0, StatEntryFrameHeight)
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

function LuauHeapViewStatEntry.render(p1) --[[ Line: 64 ]]
	-- upvalues: StatEntryFrameHeight (copy), ValueCellWidth (copy), RoactModule (copy), BannerButtonModule (copy), CellLabelModule (copy), CellPadding (copy)
	local Props = p1.props
	local Size = Props.size or UDim2.new(1, 0, 0, StatEntryFrameHeight)
	local LayoutOrder = Props.layoutOrder or 0
	local Data = Props.data
	local Compare = Props.compare
	local Formatted = string.format("%.0f", Data.Size)
	local Formatted1 = string.format("%.0f", Data.Count)
	
	if Compare then
		if Compare.Size ~= Data.Size then
			Formatted = string.format("%d <font color=\"#%s\">(%s%d)</font>", Data.Size, if Data.Size < Compare.Size then "0f0" else "f00", if Data.Size < Compare.Size then "" else "+", Data.Size - Compare.Size)
		end
		if Compare.Count ~= Data.Count then
			Formatted1 = string.format("%d <font color=\"#%s\">(%s%d)</font>", Data.Count, if Data.Count < Compare.Count then "0f0" else "f00", if Data.Count < Compare.Count then "" else "+", Data.Count - Compare.Count)
		end
	end
	local list = { Formatted, Formatted1 }
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		LayoutOrder = LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		button = RoactModule.createElement(BannerButtonModule, {
			inset = 0,
			isExpanded = false,
			isExpandable = false,
			layoutOrder = -1,
			size = UDim2.new(1, 0, 0, StatEntryFrameHeight)
		}, {
			name = RoactModule.createElement(CellLabelModule, {
				text = Data.Name,
				size = UDim2.new(UDim.new(1 - ValueCellWidth * #list, 0), UDim.new(1, 0)),
				pos = UDim2.new(0, CellPadding, 0, 0)
			}),
			values = RoactModule.createFragment(p1:renderValues(list))
		})
	})
end

return LuauHeapViewStatEntry