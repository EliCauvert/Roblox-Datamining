local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local assetLibraryCategoryViewModule = require(script.Parent.AssetLibraryCategoryView)
local _ = require(buildExperience.Components.ModelLibrary.collectWorkspaceModels)
local useAssetLibraryStringsModule = require(script.Parent.Parent.useAssetLibraryStrings)
local useLiveWorkspaceModelsModule = require(script.Parent.Parent.useLiveWorkspaceModels)

return function(value)
	-- upvalues: useAssetLibraryStringsModule (ref), useLiveWorkspaceModelsModule (ref), reactModule (ref), assetLibraryCategoryViewModule (ref)
	local var1 = useAssetLibraryStringsModule()
	local var2 = useLiveWorkspaceModelsModule({
		isAvailable = true,
		onOpenModel = value.onOpenModel,
		dependencies = value.liveModelDependencies,
		query = value.query
	})
	
	return reactModule.createElement(assetLibraryCategoryViewModule, {
		hasMore = false,
		loadMoreFailed = false,
		presentation = "Sheet",
		title = var1.model,
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
		onRetry = var2.onRetry
	})
end