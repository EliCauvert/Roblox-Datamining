local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local SignalsModule = require(Parent.Signals)
local InventoryFiltersModule = require(script.Parent.Parent.Enums.InventoryFilters)
local InventorySortsModule = require(script.Parent.Parent.Enums.InventorySorts)
local FFlagAXInventoryDurablesExpiredFilter = require(Parent.AvatarExperienceFlags).FFlagAXInventoryDurablesExpiredFilter

return function()
	-- upvalues: SignalsModule (copy), FFlagAXInventoryDurablesExpiredFilter (copy), InventoryFiltersModule (copy), InventorySortsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(if FFlagAXInventoryDurablesExpiredFilter then {
		filter = InventoryFiltersModule.Active,
		sort = InventorySortsModule.Newest
	} else { sort = InventorySortsModule.Newest })
	
	return {
		getSortAndFilters = Signal,
		getFiltersCount = SignalsModule.createComputed(function(p1): number
			-- upvalues: FFlagAXInventoryDurablesExpiredFilter (upval), Signal (copy), InventorySortsModule (upval), InventoryFiltersModule (upval)
			if not FFlagAXInventoryDurablesExpiredFilter then
				return if Signal(p1).sort == InventorySortsModule.Newest then 0 else 1
			end
			local SignalResult = Signal(p1)
			local Count = 0
			
			if SignalResult.sort ~= InventorySortsModule.Newest then
				Count += 1
			end
			if SignalResult.filter ~= InventoryFiltersModule.Active then
				Count += 1
			end
			return Count
		end),
		applySortAndFilters = function(p1)
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end
	}
end