local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(parent.MomentsTypes)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local useAudioPlaybackModule = require(momentsCreation.Hooks.useAudioPlayback)
local getFFlagMomentsMuteVideoAudioOnlyModule = require(momentsCreation.Flags.GetFFlagMomentsMuteVideoAudioOnly)
local getFFlagMomentsTTSAudioOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local getTtsDuckScalarModule = require(momentsCreation.Audio.getTtsDuckScalar)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), getFFlagMomentsTTSAudioOverlayModule (ref), signalsModule (ref), getTtsDuckScalarModule (ref), useAudioPlaybackModule (ref), getFFlagMomentsMuteVideoAudioOnlyModule (ref)
	local playback = p1.playback
	local var1, var2 = reactModule.useState(playback.getMusic(false))
	local var3, var4 = reactModule.useState(playback.getIsMuted(false))
	local var5, var6 = reactModule.useState(playback.getIsPlaying(false))
	local useState = reactModule.useState
	local var7 = getFFlagMomentsTTSAudioOverlayModule and (p3 ~= nil and p3.getState(false) == "playing")
	useState, var13 = useState(var7)
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var2 (ref), playback (ref), var4 (ref), var6 (ref), getFFlagMomentsTTSAudioOverlayModule (copy), var7 (ref), p3 (ref)
		return signalsModule.createEffect(function(p4)
			-- upvalues: var2 (copy), playback (copy), var4 (copy), var6 (copy), getFFlagMomentsTTSAudioOverlayModule (copy), var7 (copy), p3 (copy)
			var2(playback.getMusic(p4))
			var4(playback.getIsMuted(p4))
			var6(playback.getIsPlaying(p4))
			
			if getFFlagMomentsTTSAudioOverlayModule then
				var7(p3 ~= nil and p3.getState(p4) == "playing")
			end
		end)
	end, { playback })
	local useState_1 = getFFlagMomentsTTSAudioOverlayModule and useState
	local var8 = useAudioPlaybackModule(var1 ~= nil, if var1 ~= nil then nil else var1.assetId, {
		autoplay = true,
		looping = true,
		playbackRegion = reactModule.useMemo(function()
			-- upvalues: var1 (ref), p2 (ref)
			return if var1 == nil then nil else NumberRange.new(var1.startTime, var1.startTime + math.max(0, p2))
		end, { var1, p2 }) or NumberRange.new(0, 1e999),
		duckScalar = if useState_1 then getTtsDuckScalarModule() else 1
	})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var5 (ref), var8 (ref)
		if var1 == nil then return end
		if var5 then
			var8.playback.play()
			
			return
		end
		var8.playback.pause()
	end, { var1, var5 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), getFFlagMomentsMuteVideoAudioOnlyModule (copy), var3 (ref), var8 (ref)
		if var1 == nil then return end
		if not getFFlagMomentsMuteVideoAudioOnlyModule() and var3 then
			var8.volume.mute()
			
			return
		end
		var8.volume.unmute()
	end, { var1, var3 })
	
	return {
		audio = var8,
		music = var1,
		userMuted = var3,
		isDucking = useState_1
	}
end