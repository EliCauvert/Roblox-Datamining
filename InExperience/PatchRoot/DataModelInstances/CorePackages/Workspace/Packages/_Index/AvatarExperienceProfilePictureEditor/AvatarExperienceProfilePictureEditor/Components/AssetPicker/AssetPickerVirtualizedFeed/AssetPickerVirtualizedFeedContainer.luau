local reactModule = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent.React)
local assetPickerVirtualizedFeedViewModule = require(script.Parent.AssetPickerVirtualizedFeedView)
local useAssetPickerVirtualizedFeedViewModelModule = require(script.Parent.useAssetPickerVirtualizedFeedViewModel)

return function(value) --[[ line: 10 | named "AssetPickerVirtualizedFeedContainer" ]]
	-- upvalues: useAssetPickerVirtualizedFeedViewModelModule (ref), reactModule (ref), assetPickerVirtualizedFeedViewModule (ref)
	return reactModule.createElement(assetPickerVirtualizedFeedViewModule, useAssetPickerVirtualizedFeedViewModelModule(value))
end