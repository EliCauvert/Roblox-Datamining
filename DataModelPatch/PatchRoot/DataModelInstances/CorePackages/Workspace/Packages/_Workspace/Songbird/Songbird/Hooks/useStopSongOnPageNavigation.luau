local Songbird = script:FindFirstAncestor("Songbird")
local SignalsReactModule = require(Songbird.Parent.SignalsReact)
local ReactModule = require(Songbird.Parent.React)
local GetAudioPlaybackStore = require(Songbird.Parent.MediaPlayback).getAudioPlaybackStore
local UseEffectFunction = ReactModule.useEffect
local UseCallbackFunction = ReactModule.useCallback

return function(p1, Callback)
	-- upvalues: SignalsReactModule (copy), GetAudioPlaybackStore (copy), UseCallbackFunction (copy), UseEffectFunction (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetAudioPlaybackStore)
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseSignalStateResult (copy), Callback (copy)
		for _, value in UseSignalStateResult.getPlayingAudioStores(false) do
			value.stop()
		end
		if Callback then
			Callback()
		end
	end, { UseSignalStateResult, Callback })
	UseEffectFunction(function()
		-- upvalues: p1 (copy), UseCallbackResult (copy)
		if not p1 then
			UseCallbackResult()
		end
	end, { p1, UseCallbackResult })
	UseEffectFunction(function()
		-- upvalues: UseCallbackResult (copy)
		return UseCallbackResult
	end, { UseCallbackResult })
end