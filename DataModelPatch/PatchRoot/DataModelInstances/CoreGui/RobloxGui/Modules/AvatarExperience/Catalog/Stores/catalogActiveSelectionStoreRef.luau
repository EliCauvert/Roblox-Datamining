local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Stores.GetCategorySelectionStore.createCategorySelectionStore)
local Signal, Signal2 = require(game:GetService("CorePackages").Packages.Signals).createSignal(nil)
local Count = 0

return {
	activeStoreRef = Signal,
	setActiveStoreRef = function(p1)
		-- upvalues: Count (ref), Signal2 (copy)
		Count += 1
		Signal2(p1)
	end,
	publishActiveStore = function(p1): number
		-- upvalues: Count (ref), Signal2 (copy)
		Count += 1
		Signal2(p1)
		
		return Count
	end,
	releaseActiveStore = function(Count1)
		-- upvalues: Count (ref), Signal2 (copy)
		if Count == Count1 then
			Signal2(nil)
		end
	end
}