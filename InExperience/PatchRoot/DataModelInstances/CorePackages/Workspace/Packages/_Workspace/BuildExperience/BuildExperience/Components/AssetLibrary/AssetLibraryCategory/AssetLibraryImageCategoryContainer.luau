local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local assetLibraryCategoryViewModule = require(script.Parent.AssetLibraryCategoryView)
local useAssetLibraryStringsModule = require(script.Parent.Parent.useAssetLibraryStrings)
local useExperienceImagesModule = require(script.Parent.Parent.useExperienceImages)

return function(value)
	-- upvalues: useAssetLibraryStringsModule (ref), reactModule (ref), useExperienceImagesModule (ref), assetLibraryCategoryViewModule (ref)
	local var1 = useAssetLibraryStringsModule()
	local var2 = useExperienceImagesModule({
		universeId = value.universeId,
		query = reactModule.useCallback(function()
			-- upvalues: value (ref)
			return value.query
		end, { value.query }),
		iconDisplayName = var1.icon,
		thumbnailDisplayName = var1.thumbnail,
		onOpenAsset = value.onOpenAsset
	})
	
	return reactModule.createElement(assetLibraryCategoryViewModule, {
		hasMore = false,
		loadMoreFailed = false,
		title = var1.image,
		assets = var2.assets,
		status = var2.status,
		strings = {
			empty = var1.empty,
			loadError = var1.loadError,
			retry = var1.retry,
			showMore = var1.showMore
		},
		onBack = value.onBack,
		onLoadMore = function() end,
		onRetry = var2.onRetry,
		presentation = value.presentation
	})
end