local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local RoactModule = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact)
local MoreGrid = RoactModule.PureComponent:extend("MoreGrid")
local FFlagLuaAppsDefaultSelection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppsDefaultSelection
MoreGrid.defaultProps = { layoutOrder = 1, size = UDim2.fromScale(1, 1) }
MoreGrid.validateProps = TModule.strictInterface({
	defaultFocusRef = if FFlagLuaAppsDefaultSelection then TModule.optional(TModule.callback) else nil,
	gridCellPadding = TModule.integer,
	gridCellSize = TModule.integer,
	items = TModule.table,
	layoutOrder = TModule.optional(TModule.integer),
	renderItem = TModule.callback,
	size = TModule.optional(TModule.UDim2)
})

function MoreGrid.render(p1)
	-- upvalues: RoactModule (copy), FFlagLuaAppsDefaultSelection (copy)
	local GridCellPadding = p1.props.gridCellPadding
	local GridCellSize = p1.props.gridCellSize
	local LayoutOrder = p1.props.layoutOrder
	local RenderItemFunction = p1.props.renderItem
	local Size = p1.props.size
	local _UDim2 = UDim2.fromOffset(GridCellPadding, GridCellPadding)
	local _UDim2_1 = UDim2.fromOffset(GridCellSize, GridCellSize)
	local t = {}
	
	for i, item in ipairs(p1.props.items) do
		t[i] = RenderItemFunction(item, i)
	end
	t.GridLayout = RoactModule.createElement("UIGridLayout", {
		CellPadding = _UDim2,
		CellSize = _UDim2_1,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	
	return RoactModule.createElement("Frame", {
		[RoactModule.Ref] = if FFlagLuaAppsDefaultSelection then p1.props.defaultFocusRef else nil,
		BackgroundTransparency = 1,
		LayoutOrder = LayoutOrder,
		Size = Size
	}, t)
end

return MoreGrid