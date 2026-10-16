local MediaPlayback = script:FindFirstAncestor("MediaPlayback")
local EnableAudioPlaybackInAppModule = require(MediaPlayback.Common.enableAudioPlaybackInApp)
local UseEffectFunction = require(MediaPlayback.Parent.React).useEffect
local InitializeFmodMsDelay = game:DefineFastInt("InitializeFmodMsDelay", 0)

return function() --[[ Line: 24 | Named "useLazyFmod" ]]
	-- upvalues: UseEffectFunction (copy), InitializeFmodMsDelay (copy), EnableAudioPlaybackInAppModule (copy)
	UseEffectFunction(function() --[[ Line: 25 ]]
		-- upvalues: InitializeFmodMsDelay (upval), EnableAudioPlaybackInAppModule (upval)
		task.delay(InitializeFmodMsDelay / 1000, function() --[[ Line: 26 ]]
			-- upvalues: EnableAudioPlaybackInAppModule (upval)
			EnableAudioPlaybackInAppModule()
		end)
	end, {})
end