local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(parent.MomentsTypes)
local useAudioPlaybackModule = require(momentsCreation.Hooks.useAudioPlayback)
local getFFlagMomentsMuteVideoAudioOnlyModule = require(momentsCreation.Flags.GetFFlagMomentsMuteVideoAudioOnly)

return function(p0, p1)
	-- upvalues: reactModule (ref), signalsModule (ref), useAudioPlaybackModule (ref), getFFlagMomentsMuteVideoAudioOnlyModule (ref)
	local playback = p0.playback
	local var5, var6 = reactModule.useState(playback.getMusic(false))
	local var7, var8 = reactModule.useState(playback.getIsMuted(false))
	local var9, var10 = reactModule.useState(playback.getIsPlaying(false))
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var6 (ref), playback (ref), var8 (ref), var10 (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var6 (copy), playback (copy), var8 (copy), var10 (copy)
			var6(playback.getMusic(p2))
			var8(playback.getIsMuted(p2))
			var10(playback.getIsPlaying(p2))
		end)
	end, { playback })
	local var11 = useAudioPlaybackModule(var5 ~= nil, if var5 ~= nil then nil else var5.assetId, {
		autoplay = true,
		looping = true,
		playbackRegion = reactModule.useMemo(function()
			-- upvalues: var5 (ref), p1 (ref)
			return if var5 == nil then nil else NumberRange.new(var5.startTime, var5.startTime + math.max(0, p1))
		end, { var5, p1 }) or NumberRange.new(0, 1e999)
	})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var9 (ref), var11 (ref)
		if var5 == nil then return end
		if var9 then
			var11.playback.play()
			
			return
		end
		var11.playback.pause()
	end, { var5, var9 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), getFFlagMomentsMuteVideoAudioOnlyModule (copy), var7 (ref), var11 (ref)
		if var5 == nil then return end
		if not getFFlagMomentsMuteVideoAudioOnlyModule() and var7 then
			var11.volume.mute()
			
			return
		end
		var11.volume.unmute()
	end, { var5, var7 })
	
	return { audio = var11, music = var5, userMuted = var7 }
end