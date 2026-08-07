local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local signalsModule = require(parent.Signals)
local inventoryFiltersModule = require(script.Parent.Parent.Enums.InventoryFilters)
local inventorySortsModule = require(script.Parent.Parent.Enums.InventorySorts)
local fFlagAXInventoryDurablesExpiredFilter = avatarExperienceFlagsModule.FFlagAXInventoryDurablesExpiredFilter

return function() --[[ line: 36 | named "createSortAndFiltersStore" ]]
	-- upvalues: signalsModule (ref), fFlagAXInventoryDurablesExpiredFilter (ref), inventoryFiltersModule (ref), inventorySortsModule (ref)
	local var4, var5 = signalsModule.createSignal(if fFlagAXInventoryDurablesExpiredFilter then {
		filter = inventoryFiltersModule.Active,
		sort = inventorySortsModule.Newest
	} else { sort = inventorySortsModule.Newest })
	
	return {
		getSortAndFilters = var4,
		getFiltersCount = signalsModule.createComputed(function(p0) --[[ line: 42 ]]
			-- upvalues: fFlagAXInventoryDurablesExpiredFilter (copy), var4 (ref), inventorySortsModule (copy), inventoryFiltersModule (copy)
			if fFlagAXInventoryDurablesExpiredFilter then
				local var6 = var4(p0)
				local var7 = 0
				
				if var6.sort ~= inventorySortsModule.Newest then
					var7 += 1
				end
				if var6.filter ~= inventoryFiltersModule.Active then
					var7 += 1
				end
				return var7
			else
				return if var4(p0).sort == inventorySortsModule.Newest then 0 else 1
			end
		end),
		applySortAndFilters = function(p1) --[[ line: 58 ]]
			-- upvalues: var5 (ref)
			var5(p1)
		end
	}
end