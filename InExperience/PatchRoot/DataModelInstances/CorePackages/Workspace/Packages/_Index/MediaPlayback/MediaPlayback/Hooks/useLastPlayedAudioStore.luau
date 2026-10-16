local MediaPlayback = script:FindFirstAncestor("MediaPlayback")
local _ = require(MediaPlayback.Stores.getAudioPlaybackStore.types)
local GetAudioPlaybackStoreModule = require(MediaPlayback.Stores.getAudioPlaybackStore)
local UseAudioStoreModule = require(MediaPlayback.Hooks.useAudioStore)
local UseSignalStateFunction = require(MediaPlayback.Parent.SignalsReact).useSignalState

return function() --[[ Line: 11 | Named "useLastPlayedAudioStore" ]]
	-- upvalues: UseSignalStateFunction (copy), GetAudioPlaybackStoreModule (copy), UseAudioStoreModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(UseSignalStateFunction(GetAudioPlaybackStoreModule).getLastPlayedAudioStore)
	
	return UseAudioStoreModule(if UseSignalStateResult then UseSignalStateResult.assetId else nil, if UseSignalStateResult then UseSignalStateResult.usePreview else nil)
end