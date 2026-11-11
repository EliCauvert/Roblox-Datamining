local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local FitChildrenModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.FitChildren)
local ItemListLayout = RoactModule.PureComponent:extend("ItemListLayout")
local config = {
	[FitChildrenModule.FitAxis.Height] = UDim2.new(1, 0, 0, 0),
	[FitChildrenModule.FitAxis.Width] = UDim2.new(0, 0, 1, 0),
	[FitChildrenModule.FitAxis.Both] = UDim2.new(0, 0, 0, 0)
}

local function WrappedItem(p1)
	-- upvalues: RoactModule (copy), FitChildrenModule (copy)
	return RoactModule.createElement(FitChildrenModule.FitFrame, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p1.size,
		LayoutOrder = p1.layoutOrder,
		fitAxis = p1.fitAxis
	}, { RenderedItem = p1.renderItem })
end

function ItemListLayout.render(p1)
	-- upvalues: config (copy), CryoModule (copy), RoactModule (copy), WrappedItem (copy), FitChildrenModule (copy)
	local FitAxis = p1.props.fitAxis
	local Size = p1.props.size or config[FitAxis]
	local config1 = {
		ListLayout = RoactModule.createElement("UIListLayout", (CryoModule.Dictionary.join(p1.props, {
			renderItemList = CryoModule.None,
			fitAxis = CryoModule.None,
			size = CryoModule.None,
			SortOrder = Enum.SortOrder.LayoutOrder
		})))
	}
	
	for LayoutOrder, RenderItem in ipairs(p1.props.renderItemList or {}) do
		config1["Item" .. LayoutOrder] = WrappedItem({
			layoutOrder = LayoutOrder,
			fitAxis = FitAxis,
			size = Size,
			renderItem = RenderItem
		})
	end
	return RoactModule.createElement(FitChildrenModule.FitFrame, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = Size,
		fitAxis = FitAxis
	}, config1)
end

return ItemListLayout