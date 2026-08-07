local mediaPlayback = script:FindFirstAncestor("MediaPlayback")
local enableAudioPlaybackInAppModule = require(mediaPlayback.Common.enableAudioPlaybackInApp)
local useEffect = require(mediaPlayback.Parent.React).useEffect
local initializeFmodMsDelay = game:DefineFastInt("InitializeFmodMsDelay", 0)

return function() --[[ line: 24 | named "useLazyFmod" ]]
	-- upvalues: useEffect (ref), initializeFmodMsDelay (ref), enableAudioPlaybackInAppModule (ref)
	useEffect(function() --[[ line: 25 ]]
		-- upvalues: initializeFmodMsDelay (copy), enableAudioPlaybackInAppModule (copy)
		task.delay(initializeFmodMsDelay / 1000, function() --[[ line: 26 ]]
			-- upvalues: enableAudioPlaybackInAppModule (copy)
			enableAudioPlaybackInAppModule()
		end)
	end, {})
end