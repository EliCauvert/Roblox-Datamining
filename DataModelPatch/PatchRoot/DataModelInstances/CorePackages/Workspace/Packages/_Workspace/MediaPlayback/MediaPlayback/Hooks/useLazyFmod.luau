local MediaPlayback = script:FindFirstAncestor("MediaPlayback")
local EnableAudioPlaybackInAppModule = require(MediaPlayback.Common.enableAudioPlaybackInApp)
local UseEffectFunction = require(MediaPlayback.Parent.React).useEffect
local InitializeFmodMsDelay = game:DefineFastInt("InitializeFmodMsDelay", 0)

return function()
	-- upvalues: UseEffectFunction (copy), InitializeFmodMsDelay (copy), EnableAudioPlaybackInAppModule (copy)
	UseEffectFunction(function()
		-- upvalues: InitializeFmodMsDelay (upval), EnableAudioPlaybackInAppModule (upval)
		task.delay(InitializeFmodMsDelay / 1000, function()
			-- upvalues: EnableAudioPlaybackInAppModule (upval)
			EnableAudioPlaybackInAppModule()
		end)
	end, {})
end