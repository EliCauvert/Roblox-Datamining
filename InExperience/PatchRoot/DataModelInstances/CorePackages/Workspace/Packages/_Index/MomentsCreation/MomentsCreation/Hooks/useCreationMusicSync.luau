local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(parent.MomentsTypes)
local useAudioPlaybackModule = require(momentsCreation.Hooks.useAudioPlayback)
local getFFlagMomentsMuteVideoAudioOnlyModule = require(momentsCreation.Flags.GetFFlagMomentsMuteVideoAudioOnly)

return function(p1, p2)
	-- upvalues: reactModule (ref), signalsModule (ref), useAudioPlaybackModule (ref), getFFlagMomentsMuteVideoAudioOnlyModule (ref)
	local playback = p1.playback
	local var1, var2 = reactModule.useState(playback.getMusic(false))
	local var3, var4 = reactModule.useState(playback.getIsMuted(false))
	local var5, var6 = reactModule.useState(playback.getIsPlaying(false))
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var2 (ref), playback (ref), var4 (ref), var6 (ref)
		return signalsModule.createEffect(function(p3)
			-- upvalues: var2 (copy), playback (copy), var4 (copy), var6 (copy)
			var2(playback.getMusic(p3))
			var4(playback.getIsMuted(p3))
			var6(playback.getIsPlaying(p3))
		end)
	end, { playback })
	local var7 = useAudioPlaybackModule(var1 ~= nil, if var1 ~= nil then nil else var1.assetId, {
		autoplay = true,
		looping = true,
		playbackRegion = reactModule.useMemo(function()
			-- upvalues: var1 (ref), p2 (ref)
			return if var1 == nil then nil else NumberRange.new(var1.startTime, var1.startTime + math.max(0, p2))
		end, { var1, p2 }) or NumberRange.new(0, 1e999)
	})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var5 (ref), var7 (ref)
		if var1 == nil then return end
		if var5 then
			var7.playback.play()
			
			return
		end
		var7.playback.pause()
	end, { var1, var5 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), getFFlagMomentsMuteVideoAudioOnlyModule (copy), var3 (ref), var7 (ref)
		if var1 == nil then return end
		if not getFFlagMomentsMuteVideoAudioOnlyModule() and var3 then
			var7.volume.mute()
			
			return
		end
		var7.volume.unmute()
	end, { var1, var3 })
	
	return { audio = var7, music = var1, userMuted = var3 }
end