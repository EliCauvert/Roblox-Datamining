local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local cellLabelModule = require(components.CellLabel)
local bannerButtonModule = require(components.BannerButton)
local _ = require(script.Parent.LuauHeapTypes)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local _ = constantsModule.GeneralFormatting.LineWidth
local _ = constantsModule.GeneralFormatting.LineColor
local pathEntryFrameHeight = constantsModule.LuauHeapFormatting.PathEntryFrameHeight
local depthIndent = constantsModule.LuauHeapFormatting.DepthIndent
local _ = constantsModule.LuauHeapFormatting.ValueCellWidth
local cellPadding = constantsModule.LuauHeapFormatting.CellPadding
local _ = constantsModule.LuauHeapFormatting.ValuePadding
local luauHeapViewPathEntry = roactModule.PureComponent:extend("LuauHeapViewPathEntry")

function luauHeapViewPathEntry.init(p1)
	p1.state = { expanded = false }
	
	function p0.onButtonPress()
		-- upvalues: p1 (ref)
		p1:setState(function(p2)
			return { expanded = not p2.expanded }
		end)
	end
end

function luauHeapViewPathEntry.renderChildren(p1, p2)
	-- upvalues: depthIndent (ref), cellPadding (ref), roactModule (ref), cellLabelModule (ref), pathEntryFrameHeight (ref)
	local t = {}
	local var1 = 2 * depthIndent + cellPadding
	
	if p1.state.expanded and p2 and #p2 then
		for i, v in ipairs(p2) do
			t[i] = roactModule.createElement(cellLabelModule, {
				text = v,
				layoutOrder = i,
				size = UDim2.new(UDim.new(1, -var1), UDim.new(0, pathEntryFrameHeight)),
				pos = UDim2.new(0, var1, 0, 0)
			})
		end
	end
	return t
end

function luauHeapViewPathEntry.render(p3)
	-- upvalues: pathEntryFrameHeight (ref), depthIndent (ref), roactModule (ref), bannerButtonModule (ref), cellLabelModule (ref), cellPadding (ref)
	local props = p3.props
	local size = props.size or UDim2.new(1, 0, 0, pathEntryFrameHeight)
	local layoutOrder = props.layoutOrder or 0
	local name = props.name
	local data = props.data
	local var2 = props.depth * depthIndent
	
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
			layoutOrder = -1,
			size = UDim2.new(1, 0, 0, pathEntryFrameHeight),
			inset = var2,
			isExpanded = p3.state.expanded,
			isExpandable = #data ~= 0,
			onButtonPress = p3.onButtonPress
		}, {
			name = roactModule.createElement(cellLabelModule, {
				text = name,
				size = UDim2.new(UDim.new(1, -var2), UDim.new(1, 0)),
				pos = UDim2.new(0, cellPadding + var2, 0, 0)
			})
		}),
		children = roactModule.createFragment(p3:renderChildren(data))
	})
end

return luauHeapViewPathEntry