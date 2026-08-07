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

function luauHeapViewPathEntry.init(p0) --[[ line: 25 ]]
	p0.state = { expanded = false }
	
	function p0.onButtonPress() --[[ line: 30 ]]
		-- upvalues: p0 (ref)
		p0:setState(function(p1) --[[ line: 31 ]]
			return { expanded = not p1.expanded }
		end)
	end
end

function luauHeapViewPathEntry.renderChildren(p2, p3) --[[ line: 39 ]]
	-- upvalues: depthIndent (ref), cellPadding (ref), roactModule (ref), cellLabelModule (ref), pathEntryFrameHeight (ref)
	local t = {}
	local var6 = 2 * depthIndent + cellPadding
	
	if p2.state.expanded and p3 and #p3 then
		for i, v in ipairs(p3) do
			t[i] = roactModule.createElement(cellLabelModule, {
				text = v,
				layoutOrder = i,
				size = UDim2.new(UDim.new(1, -var6), UDim.new(0, pathEntryFrameHeight)),
				pos = UDim2.new(0, var6, 0, 0)
			})
		end
	end
	return t
end

function luauHeapViewPathEntry.render(p4) --[[ line: 58 ]]
	-- upvalues: pathEntryFrameHeight (ref), depthIndent (ref), roactModule (ref), bannerButtonModule (ref), cellLabelModule (ref), cellPadding (ref)
	local props = p4.props
	local size = props.size or UDim2.new(1, 0, 0, pathEntryFrameHeight)
	local layoutOrder = props.layoutOrder or 0
	local name = props.name
	local data = props.data
	local var9 = props.depth * depthIndent
	
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
			inset = var9,
			isExpanded = p4.state.expanded,
			isExpandable = #data ~= 0,
			onButtonPress = p4.onButtonPress
		}, {
			name = roactModule.createElement(cellLabelModule, {
				text = name,
				size = UDim2.new(UDim.new(1, -var9), UDim.new(1, 0)),
				pos = UDim2.new(0, cellPadding + var9, 0, 0)
			})
		}),
		children = roactModule.createFragment(p4:renderChildren(data))
	})
end

return luauHeapViewPathEntry