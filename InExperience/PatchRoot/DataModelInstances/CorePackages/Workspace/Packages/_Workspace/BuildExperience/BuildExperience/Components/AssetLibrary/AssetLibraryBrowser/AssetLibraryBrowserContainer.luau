local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local assetLibraryBrowserViewModule = require(script.Parent.AssetLibraryBrowserView)
local useAssetLibraryBrowserViewModelModule = require(script.Parent.useAssetLibraryBrowserViewModel)

return function(value) --[[ line: 11 | named "AssetLibraryBrowserContainer" ]]
	-- upvalues: useAssetLibraryBrowserViewModelModule (ref), reactModule (ref), assetLibraryBrowserViewModule (ref)
	return reactModule.createElement(assetLibraryBrowserViewModule, useAssetLibraryBrowserViewModelModule(value))
end