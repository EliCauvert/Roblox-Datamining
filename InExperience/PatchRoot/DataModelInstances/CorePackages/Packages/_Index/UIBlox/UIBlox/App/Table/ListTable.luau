local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local TModule = require(Parent1.t)
local RoactModule = require(Parent1.Roact)
local WithStyleModule = require(Parent.Core.Style.withStyle)
local ListTable = RoactModule.PureComponent:extend("ListTable")
ListTable.validateProps = TModule.strictInterface({
	layoutOrder = TModule.optional(TModule.integer),
	size = TModule.optional(TModule.UDim2),
	showDividers = TModule.optional(TModule.boolean),
	dividerStartOffset = TModule.optional(TModule.number),
	anchorPoint = TModule.optional(TModule.Vector2),
	position = TModule.optional(TModule.UDim2),
	automaticSize = TModule.optional(TModule.enum(Enum.AutomaticSize)),
	cells = TModule.array(TModule.table)
})
ListTable.defaultProps = { showDividers = true, dividerStartOffset = 24 }

function ListTable.render(p1) --[[ Line: 49 ]]
	-- upvalues: WithStyleModule (copy), RoactModule (copy)
	return WithStyleModule(function(p2) --[[ Line: 50 ]]
		-- upvalues: p1 (copy), RoactModule (upval)
		local Size = p1.props.size
		local AutomaticSize = p1.props.automaticSize
		
		if not Size then
			Size = if AutomaticSize then if AutomaticSize == Enum.AutomaticSize.X then UDim2.fromScale(0, 1) elseif AutomaticSize == Enum.AutomaticSize.Y then UDim2.fromScale(1, 0) elseif AutomaticSize == Enum.AutomaticSize.XY then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 1) else UDim2.fromScale(1, 1)
		end
		local config = {
			ListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			})
		}
		local Cells = p1.props.cells
		
		for LayoutOrder, cell in ipairs(Cells) do
			config["Cell " .. LayoutOrder] = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = LayoutOrder,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Content = cell,
				Divider = p1.props.showDividers and LayoutOrder < #Cells and RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 100,
					Size = UDim2.new(1, -p1.props.dividerStartOffset, 0, 1),
					Position = UDim2.new(0, p1.props.dividerStartOffset, 1, -1),
					BackgroundColor3 = p2.Theme.Divider.Color,
					BackgroundTransparency = p2.Theme.Divider.Transparency
				}) or nil
			})
		end
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.layoutOrder,
			Size = Size,
			AutomaticSize = AutomaticSize,
			AnchorPoint = p1.props.anchorPoint,
			Position = p1.props.position
		}, config)
	end)
end

return ListTable