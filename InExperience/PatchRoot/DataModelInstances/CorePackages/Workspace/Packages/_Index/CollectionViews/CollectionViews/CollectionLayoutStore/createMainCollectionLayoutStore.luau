local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local displayModule = require(parent.Display)
local signalsModule = require(parent.Signals)
local _ = require(collectionViews.CollectionViewTypes)
local createCollectionLayoutStoreModule = require(script.Parent.createCollectionLayoutStore)

return function()
	-- upvalues: displayModule (ref), signalsModule (ref), createCollectionLayoutStoreModule (ref)
	local displayStore = displayModule.GetDisplayStore(false)
	local var5, var6 = signalsModule.createSignal(nil)
	local var7 = createCollectionLayoutStoreModule(signalsModule.createComputed(function(p0)
		-- upvalues: var5 (ref), displayStore (ref)
		local var8 = var5(p0)
		
		return var8 or displayStore.getViewportSize(p0).X
	end))
	
	return {
		getContainerWidth = var7.getContainerWidth,
		getDesignSpaceContainerWidth = var7.getDesignSpaceContainerWidth,
		getItemsPerRow = var7.getItemsPerRow,
		getNumItemsForAllCategories = var7.getNumItemsForAllCategories,
		setDefaultContentRegionWidth = var6
	}
end