local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local cellLabelModule = require(components.CellLabel)
local bannerButtonModule = require(components.BannerButton)
local _ = require(script.Parent.LuauHeapTypes)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local statEntryFrameHeight = constantsModule.LuauHeapFormatting.StatEntryFrameHeight
local _ = constantsModule.LuauHeapFormatting.DepthIndent
local valueCellWidth = constantsModule.LuauHeapFormatting.ValueCellWidth
local cellPadding = constantsModule.LuauHeapFormatting.CellPadding
local valuePadding = constantsModule.LuauHeapFormatting.ValuePadding
local luauHeapViewStatEntry = roactModule.PureComponent:extend("LuauHeapViewStatEntry")

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

function luauHeapViewStatEntry.renderValues(_, p1)
	-- upvalues: valueCellWidth (ref), valuePadding (ref), statEntryFrameHeight (ref), roactModule (ref), BorderedCellLabel (ref)
	local t = {}
	local uDim2 = UDim2.new(valueCellWidth, -valuePadding, 0, statEntryFrameHeight)
	local uDim2_1 = UDim2.new(1 - valueCellWidth * #p1, valuePadding, 0, 0)
	
	for i, v in p1 do
		t[tostring(i)] = roactModule.createElement(BorderedCellLabel, {
			text = tostring(v),
			size = uDim2,
			pos = uDim2_1 + UDim2.fromScale(valueCellWidth * (i - 1), 0)
		})
	end
	return t
end

function luauHeapViewStatEntry.render(p2)
	-- upvalues: statEntryFrameHeight (ref), valueCellWidth (ref), roactModule (ref), bannerButtonModule (ref), cellLabelModule (ref), cellPadding (ref)
	local props = p2.props
	local size = props.size or UDim2.new(1, 0, 0, statEntryFrameHeight)
	local layoutOrder = props.layoutOrder or 0
	local data = props.data
	local compare = props.compare
	local formattedText = string.format("%.0f", data.Size)
	local formattedText_1 = string.format("%.0f", data.Count)
	
	if compare then
		if compare.Size ~= data.Size then
			formattedText = string.format("%d <font color=\"#%s\">(%s%d)</font>", data.Size, if data.Size < compare.Size then "0f0" else "f00", if data.Size < compare.Size then "" else "+", data.Size - compare.Size)
		end
		if compare.Count ~= data.Count then
			formattedText_1 = string.format("%d <font color=\"#%s\">(%s%d)</font>", data.Count, if data.Count < compare.Count then "0f0" else "f00", if data.Count < compare.Count then "" else "+", data.Count - compare.Count)
		end
	end
	local list = { formattedText, formattedText_1 }
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		button = roactModule.createElement(bannerButtonModule, {
			inset = 0,
			isExpanded = false,
			isExpandable = false,
			layoutOrder = -1,
			size = UDim2.new(1, 0, 0, statEntryFrameHeight)
		}, {
			name = roactModule.createElement(cellLabelModule, {
				text = data.Name,
				size = UDim2.new(UDim.new(1 - valueCellWidth * #list, 0), UDim.new(1, 0)),
				pos = UDim2.new(0, cellPadding, 0, 0)
			}),
			values = roactModule.createFragment(p2:renderValues(list))
		})
	})
end

return luauHeapViewStatEntry