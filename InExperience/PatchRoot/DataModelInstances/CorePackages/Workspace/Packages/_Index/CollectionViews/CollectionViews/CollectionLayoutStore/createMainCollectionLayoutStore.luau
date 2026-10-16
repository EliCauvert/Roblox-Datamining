local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local DisplayModule = require(Parent.Display)
local SignalsModule = require(Parent.Signals)
local _ = require(CollectionViews.CollectionViewTypes)
local CreateCollectionLayoutStoreModule = require(script.Parent.createCollectionLayoutStore)
local FFlagEnableHomePageSduiPrefetch = require(Parent.SharedFlags).FFlagEnableHomePageSduiPrefetch

return function() --[[ Line: 20 | Named "createMainCollectionLayoutStore" ]]
	-- upvalues: DisplayModule (copy), SignalsModule (copy), FFlagEnableHomePageSduiPrefetch (copy), CreateCollectionLayoutStoreModule (copy)
	local DisplayStore = DisplayModule.GetDisplayStore(false)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local CollectionLayoutStoreModule = CreateCollectionLayoutStoreModule((SignalsModule.createComputed(function(p1) --[[ Line: 25 ]]
		-- upvalues: Signal (copy), DisplayStore (copy)
		local SignalResult = Signal(p1)
		
		return if SignalResult then SignalResult else DisplayStore.getViewportSize(p1).X
	end)))
	
	return {
		getContainerWidth = CollectionLayoutStoreModule.getContainerWidth,
		getDesignSpaceContainerWidth = CollectionLayoutStoreModule.getDesignSpaceContainerWidth,
		getItemsPerRow = CollectionLayoutStoreModule.getItemsPerRow,
		getNumItemsForAllCategories = CollectionLayoutStoreModule.getNumItemsForAllCategories,
		getIsContainerMeasured = if FFlagEnableHomePageSduiPrefetch then SignalsModule.createComputed(function(p1): boolean --[[ Line: 38 ]]
			-- upvalues: Signal (copy)
			local SignalResult: number = Signal(p1)
			
			return SignalResult ~= nil and SignalResult > 0
		end) else nil,
		setDefaultContentRegionWidth = Signal2
	}
end