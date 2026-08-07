local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local appCompositionModule = require(parent.AppComposition)
local collectionItemSize = require(collectionViews.CollectionViewTypes).CollectionItemSize
local collectionLayoutStoreContextModule = require(collectionViews.CollectionLayoutStore.CollectionLayoutStoreContext)
local getMainCollectionLayoutStoreModule = require(collectionViews.CollectionLayoutStore.getMainCollectionLayoutStore)

return function(p0) --[[ line: 23 | named "useCollectionLayout" ]]
	-- upvalues: foundationModule (ref), collectionItemSize (ref), appCompositionModule (ref), reactModule (ref), collectionLayoutStoreContextModule (ref), getMainCollectionLayoutStoreModule (ref), signalsReactModule (ref)
	local var7 = foundationModule.Hooks.useTokens()
	p0 = p0 or collectionItemSize.Small
	local var9 = appCompositionModule.useCompositionLayout()
	local var10 = reactModule.useContext(collectionLayoutStoreContextModule) or getMainCollectionLayoutStoreModule(false)
	local var11 = signalsReactModule.useSignalState(var10.getItemsPerRow[p0])
	
	return reactModule.useMemo(function() --[[ line: 33 ]]
		-- upvalues: var9 (ref), var7 (ref), var11 (ref), var10 (ref)
		return {
			margin = var9.margin,
			gutter = var9.gutter,
			carouselPeek = var9.carouselPeek,
			verticalGap = var7.Gap.Large,
			itemsPerRow = var11,
			getContainerWidth = var10.getContainerWidth,
			getDesignSpaceContainerWidth = var10.getDesignSpaceContainerWidth
		}
	end, { var9, var11, var7, var10 })
end