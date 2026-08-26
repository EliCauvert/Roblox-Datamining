local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local signalsModule = require(parent.Signals)
local inventoryFiltersModule = require(script.Parent.Parent.Enums.InventoryFilters)
local inventorySortsModule = require(script.Parent.Parent.Enums.InventorySorts)
local fFlagAXInventoryDurablesExpiredFilter = avatarExperienceFlagsModule.FFlagAXInventoryDurablesExpiredFilter

return function()
	-- upvalues: signalsModule (ref), fFlagAXInventoryDurablesExpiredFilter (ref), inventoryFiltersModule (ref), inventorySortsModule (ref)
	local var1, var2 = signalsModule.createSignal(if fFlagAXInventoryDurablesExpiredFilter then {
		filter = inventoryFiltersModule.Active,
		sort = inventorySortsModule.Newest
	} else { sort = inventorySortsModule.Newest })
	
	return {
		getSortAndFilters = var1,
		getFiltersCount = signalsModule.createComputed(function(p1)
			-- upvalues: fFlagAXInventoryDurablesExpiredFilter (copy), var1 (ref), inventorySortsModule (copy), inventoryFiltersModule (copy)
			if fFlagAXInventoryDurablesExpiredFilter then
				local var3 = var1(p1)
				local var4 = 0
				
				if var3.sort ~= inventorySortsModule.Newest then
					var4 += 1
				end
				if var3.filter ~= inventoryFiltersModule.Active then
					var4 += 1
				end
				return var4
			else
				return if var1(p1).sort == inventorySortsModule.Newest then 0 else 1
			end
		end),
		applySortAndFilters = function(p1)
			-- upvalues: var2 (ref)
			var2(p1)
		end
	}
end