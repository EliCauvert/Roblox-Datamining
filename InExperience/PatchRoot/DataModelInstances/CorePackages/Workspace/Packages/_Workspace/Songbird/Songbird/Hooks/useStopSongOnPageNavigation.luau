local songbird = script:FindFirstAncestor("Songbird")
local signalsReactModule = require(songbird.Parent.SignalsReact)
local reactModule = require(songbird.Parent.React)
local getAudioPlaybackStore = require(songbird.Parent.MediaPlayback).getAudioPlaybackStore
local useEffect = reactModule.useEffect
local useCallback = reactModule.useCallback

return function(p0, p1)
	-- upvalues: signalsReactModule (ref), getAudioPlaybackStore (ref), useCallback (ref), useEffect (ref)
	local var3 = signalsReactModule.useSignalState(getAudioPlaybackStore)
	local var4 = useCallback(function()
		-- upvalues: var3 (ref), p1 (ref)
		for i, v in var3.getPlayingAudioStores(false) do
			v.stop()
		end
		if p1 then
			p1()
		end
	end, { var3, p1 })
	useEffect(function()
		-- upvalues: p0 (ref), var4 (ref)
		if not p0 then
			var4()
		end
	end, { p0, var4 })
	useEffect(function()
		-- upvalues: var4 (ref)
		return var4
	end, { var4 })
end