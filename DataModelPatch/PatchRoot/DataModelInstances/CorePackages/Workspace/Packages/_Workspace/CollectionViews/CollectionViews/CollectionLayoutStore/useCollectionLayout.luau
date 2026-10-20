local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local AppCompositionModule = require(Parent.AppComposition)
local CollectionItemSize = require(CollectionViews.CollectionViewTypes).CollectionItemSize
local CollectionLayoutStoreContextModule = require(CollectionViews.CollectionLayoutStore.CollectionLayoutStoreContext)
local GetMainCollectionLayoutStoreModule = require(CollectionViews.CollectionLayoutStore.getMainCollectionLayoutStore)

return function(p1)
	-- upvalues: FoundationModule (copy), CollectionItemSize (copy), AppCompositionModule (copy), ReactModule (copy), CollectionLayoutStoreContextModule (copy), GetMainCollectionLayoutStoreModule (copy), SignalsReactModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local P0 = p1 or CollectionItemSize.Small
	local UseCompositionLayoutResult = AppCompositionModule.useCompositionLayout()
	local UseContextResult = ReactModule.useContext(CollectionLayoutStoreContextModule) or GetMainCollectionLayoutStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseContextResult.getItemsPerRow[P0])
	
	return ReactModule.useMemo(function()
		-- upvalues: UseCompositionLayoutResult (copy), UseTokensResult (copy), UseSignalStateResult (copy), UseContextResult (copy)
		return {
			margin = UseCompositionLayoutResult.margin,
			gutter = UseCompositionLayoutResult.gutter,
			carouselPeek = UseCompositionLayoutResult.carouselPeek,
			verticalGap = UseTokensResult.Gap.Large,
			itemsPerRow = UseSignalStateResult,
			getContainerWidth = UseContextResult.getContainerWidth,
			getDesignSpaceContainerWidth = UseContextResult.getDesignSpaceContainerWidth
		}
	end, {
		UseCompositionLayoutResult,
		UseSignalStateResult,
		UseTokensResult,
		UseContextResult
	})
end