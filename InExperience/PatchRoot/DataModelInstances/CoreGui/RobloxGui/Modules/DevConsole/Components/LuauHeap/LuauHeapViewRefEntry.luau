local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local cellLabelModule = require(components.CellLabel)
local bannerButtonModule = require(components.BannerButton)
local _ = require(script.Parent.LuauHeapTypes)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local refEntryFrameHeight = constantsModule.LuauHeapFormatting.RefEntryFrameHeight
local _ = constantsModule.LuauHeapFormatting.DepthIndent
local valueCellWidth = constantsModule.LuauHeapFormatting.ValueCellWidth
local cellPadding = constantsModule.LuauHeapFormatting.CellPadding
local valuePadding = constantsModule.LuauHeapFormatting.ValuePadding
local luauHeapViewPathEntryModule = require(script.Parent.LuauHeapViewPathEntry)
local luauHeapViewRefEntry = roactModule.PureComponent:extend("LuauHeapViewRefEntry")

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

function luauHeapViewRefEntry.init(p1)
	p1.state = { expanded = false }
	
	function p1.onButtonPress()
		-- upvalues: p1 (ref)
		p1:setState(function(p2)
			return { expanded = not p2.expanded }
		end)
	end
end

function luauHeapViewRefEntry.renderValues(_, p3)
	-- upvalues: valueCellWidth (ref), valuePadding (ref), refEntryFrameHeight (ref), roactModule (ref), BorderedCellLabel (ref)
	local t = {}
	local uDim2 = UDim2.new(valueCellWidth, -valuePadding, 0, refEntryFrameHeight)
	local uDim2_1 = UDim2.new(1 - valueCellWidth * #p3, valuePadding, 0, 0)
	
	for i, v in p3 do
		t[tostring(i)] = roactModule.createElement(BorderedCellLabel, {
			text = tostring(v),
			size = uDim2,
			pos = uDim2_1 + UDim2.fromScale(valueCellWidth * (i - 1), 0)
		})
	end
	return t
end

function luauHeapViewRefEntry.renderChildren(p4, p5)
	-- upvalues: roactModule (ref), luauHeapViewPathEntryModule (ref)
	local t = {}
	
	if p4.state.expanded and p5 and #p5 then
		for i, v in ipairs(p5) do
			t[i] = roactModule.createElement(luauHeapViewPathEntryModule, { depth = 1, layoutOrder = i, name = `Path #{i}`, data = v })
		end
	end
	return t
end

function luauHeapViewRefEntry.render(p6)
	-- upvalues: refEntryFrameHeight (ref), valueCellWidth (ref), roactModule (ref), bannerButtonModule (ref), cellLabelModule (ref), cellPadding (ref)
	local props = p6.props
	local size = props.size or UDim2.new(1, 0, 0, refEntryFrameHeight)
	local layoutOrder = props.layoutOrder or 0
	local data = props.data
	local list = { `{data.Count}`, `{data.Instances}` }
	
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
			layoutOrder = -1,
			size = UDim2.new(1, 0, 0, refEntryFrameHeight),
			isExpanded = p6.state.expanded,
			isExpandable = data.Paths and #data.Paths ~= 0,
			onButtonPress = p6.onButtonPress
		}, {
			name = roactModule.createElement(cellLabelModule, {
				text = data.Name,
				size = UDim2.new(UDim.new(1 - valueCellWidth * #list, 0), UDim.new(1, 0)),
				pos = UDim2.new(0, cellPadding, 0, 0)
			}),
			values = roactModule.createFragment(p6:renderValues(list))
		}),
		children = roactModule.createFragment(p6:renderChildren(data.Paths))
	})
end

return luauHeapViewRefEntry