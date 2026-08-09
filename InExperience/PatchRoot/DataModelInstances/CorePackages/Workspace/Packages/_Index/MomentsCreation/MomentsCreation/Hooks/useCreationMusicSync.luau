local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(parent.MomentsTypes)
local useAudioPlaybackModule = require(momentsCreation.Hooks.useAudioPlayback)

return function(p0, p1) --[[ line: 36 | named "useCreationMusicSync" ]]
	-- upvalues: reactModule (ref), signalsModule (ref), useAudioPlaybackModule (ref)
	local playback = p0.playback
	local var4, var5 = reactModule.useState(playback.getMusic(false))
	local var6, var7 = reactModule.useState(playback.getIsMuted(false))
	local var8, var9 = reactModule.useState(playback.getIsPlaying(false))
	reactModule.useEffect(function() --[[ line: 43 ]]
		-- upvalues: signalsModule (copy), var5 (ref), playback (ref), var7 (ref), var9 (ref)
		return signalsModule.createEffect(function(p2) --[[ line: 44 ]]
			-- upvalues: var5 (copy), playback (copy), var7 (copy), var9 (copy)
			var5(playback.getMusic(p2))
			var7(playback.getIsMuted(p2))
			var9(playback.getIsPlaying(p2))
		end)
	end, { playback })
	local var10 = useAudioPlaybackModule(var4 ~= nil, if var4 ~= nil then nil else var4.assetId, {
		autoplay = true,
		looping = true,
		playbackRegion = reactModule.useMemo(function() --[[ line: 52 ]]
			-- upvalues: var4 (ref), p1 (ref)
			return if var4 == nil then nil else NumberRange.new(var4.startTime, var4.startTime + math.max(0, p1))
		end, { var4, p1 }) or NumberRange.new(0, 1e999)
	})
	reactModule.useEffect(function() --[[ line: 68 ]]
		-- upvalues: var4 (ref), var8 (ref), var10 (ref)
		if var4 == nil then return end
		if var8 then
			var10.playback.play()
			
			return
		end
		var10.playback.pause()
	end, { var4, var8 })
	reactModule.useEffect(function() --[[ line: 81 ]]
		-- upvalues: var4 (ref), var6 (ref), var10 (ref)
		if var4 == nil then return end
		if var6 then
			var10.volume.mute()
			
			return
		end
		var10.volume.unmute()
	end, { var4, var6 })
	
	return { audio = var10, music = var4, userMuted = var6 }
end