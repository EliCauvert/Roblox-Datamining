local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local SignalsModule = require(Parent.Signals)
local DisplayModule = require(Parent.Display)
local CollectionItemSize = require(CollectionViews.CollectionViewTypes).CollectionItemSize

return function(p1, Callback1, Callback)
	-- upvalues: DisplayModule (copy), SignalsModule (copy), CollectionItemSize (copy)
	local GetPlatformScaleFunction = DisplayModule.GetDisplayStore(false).getPlatformScale
	local Computed = SignalsModule.createComputed(function(p2): boolean
		-- upvalues: Callback (copy)
		return Callback(p2) > 0
	end)
	local Computed1 = SignalsModule.createComputed(function(p2)
		-- upvalues: Callback (copy), p1 (copy), Callback1 (copy)
		local CallbackResult: number = Callback(p2)
		
		return if CallbackResult > 0 then CallbackResult else p1.getContainerWidth(p2) * Callback1(p2)
	end)
	local Computed2 = SignalsModule.createComputed(function(p2)
		-- upvalues: Computed1 (copy), GetPlatformScaleFunction (copy)
		return Computed1(p2) / GetPlatformScaleFunction(p2)
	end)
	local GetItemsPerRow = {}
	
	for _, value in {
		CollectionItemSize.XSmall,
		CollectionItemSize.Small,
		CollectionItemSize.Medium,
		CollectionItemSize.Large,
		CollectionItemSize.XLarge
	} do
		local GetItemsPerRowEntry = p1.getItemsPerRow[value]
		GetItemsPerRow[value] = SignalsModule.createComputed(function(p2): number
			-- upvalues: GetItemsPerRowEntry (copy), Callback1 (copy)
			return (math.max(1, (math.floor(GetItemsPerRowEntry(p2) * Callback1(p2) + 0.000001))))
		end)
	end
	return {
		getContainerWidth = Computed1,
		getDesignSpaceContainerWidth = Computed2,
		getItemsPerRow = GetItemsPerRow,
		getNumItemsForAllCategories = SignalsModule.createComputed(function(p2)
			-- upvalues: GetItemsPerRow (copy)
			local t = {}
			
			for i, value in GetItemsPerRow do
				t[i] = value(p2)
			end
			return t
		end),
		getIsContainerMeasured = Computed
	}
end