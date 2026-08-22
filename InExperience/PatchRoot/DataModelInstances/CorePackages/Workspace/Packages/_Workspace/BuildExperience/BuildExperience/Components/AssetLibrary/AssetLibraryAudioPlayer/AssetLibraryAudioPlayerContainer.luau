local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local assetLibraryAudioPlayerViewModule = require(script.Parent.AssetLibraryAudioPlayerView)
local useAssetLibraryAudioPlayerViewModelModule = require(script.Parent.useAssetLibraryAudioPlayerViewModel)

return function(value) --[[ line: 11 | named "AssetLibraryAudioPlayerContainer" ]]
	-- upvalues: useAssetLibraryAudioPlayerViewModelModule (ref), reactModule (ref), assetLibraryAudioPlayerViewModule (ref)
	return reactModule.createElement(assetLibraryAudioPlayerViewModule, useAssetLibraryAudioPlayerViewModelModule(value))
end