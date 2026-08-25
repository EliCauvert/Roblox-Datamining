local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local itemRowModule = require(inExperienceShop.Components.ItemRow)
local buildItemGridRows = require(inExperienceShop.Components.buildItemGridRows).buildItemGridRows
local _ = require(inExperienceShop.Types)

return function(p0)
	-- upvalues: reactModule (ref), buildItemGridRows (ref), itemRowModule (ref), view (ref)
	local itemsPerRow = p0.itemsPerRow
	local var3 = reactModule.useMemo(function()
		-- upvalues: buildItemGridRows (copy), p0 (ref), itemsPerRow (ref)
		return buildItemGridRows(p0.items, itemsPerRow, p0.isFeaturedDoubleWidthRobux)
	end, { p0.items, itemsPerRow, p0.isFeaturedDoubleWidthRobux })
	
	return reactModule.createElement(view, {
		tag = `col size-full-0 auto-y {p0.gap or "gap-medium"}`,
		LayoutOrder = p0.LayoutOrder,
		ref = p0.gridRef,
		onAbsoluteSizeChanged = if p0.onGridLayoutChange ~= nil then nil else reactModule.useCallback(function()
			-- upvalues: p0 (ref)
			if p0.onGridLayoutChange then
				p0.onGridLayoutChange()
			end
		end, { p0.onGridLayoutChange })
	}, reactModule.useMemo(function()
		-- upvalues: var3 (ref), reactModule (copy), itemRowModule (copy), itemsPerRow (ref), p0 (ref)
		local t = {}
		
		for i, v in var3 do
			t["Row" .. i] = reactModule.createElement(itemRowModule, {
				items = v,
				columnCount = itemsPerRow,
				sectionId = p0.sectionId,
				rowIndex = i,
				onItemActivated = p0.onItemActivated,
				renderTile = p0.renderTile,
				isFeaturedDoubleWidthRobux = p0.isFeaturedDoubleWidthRobux,
				LayoutOrder = i
			})
		end
		return t
	end, {
		var3, itemsPerRow, p0.sectionId, p0.onItemActivated, p0.renderTile,
		p0.isFeaturedDoubleWidthRobux
	}))
end