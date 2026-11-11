local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local DisplayModule = require(Parent.Display)
local SignalsModule = require(Parent.Signals)
local _ = require(CollectionViews.CollectionViewTypes)
local CreateCollectionLayoutStoreModule = require(script.Parent.createCollectionLayoutStore)

return function()
	-- upvalues: DisplayModule (copy), SignalsModule (copy), CreateCollectionLayoutStoreModule (copy)
	local DisplayStore = DisplayModule.GetDisplayStore(false)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local CollectionLayoutStoreModule = CreateCollectionLayoutStoreModule((SignalsModule.createComputed(function(p1)
		-- upvalues: Signal (copy), DisplayStore (copy)
		local SignalResult = Signal(p1)
		
		return if SignalResult then SignalResult else DisplayStore.getViewportSize(p1).X
	end)))
	
	return {
		getContainerWidth = CollectionLayoutStoreModule.getContainerWidth,
		getDesignSpaceContainerWidth = CollectionLayoutStoreModule.getDesignSpaceContainerWidth,
		getItemsPerRow = CollectionLayoutStoreModule.getItemsPerRow,
		getNumItemsForAllCategories = CollectionLayoutStoreModule.getNumItemsForAllCategories,
		setDefaultContentRegionWidth = Signal2
	}
end