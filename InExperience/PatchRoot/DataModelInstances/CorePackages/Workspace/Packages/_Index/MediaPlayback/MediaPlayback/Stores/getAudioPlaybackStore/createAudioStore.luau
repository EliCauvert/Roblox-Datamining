local mediaPlayback = script:FindFirstAncestor("MediaPlayback")
local signalsModule = require(mediaPlayback.Parent.Signals)
local signalsExperimentalModule = require(mediaPlayback.Parent.SignalsExperimental)
local enableAudioPlaybackInAppModule = require(mediaPlayback.Common.enableAudioPlaybackInApp)
local createAudioSystemModule = require(mediaPlayback.Stores.getAudioPlaybackStore.createAudioSystem)
local createVolumeStoreModule = require(mediaPlayback.Stores.getAudioPlaybackStore.createVolumeStore)
local _ = require(mediaPlayback.Stores.getAudioPlaybackStore.types)
local createSignal = signalsModule.createSignal
local createEffect = signalsModule.createEffect
local onDisposed = signalsExperimentalModule.onDisposed
local t = {
	spawn = function(p1)
		return task.spawn(p1)
	end,
	wait = function(p1)
		return task.wait(p1)
	end
}

return function(p1, p2, p3)
	-- upvalues: t (ref), createSignal (ref), createVolumeStoreModule (ref), enableAudioPlaybackInAppModule (ref), createAudioSystemModule (ref), createEffect (ref), onDisposed (ref)
	p3 = p3 or t
	local var1, var2 = createSignal(0)
	local var3, var4 = createSignal(0)
	local var5, var6 = createSignal(false)
	local var7, var8 = createSignal(false)
	local var9, var10 = createSignal(false)
	local var11, var12 = createSignal(false)
	local t_1 = {}
	local var13 = createVolumeStoreModule()
	enableAudioPlaybackInAppModule()
	local var14 = createAudioSystemModule(p1, p2)
	local audioPlayer = var14.audioPlayer
	
	local function play()
		-- upvalues: var6 (ref), var8 (ref), audioPlayer (ref)
		var6(true)
		var8(false)
		audioPlayer.PlaybackSpeed = 1
	end
	
	local function pause()
		-- upvalues: var6 (ref), audioPlayer (ref)
		var6(false)
		audioPlayer.PlaybackSpeed = 0
	end
	
	local function stop()
		-- upvalues: var6 (ref), audioPlayer (ref), var4 (ref)
		var6(false)
		audioPlayer.PlaybackSpeed = 0
		audioPlayer.TimePosition = 0
		var4(0)
	end
	
	local function seek(p4)
		-- upvalues: audioPlayer (ref), var4 (ref)
		local clampedValue = math.clamp(p4, 0, audioPlayer.TimeLength)
		audioPlayer.TimePosition = clampedValue
		var4(clampedValue)
	end
	
	audioPlayer:GetPropertyChangedSignal("TimeLength"):Connect(function()
		-- upvalues: var2 (ref), audioPlayer (ref)
		var2(audioPlayer.TimeLength)
	end)
	var2(audioPlayer.TimeLength)
	audioPlayer:GetPropertyChangedSignal("IsReady"):Connect(function()
		-- upvalues: var12 (ref), audioPlayer (ref)
		var12(audioPlayer.IsReady)
	end)
	var12(audioPlayer.IsReady)
	table.insert(t_1, createEffect(function(p4)
		-- upvalues: var5 (ref), audioPlayer (ref), p3 (ref), var8 (ref), var6 (ref), var4 (ref), onDisposed (copy)
		if var5(p4) then
			if not audioPlayer.IsPlaying then
				audioPlayer:Play()
			end
			local var15 = true
			p3.spawn(function()
				-- upvalues: var15 (write), audioPlayer (copy), var8 (copy), var6 (copy), var4 (copy), p3 (copy)
				while var15 do
					if audioPlayer.IsPlaying then
						var4(audioPlayer.TimePosition)
						p3.wait(0.0625)
						continue
					end
					var8(true)
					var6(false)
					audioPlayer.PlaybackSpeed = 0
					audioPlayer.TimePosition = 0
					var4(0)
					
					return
				end
			end)
			onDisposed(p4, function()
				-- upvalues: var15 (write)
				var15 = false
			end)
		end
	end))
	table.insert(t_1, createEffect(function(p5)
		-- upvalues: audioPlayer (ref), var13 (ref)
		audioPlayer.Volume = var13.getVolume(p5)
	end))
	
	return {
		assetId = p1,
		usePreview = p2,
		getDuration = var1,
		getElapsed = var3,
		getIsPlaying = var5,
		getIsElapsed = var7,
		getIsDestroyed = var9,
		getIsLoaded = var11,
		destroy = function()
			-- upvalues: var14 (ref), t_1 (ref), var10 (ref)
			var14.destroy()
			
			for i, v in t_1 do
				v()
			end
			var10(true)
		end,
		play = play,
		pause = pause,
		stop = stop,
		seek = seek,
		getIsMuted = var13.getIsMuted,
		getVolume = var13.getVolume,
		mute = var13.mute,
		setVolume = var13.setVolume,
		unmute = var13.unmute
	}
end