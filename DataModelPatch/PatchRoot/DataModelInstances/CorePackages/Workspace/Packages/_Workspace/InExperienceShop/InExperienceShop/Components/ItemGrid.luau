local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local ItemRowModule = require(InExperienceShop.Components.ItemRow)
local BuildItemGridRowsFunction = require(InExperienceShop.Components.buildItemGridRows).buildItemGridRows
local _ = require(InExperienceShop.Types)

return function(Frame)
	-- upvalues: ReactModule (copy), BuildItemGridRowsFunction (copy), ItemRowModule (copy), View (copy)
	local ItemsPerRow = Frame.itemsPerRow
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: BuildItemGridRowsFunction (upval), Frame (copy), ItemsPerRow (copy)
		return BuildItemGridRowsFunction(Frame.items, ItemsPerRow, Frame.isFeaturedDoubleWidthRobux)
	end, {
		Frame.items,
		ItemsPerRow,
		Frame.isFeaturedDoubleWidthRobux
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Frame (copy)
		if Frame.onGridLayoutChange then
			Frame.onGridLayoutChange()
		end
	end, { Frame.onGridLayoutChange })
	
	return ReactModule.createElement(View, {
		tag = `col size-full-0 auto-y {Frame.gap or "gap-medium"}`,
		LayoutOrder = Frame.LayoutOrder,
		ref = Frame.gridRef,
		onAbsoluteSizeChanged = if Frame.onGridLayoutChange == nil then nil else UseResult
	}, (ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), ReactModule (upval), ItemRowModule (upval), ItemsPerRow (copy), Frame (copy)
		local Elements = {}
		
		for LayoutOrder, Items in UseMemoResult do
			Elements["Row" .. LayoutOrder] = ReactModule.createElement(ItemRowModule, {
				items = Items,
				columnCount = ItemsPerRow,
				sectionId = Frame.sectionId,
				rowIndex = LayoutOrder,
				onItemActivated = Frame.onItemActivated,
				renderTile = Frame.renderTile,
				isFeaturedDoubleWidthRobux = Frame.isFeaturedDoubleWidthRobux,
				LayoutOrder = LayoutOrder
			})
		end
		return Elements
	end, {
		UseMemoResult, ItemsPerRow, Frame.sectionId, Frame.onItemActivated,
		Frame.renderTile, Frame.isFeaturedDoubleWidthRobux
	})))
end