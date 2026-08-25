local mediaPlayback = script:FindFirstAncestor("MediaPlayback")
local enableAudioPlaybackInAppModule = require(mediaPlayback.Common.enableAudioPlaybackInApp)
local useEffect = require(mediaPlayback.Parent.React).useEffect
local initializeFmodMsDelay = game:DefineFastInt("InitializeFmodMsDelay", 0)

return function()
	-- upvalues: useEffect (ref), initializeFmodMsDelay (ref), enableAudioPlaybackInAppModule (ref)
	useEffect(function()
		-- upvalues: initializeFmodMsDelay (copy), enableAudioPlaybackInAppModule (copy)
		task.delay(initializeFmodMsDelay / 1000, function()
			-- upvalues: enableAudioPlaybackInAppModule (copy)
			enableAudioPlaybackInAppModule()
		end)
	end, {})
end