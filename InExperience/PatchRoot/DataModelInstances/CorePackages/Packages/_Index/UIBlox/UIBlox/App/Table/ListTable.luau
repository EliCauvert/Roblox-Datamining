local parent = script.Parent.Parent.Parent
local core = parent.Core
local parent_1 = parent.Parent
local tModule = require(parent_1.t)
local roactModule = require(parent_1.Roact)
local withStyleModule = require(core.Style.withStyle)
local listTable = roactModule.PureComponent:extend("ListTable")
listTable.validateProps = tModule.strictInterface({
	layoutOrder = tModule.optional(tModule.integer),
	size = tModule.optional(tModule.UDim2),
	showDividers = tModule.optional(tModule.boolean),
	dividerStartOffset = tModule.optional(tModule.number),
	anchorPoint = tModule.optional(tModule.Vector2),
	position = tModule.optional(tModule.UDim2),
	automaticSize = tModule.optional(tModule.enum(Enum.AutomaticSize)),
	cells = tModule.array(tModule.table)
})
listTable.defaultProps = { showDividers = true, dividerStartOffset = 24 }

function listTable.render(p0) --[[ line: 49 ]]
	-- upvalues: withStyleModule (ref), roactModule (ref)
	return withStyleModule(function(p1) --[[ line: 50 ]]
		-- upvalues: p0 (ref), roactModule (copy)
		local automaticSize = p0.props.automaticSize
		local size = p0.props.size or (if automaticSize then if automaticSize == Enum.AutomaticSize.X then UDim2.fromScale(0, 1) elseif automaticSize == Enum.AutomaticSize.Y then UDim2.fromScale(1, 0) elseif automaticSize == Enum.AutomaticSize.XY then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 1) else UDim2.fromScale(1, 1))
		local t = {
			ListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			})
		}
		local cells = p0.props.cells
		
		for i, v in ipairs(cells) do
			t["Cell " .. i] = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = i,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Content = v,
				Divider = p0.props.showDividers and i < #cells and roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 100,
					Size = UDim2.new(1, -p0.props.dividerStartOffset, 0, 1),
					Position = UDim2.new(0, p0.props.dividerStartOffset, 1, -1),
					BackgroundColor3 = p1.Theme.Divider.Color,
					BackgroundTransparency = p1.Theme.Divider.Transparency
				}) or nil
			})
		end
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p0.props.layoutOrder,
			Size = size,
			AutomaticSize = automaticSize,
			AnchorPoint = p0.props.anchorPoint,
			Position = p0.props.position
		}, t)
	end)
end

return listTable