local songbird = script:FindFirstAncestor("Songbird")
local signalsReactModule = require(songbird.Parent.SignalsReact)
local reactModule = require(songbird.Parent.React)
local getAudioPlaybackStore = require(songbird.Parent.MediaPlayback).getAudioPlaybackStore
local useEffect = reactModule.useEffect
local useCallback = reactModule.useCallback

return function(p1, p2)
	-- upvalues: signalsReactModule (ref), getAudioPlaybackStore (ref), useCallback (ref), useEffect (ref)
	local var1 = signalsReactModule.useSignalState(getAudioPlaybackStore)
	local var2 = useCallback(function()
		-- upvalues: var1 (ref), p2 (ref)
		for i, v in var1.getPlayingAudioStores(false) do
			v.stop()
		end
		if p2 then
			p2()
		end
	end, { var1, p2 })
	useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		if not p1 then
			var2()
		end
	end, { p1, var2 })
	useEffect(function()
		-- upvalues: var2 (ref)
		return var2
	end, { var2 })
end