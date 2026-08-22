local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.DataSource)
local placementTypesModule = require(viewRecycler.Core.Placement.PlacementTypes)
local recordModule = require(viewRecycler.Internal.Record)
local _ = require(viewRecycler.Core.Types)
local buildPlacementPlanModule = require(viewRecycler.Core.PinnedItems.buildPlacementPlan)
local stickyIndexResolverModule = require(viewRecycler.Core.PinnedItems.StickyIndexResolver)
local frozen = table.freeze({ "key", "value", "itemViewType" })

local function _(p0, p1) --[[ line: 45 | named "sameItem" ]]
	-- upvalues: recordModule (ref), frozen (ref)
	return if p0 ~= p1 then p0 ~= nil and (p1 ~= nil and recordModule.containsEqual(p0, p1, frozen)) else true
end

return function(p2, p3) --[[ line: 49 | named "createPinnedItemPlanner" ]]
	-- upvalues: stickyIndexResolverModule (ref), recordModule (ref), frozen (ref), buildPlacementPlanModule (ref), placementTypesModule (ref)
	local var6 = p3
	local var7 = stickyIndexResolverModule(p2, var6.isItemStickyHeader)
	local t = { revision = 1, length = 0, item = var6.pinnedStartItem }
	local t_1 = { revision = 1, length = 0, item = var6.pinnedEndItem }
	
	local function _(value, p4) --[[ line: 66 | named "setItem" ]]
		-- upvalues: recordModule (copy), frozen (copy)
		local item = value.item
		
		if if item ~= p4 then item ~= nil and (p4 ~= nil and recordModule.containsEqual(item, p4, frozen)) else true then
			return false
		end
		value.item = p4
		value.revision += 1
		value.length = 0
		
		return true
	end
	
	local _ = function(p5, p6) --[[ line: 83 | named "resolvedItem" ]]
		local item = p5.item
		
		return if item == nil then nil else {
			key = item.key,
			value = item.value,
			itemViewType = item.itemViewType,
			revision = p5.revision,
			length = p5.length,
			position = p6
		}
	end
	
	return {
		getContentInsets = function() --[[ line: 76 ]]
			-- upvalues: t (ref), t_1 (ref)
			return {
				start = if t.item == nil then 0 else t.length,
				finish = if t_1.item == nil then 0 else t_1.length
			}
		end,
		update = function(p7) --[[ line: 103 ]]
			-- upvalues: var7 (ref), buildPlacementPlanModule (copy), t (ref), placementTypesModule (copy), t_1 (ref)
			var7.setDataSource(p7.dataSource)
			local t_2 = {
				dataSource = p7.dataSource,
				layout = p7.layout,
				stickyIndices = var7.resolve(),
				scrollOffset = p7.scrollOffset,
				viewportLength = p7.viewportLength,
				contentStartOffset = p7.contentStartOffset
			}
			local item = t.item
			t_2.pinnedStartItem = if item == nil then nil else {
				key = item.key,
				value = item.value,
				itemViewType = item.itemViewType,
				revision = t.revision,
				length = t.length,
				position = placementTypesModule.PinnedPosition.Start
			}
			local item_1 = t_1.item
			t_2.pinnedEndItem = if item_1 == nil then nil else {
				key = item_1.key,
				value = item_1.value,
				itemViewType = item_1.itemViewType,
				revision = t_1.revision,
				length = t_1.length,
				position = placementTypesModule.PinnedPosition.Finish
			}
			
			return buildPlacementPlanModule(t_2)
		end,
		applyDataSourceChange = function(p8) --[[ line: 116 ]]
			-- upvalues: var7 (ref)
			var7.applyDataSourceChange(p8)
		end,
		updatePinnedMeasurement = function(p9, p10, p11, p12) --[[ line: 119 ]]
			-- upvalues: placementTypesModule (copy), t (ref), t_1 (ref)
			assert(p12 >= 0 and p12 < 1e999, "PinnedItems: measured length must be finite and non-negative")
			local var11 = if p9 == placementTypesModule.PinnedPosition.Start then t else t_1
			local item = var11.item
			
			if item == nil or item.key ~= p10 or (var11.revision ~= p11 or var11.length == p12) then
				return nil
			end
			var11.length = p12
			
			return {
				start = if t.item == nil then 0 else t.length,
				finish = if t_1.item == nil then 0 else t_1.length
			}
		end,
		setOptions = function(value) --[[ line: 129 ]]
			-- upvalues: var6 (write), var7 (ref), t (ref), recordModule (copy), frozen (copy), t_1 (ref)
			local var13
			var6 = value
			local var12 = var7.setPredicate(value.isItemStickyHeader)
			local pinnedStartItem = value.pinnedStartItem
			local item = t.item
			
			if if item ~= pinnedStartItem then item ~= nil and (pinnedStartItem ~= nil and recordModule.containsEqual(item, pinnedStartItem, frozen)) else true then
				var13 = false
			else
				t.item = pinnedStartItem
				t.revision += 1
				t.length = 0
				var13 = true
			end
			local var14
			var12 = var13 or var12
			local pinnedEndItem = value.pinnedEndItem
			local item_1 = t_1.item
			
			if if item_1 ~= pinnedEndItem then item_1 ~= nil and (pinnedEndItem ~= nil and recordModule.containsEqual(item_1, pinnedEndItem, frozen)) else true then
				var14 = false
			else
				t_1.item = pinnedEndItem
				t_1.revision += 1
				t_1.length = 0
				var14 = true
			end
			return var14 or var12
		end,
		setDataSource = var7.setDataSource,
		destroy = function() --[[ line: 137 ]] end
	}
end