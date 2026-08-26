local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local displayModule = require(parent.Display)
local signalsModule = require(parent.Signals)
local _ = require(collectionViews.CollectionViewTypes)
local createCollectionLayoutStoreModule = require(script.Parent.createCollectionLayoutStore)

return function()
	-- upvalues: displayModule (ref), signalsModule (ref), createCollectionLayoutStoreModule (ref)
	local displayStore = displayModule.GetDisplayStore(false)
	local var1, var2 = signalsModule.createSignal(nil)
	local var3 = createCollectionLayoutStoreModule(signalsModule.createComputed(function(p1)
		-- upvalues: var1 (ref), displayStore (ref)
		local var4 = var1(p1)
		
		return var4 or displayStore.getViewportSize(p1).X
	end))
	
	return {
		getContainerWidth = var3.getContainerWidth,
		getDesignSpaceContainerWidth = var3.getDesignSpaceContainerWidth,
		getItemsPerRow = var3.getItemsPerRow,
		getNumItemsForAllCategories = var3.getNumItemsForAllCategories,
		setDefaultContentRegionWidth = var2
	}
end