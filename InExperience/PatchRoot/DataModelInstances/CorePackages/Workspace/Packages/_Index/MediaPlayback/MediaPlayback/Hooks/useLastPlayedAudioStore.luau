local mediaPlayback = script:FindFirstAncestor("MediaPlayback")
local signalsReactModule = require(mediaPlayback.Parent.SignalsReact)
local _ = require(mediaPlayback.Stores.getAudioPlaybackStore.types)
local getAudioPlaybackStoreModule = require(mediaPlayback.Stores.getAudioPlaybackStore)
local useAudioStoreModule = require(mediaPlayback.Hooks.useAudioStore)
local useSignalState = signalsReactModule.useSignalState

return function()
	-- upvalues: useSignalState (ref), getAudioPlaybackStoreModule (ref), useAudioStoreModule (ref)
	local var1 = useSignalState(useSignalState(getAudioPlaybackStoreModule).getLastPlayedAudioStore)
	
	return useAudioStoreModule(if var1 then var1.assetId else nil, if var1 then var1.usePreview else nil)
end