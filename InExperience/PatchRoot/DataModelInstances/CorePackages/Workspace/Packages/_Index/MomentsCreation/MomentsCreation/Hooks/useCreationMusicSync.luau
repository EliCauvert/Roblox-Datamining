local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.MomentsTypes)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local UseAudioPlaybackModule = require(MomentsCreation.Hooks.useAudioPlayback)
local GetFFlagMomentsMuteVideoAudioOnlyModule = require(MomentsCreation.Flags.GetFFlagMomentsMuteVideoAudioOnly)
local GetFFlagMomentsTTSAudioOverlayModule = require(MomentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local GetTtsDuckScalarModule = require(MomentsCreation.Audio.getTtsDuckScalar)

return function(p1, p2, p3) --[[ Line: 41 | Named "useCreationMusicSync" ]]
	-- upvalues: ReactModule (copy), GetFFlagMomentsTTSAudioOverlayModule (copy), SignalsModule (copy), GetTtsDuckScalarModule (copy), UseAudioPlaybackModule (copy), GetFFlagMomentsMuteVideoAudioOnlyModule (copy)
	local Playback = p1.playback
	local UseStateResult, UseStateResult2 = ReactModule.useState((Playback.getMusic(false)))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Playback.getIsMuted(false))
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(Playback.getIsPlaying(false))
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(GetFFlagMomentsTTSAudioOverlayModule and (p3 ~= nil and p3.getState(false) == "playing"))
	ReactModule.useEffect(function() --[[ Line: 57 ]]
		-- upvalues: SignalsModule (upval), UseStateResult2 (copy), Playback (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), GetFFlagMomentsTTSAudioOverlayModule (upval), UseStateResult2_3 (copy), p3 (copy)
		return SignalsModule.createEffect(function(p4) --[[ Line: 58 ]]
			-- upvalues: UseStateResult2 (upval), Playback (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval), GetFFlagMomentsTTSAudioOverlayModule (upval), UseStateResult2_3 (upval), p3 (upval)
			UseStateResult2(Playback.getMusic(p4))
			UseStateResult2_1(Playback.getIsMuted(p4))
			UseStateResult2_2(Playback.getIsPlaying(p4))
			
			if GetFFlagMomentsTTSAudioOverlayModule then
				UseStateResult2_3(p3 ~= nil and p3.getState(p4) == "playing")
			end
		end)
	end, { Playback })
	local UseStateResult4_1 = GetFFlagMomentsTTSAudioOverlayModule and UseStateResult4
	local UseAudioPlaybackModuleResult = UseAudioPlaybackModule(UseStateResult ~= nil, if UseStateResult == nil then nil else UseStateResult.assetId, {
		autoplay = true,
		looping = true,
		playbackRegion = ReactModule.useMemo(function() --[[ Line: 73 ]]
			-- upvalues: UseStateResult (copy), p2 (copy)
			return if UseStateResult == nil then nil else NumberRange.new(UseStateResult.startTime, UseStateResult.startTime + math.max(0, p2))
		end, { UseStateResult, p2 }) or NumberRange.new(0, 1e999),
		duckScalar = if UseStateResult4_1 then GetTtsDuckScalarModule() else 1
	})
	ReactModule.useEffect(function() --[[ Line: 90 ]]
		-- upvalues: UseStateResult (copy), UseStateResult3 (copy), UseAudioPlaybackModuleResult (copy)
		if UseStateResult == nil then return end
		if UseStateResult3 then
			UseAudioPlaybackModuleResult.playback.play()
			
			return
		else
			UseAudioPlaybackModuleResult.playback.pause()
		end
	end, { UseStateResult, UseStateResult3 })
	ReactModule.useEffect(function() --[[ Line: 106 ]]
		-- upvalues: UseStateResult (copy), GetFFlagMomentsMuteVideoAudioOnlyModule (upval), UseStateResult1 (copy), UseAudioPlaybackModuleResult (copy)
		if UseStateResult == nil then return end
		if not GetFFlagMomentsMuteVideoAudioOnlyModule() and UseStateResult1 then
			UseAudioPlaybackModuleResult.volume.mute()
			
			return
		else
			UseAudioPlaybackModuleResult.volume.unmute()
		end
	end, { UseStateResult, UseStateResult1 })
	
	return {
		audio = UseAudioPlaybackModuleResult,
		music = UseStateResult,
		userMuted = UseStateResult1,
		isDucking = UseStateResult4_1
	}
end