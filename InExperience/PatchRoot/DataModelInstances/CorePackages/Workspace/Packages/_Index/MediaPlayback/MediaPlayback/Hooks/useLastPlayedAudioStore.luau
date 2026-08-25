local mediaPlayback = script:FindFirstAncestor("MediaPlayback")
local signalsReactModule = require(mediaPlayback.Parent.SignalsReact)
local _ = require(mediaPlayback.Stores.getAudioPlaybackStore.types)
local getAudioPlaybackStoreModule = require(mediaPlayback.Stores.getAudioPlaybackStore)
local useAudioStoreModule = require(mediaPlayback.Hooks.useAudioStore)
local useSignalState = signalsReactModule.useSignalState

return function()
	-- upvalues: useSignalState (ref), getAudioPlaybackStoreModule (ref), useAudioStoreModule (ref)
	local var4 = useSignalState(useSignalState(getAudioPlaybackStoreModule).getLastPlayedAudioStore)
	
	return useAudioStoreModule(if var4 then var4.assetId else nil, if var4 then var4.usePreview else nil)
end