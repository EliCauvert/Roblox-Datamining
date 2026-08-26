local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local itemRowModule = require(inExperienceShop.Components.ItemRow)
local buildItemGridRows = require(inExperienceShop.Components.buildItemGridRows).buildItemGridRows
local _ = require(inExperienceShop.Types)

return function(p1)
	-- upvalues: reactModule (ref), buildItemGridRows (ref), itemRowModule (ref), view (ref)
	local itemsPerRow = p1.itemsPerRow
	local var1 = reactModule.useMemo(function()
		-- upvalues: buildItemGridRows (copy), p1 (ref), itemsPerRow (ref)
		return buildItemGridRows(p1.items, itemsPerRow, p1.isFeaturedDoubleWidthRobux)
	end, { p1.items, itemsPerRow, p1.isFeaturedDoubleWidthRobux })
	
	return reactModule.createElement(view, {
		tag = `col size-full-0 auto-y {p1.gap or "gap-medium"}`,
		LayoutOrder = p1.LayoutOrder,
		ref = p1.gridRef,
		onAbsoluteSizeChanged = if p1.onGridLayoutChange ~= nil then nil else reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			if p1.onGridLayoutChange then
				p1.onGridLayoutChange()
			end
		end, { p1.onGridLayoutChange })
	}, reactModule.useMemo(function()
		-- upvalues: var1 (ref), reactModule (copy), itemRowModule (copy), itemsPerRow (ref), p1 (ref)
		local t = {}
		
		for i, v in var1 do
			t["Row" .. i] = reactModule.createElement(itemRowModule, {
				items = v,
				columnCount = itemsPerRow,
				sectionId = p1.sectionId,
				rowIndex = i,
				onItemActivated = p1.onItemActivated,
				renderTile = p1.renderTile,
				isFeaturedDoubleWidthRobux = p1.isFeaturedDoubleWidthRobux,
				LayoutOrder = i
			})
		end
		return t
	end, {
		var1, itemsPerRow, p1.sectionId, p1.onItemActivated, p1.renderTile,
		p1.isFeaturedDoubleWidthRobux
	}))
end