local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.Virtualizer.ItemSequence)
local _ = require(viewRecycler.Core.Layout)
local placementTypesModule = require(viewRecycler.Core.Placement.PlacementTypes)
local shallowTableModule = require(viewRecycler.Internal.ShallowTable)
local _ = require(viewRecycler.Core.Types)
local buildPlacementPlanModule = require(viewRecycler.Core.PinnedItems.buildPlacementPlan)
local stickyIndexResolverModule = require(viewRecycler.Core.PinnedItems.StickyIndexResolver)
local frozen = table.freeze({ "key" })

local function _(p1, p2)
	-- upvalues: shallowTableModule (ref), frozen (ref)
	return if p1 ~= p2 then p1 ~= nil and (p2 ~= nil and shallowTableModule.containsEqual(p1, p2, frozen)) else true
end

return function(p1, p2)
	-- upvalues: stickyIndexResolverModule (ref), shallowTableModule (ref), frozen (ref), buildPlacementPlanModule (ref), placementTypesModule (ref)
	local var1 = p2
	local var2 = stickyIndexResolverModule(p1, var1.isItemStickyKey)
	local t = { revision = 1, length = 0, item = var1.pinnedStartItem }
	local t_1 = { revision = 1, length = 0, item = var1.pinnedEndItem }
	
	local function _(value, p3)
		-- upvalues: shallowTableModule (copy), frozen (copy)
		local item = value.item
		
		if if item ~= p3 then item ~= nil and (p3 ~= nil and shallowTableModule.containsEqual(item, p3, frozen)) else true then
			return false
		end
		value.item = p3
		value.revision += 1
		value.length = 0
		
		return true
	end
	
	local _ = function(p3, p4)
		local item = p3.item
		
		return if item == nil then nil else {
			key = item.key,
			revision = p3.revision,
			length = p3.length,
			position = p4
		}
	end
	
	return {
		getContentInsets = function()
			-- upvalues: t (ref), t_1 (ref)
			return {
				start = if t.item == nil then 0 else t.length,
				finish = if t_1.item == nil then 0 else t_1.length
			}
		end,
		update = function(p3)
			-- upvalues: var2 (ref), t (ref), buildPlacementPlanModule (copy), placementTypesModule (copy), t_1 (ref)
			var2.setItemSequence(p3.itemSequence)
			local var3 = if t.item == nil then 0 else t.length
			local var4, var5 = var2.resolveActive(function(p4)
				-- upvalues: p3 (ref), var3 (ref)
				return p3.layout.getItemLayout(p4).startOffset + p3.contentStartOffset - p3.scrollOffset < var3
			end)
			local t_2 = {
				itemSequence = p3.itemSequence,
				layout = p3.layout,
				activeStickyIndex = var4,
				nextStickyIndex = var5,
				scrollOffset = p3.scrollOffset,
				viewportLength = p3.viewportLength,
				contentStartOffset = p3.contentStartOffset
			}
			local item = t.item
			t_2.pinnedStartItem = if item == nil then nil else {
				key = item.key,
				revision = t.revision,
				length = t.length,
				position = placementTypesModule.PinnedPosition.Start
			}
			local item_1 = t_1.item
			t_2.pinnedEndItem = if item_1 == nil then nil else {
				key = item_1.key,
				revision = t_1.revision,
				length = t_1.length,
				position = placementTypesModule.PinnedPosition.Finish
			}
			
			return buildPlacementPlanModule(t_2)
		end,
		applyDataSourceChange = function(p3)
			-- upvalues: var2 (ref)
			var2.applyDataSourceChange(p3)
		end,
		updatePinnedMeasurement = function(p3, p4, p5, p6)
			-- upvalues: placementTypesModule (copy), t (ref), t_1 (ref)
			assert(p6 >= 0 and p6 < 1e999, "PinnedItems: measured length must be finite and non-negative")
			local var3 = if p3 == placementTypesModule.PinnedPosition.Start then t else t_1
			local item = var3.item
			
			if item == nil or item.key ~= p4 or (var3.revision ~= p5 or var3.length == p6) then
				return nil
			end
			var3.length = p6
			
			return {
				start = if t.item == nil then 0 else t.length,
				finish = if t_1.item == nil then 0 else t_1.length
			}
		end,
		setOptions = function(value)
			-- upvalues: var1 (write), var2 (ref), t (ref), shallowTableModule (copy), frozen (copy), t_1 (ref)
			local var3
			var1 = value
			local var4 = var2.setPredicate(value.isItemStickyKey)
			local pinnedStartItem = value.pinnedStartItem
			local item = t.item
			
			if if item ~= pinnedStartItem then item ~= nil and (pinnedStartItem ~= nil and shallowTableModule.containsEqual(item, pinnedStartItem, frozen)) else true then
				var3 = false
			else
				t.item = pinnedStartItem
				t.revision += 1
				t.length = 0
				var3 = true
			end
			local var5
			var4 = var3 or var4
			local pinnedEndItem = value.pinnedEndItem
			local item_1 = t_1.item
			
			if if item_1 ~= pinnedEndItem then item_1 ~= nil and (pinnedEndItem ~= nil and shallowTableModule.containsEqual(item_1, pinnedEndItem, frozen)) else true then
				var5 = false
			else
				t_1.item = pinnedEndItem
				t_1.revision += 1
				t_1.length = 0
				var5 = true
			end
			return var5 or var4
		end,
		setItemSequence = var2.setItemSequence,
		destroy = function() end
	}
end