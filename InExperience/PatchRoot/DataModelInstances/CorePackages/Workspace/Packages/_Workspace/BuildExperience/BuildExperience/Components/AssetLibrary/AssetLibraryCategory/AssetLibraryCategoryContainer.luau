local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local assetLibraryCategoryViewModule = require(script.Parent.AssetLibraryCategoryView)
local useAssetLibraryCategoryViewModelModule = require(script.Parent.useAssetLibraryCategoryViewModel)

return function(value) --[[ line: 11 | named "AssetLibraryCategoryContainer" ]]
	-- upvalues: useAssetLibraryCategoryViewModelModule (ref), reactModule (ref), assetLibraryCategoryViewModule (ref)
	return reactModule.createElement(assetLibraryCategoryViewModule, useAssetLibraryCategoryViewModelModule(value))
end