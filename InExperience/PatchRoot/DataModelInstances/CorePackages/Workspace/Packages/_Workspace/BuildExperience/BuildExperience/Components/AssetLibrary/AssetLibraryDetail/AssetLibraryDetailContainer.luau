local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local assetLibraryDetailViewModule = require(script.Parent.AssetLibraryDetailView)
local useAssetLibraryDetailViewModelModule = require(script.Parent.useAssetLibraryDetailViewModel)

return function(value) --[[ line: 11 | named "AssetLibraryDetailContainer" ]]
	-- upvalues: useAssetLibraryDetailViewModelModule (ref), reactModule (ref), assetLibraryDetailViewModule (ref)
	return reactModule.createElement(assetLibraryDetailViewModule, useAssetLibraryDetailViewModelModule(value))
end