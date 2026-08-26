local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local appCompositionModule = require(parent.AppComposition)
local collectionItemSize = require(collectionViews.CollectionViewTypes).CollectionItemSize
local collectionLayoutStoreContextModule = require(collectionViews.CollectionLayoutStore.CollectionLayoutStoreContext)
local getMainCollectionLayoutStoreModule = require(collectionViews.CollectionLayoutStore.getMainCollectionLayoutStore)

return function(p1)
	-- upvalues: foundationModule (ref), collectionItemSize (ref), appCompositionModule (ref), reactModule (ref), collectionLayoutStoreContextModule (ref), getMainCollectionLayoutStoreModule (ref), signalsReactModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	p1 = p1 or collectionItemSize.Small
	local var2 = appCompositionModule.useCompositionLayout()
	local var3 = reactModule.useContext(collectionLayoutStoreContextModule) or getMainCollectionLayoutStoreModule(false)
	local var4 = signalsReactModule.useSignalState(var3.getItemsPerRow[p1])
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (ref), var1 (ref), var4 (ref), var3 (ref)
		return {
			margin = var2.margin,
			gutter = var2.gutter,
			carouselPeek = var2.carouselPeek,
			verticalGap = var1.Gap.Large,
			itemsPerRow = var4,
			getContainerWidth = var3.getContainerWidth,
			getDesignSpaceContainerWidth = var3.getDesignSpaceContainerWidth
		}
	end, { var2, var4, var1, var3 })
end