local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.MomentsTypes)
local UseAudioPlaybackModule = require(MomentsCreation.Hooks.useAudioPlayback)

return function(p1, p2)
	-- upvalues: ReactModule (copy), SignalsModule (copy), UseAudioPlaybackModule (copy)
	local Playback = p1.playback
	local UseStateResult, UseStateResult2 = ReactModule.useState((Playback.getMusic(false)))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Playback.getIsMuted(false))
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(Playback.getIsPlaying(false))
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), UseStateResult2 (copy), Playback (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		return SignalsModule.createEffect(function(p3)
			-- upvalues: UseStateResult2 (upval), Playback (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval)
			UseStateResult2(Playback.getMusic(p3))
			UseStateResult2_1(Playback.getIsMuted(p3))
			UseStateResult2_2(Playback.getIsPlaying(p3))
		end)
	end, { Playback })
	local UseAudioPlaybackModuleResult = UseAudioPlaybackModule(UseStateResult ~= nil, if UseStateResult == nil then nil else UseStateResult.assetId, {
		autoplay = true,
		looping = true,
		playbackRegion = ReactModule.useMemo(function()
			-- upvalues: UseStateResult (copy), p2 (copy)
			return if UseStateResult == nil then nil else NumberRange.new(UseStateResult.startTime, UseStateResult.startTime + math.max(0, p2))
		end, { UseStateResult, p2 }) or NumberRange.new(0, 1e999)
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseStateResult3 (copy), UseAudioPlaybackModuleResult (copy)
		if UseStateResult == nil then return end
		if UseStateResult3 then
			UseAudioPlaybackModuleResult.playback.play()
			
			return
		else
			UseAudioPlaybackModuleResult.playback.pause()
		end
	end, { UseStateResult, UseStateResult3 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseStateResult1 (copy), UseAudioPlaybackModuleResult (copy)
		if UseStateResult == nil then return end
		if UseStateResult1 then
			UseAudioPlaybackModuleResult.volume.mute()
			
			return
		else
			UseAudioPlaybackModuleResult.volume.unmute()
		end
	end, { UseStateResult, UseStateResult1 })
	
	return {
		audio = UseAudioPlaybackModuleResult,
		music = UseStateResult,
		userMuted = UseStateResult1
	}
end