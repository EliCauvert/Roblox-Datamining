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

return function(p0, p1)
	-- upvalues: createSignal (ref), createVolumeStoreModule (ref), enableAudioPlaybackInAppModule (ref), createAudioSystemModule (ref), createEffect (ref), onDisposed (ref)
	local var6, var7 = createSignal(0)
	local var8, var9 = createSignal(0)
	local var10, var11 = createSignal(false)
	local var12, var13 = createSignal(false)
	local var14, var15 = createSignal(false)
	local var16, var17 = createSignal(false)
	local t = {}
	local var19 = createVolumeStoreModule()
	enableAudioPlaybackInAppModule()
	local var20 = createAudioSystemModule(p0, p1)
	local audioPlayer = var20.audioPlayer
	
	local function play()
		-- upvalues: var11 (ref), var13 (ref), audioPlayer (ref)
		var11(true)
		var13(false)
		audioPlayer.PlaybackSpeed = 1
	end
	
	local function pause()
		-- upvalues: var11 (ref), audioPlayer (ref)
		var11(false)
		audioPlayer.PlaybackSpeed = 0
	end
	
	local function stop()
		-- upvalues: var11 (ref), audioPlayer (ref), var9 (ref)
		var11(false)
		audioPlayer.PlaybackSpeed = 0
		audioPlayer.TimePosition = 0
		var9(0)
	end
	
	local function seek(p2)
		-- upvalues: audioPlayer (ref), var9 (ref)
		local clampedValue = math.clamp(p2, 0, audioPlayer.TimeLength)
		audioPlayer.TimePosition = clampedValue
		var9(clampedValue)
	end
	
	audioPlayer:GetPropertyChangedSignal("TimeLength"):Connect(function()
		-- upvalues: var7 (ref), audioPlayer (ref)
		var7(audioPlayer.TimeLength)
	end)
	var7(audioPlayer.TimeLength)
	audioPlayer:GetPropertyChangedSignal("IsReady"):Connect(function()
		-- upvalues: var17 (ref), audioPlayer (ref)
		var17(audioPlayer.IsReady)
	end)
	var17(audioPlayer.IsReady)
	table.insert(t, createEffect(function(p3)
		-- upvalues: var10 (ref), audioPlayer (ref), var13 (ref), var11 (ref), var9 (ref), onDisposed (copy)
		if var10(p3) then
			if not audioPlayer.IsPlaying then
				audioPlayer:Play()
			end
			local var26 = true
			task.spawn(function()
				-- upvalues: var26 (write), audioPlayer (copy), var13 (copy), var11 (copy), var9 (copy)
				while var26 do
					if audioPlayer.IsPlaying then
						var9(audioPlayer.TimePosition)
						task.wait(0.0625)
						continue
					end
					var13(true)
					var11(false)
					audioPlayer.PlaybackSpeed = 0
					audioPlayer.TimePosition = 0
					var9(0)
					
					return
				end
			end)
			onDisposed(p3, function()
				-- upvalues: var26 (write)
				var26 = false
			end)
		end
	end))
	table.insert(t, createEffect(function(p4)
		-- upvalues: audioPlayer (ref), var19 (ref)
		audioPlayer.Volume = var19.getVolume(p4)
	end))
	
	return {
		assetId = p0,
		usePreview = p1,
		getDuration = var6,
		getElapsed = var8,
		getIsPlaying = var10,
		getIsElapsed = var12,
		getIsDestroyed = var14,
		getIsLoaded = var16,
		destroy = function()
			-- upvalues: var20 (ref), t (ref), var15 (ref)
			var20.destroy()
			
			for i, v in t do
				v()
			end
			var15(true)
		end,
		play = play,
		pause = pause,
		stop = stop,
		seek = seek,
		getIsMuted = var19.getIsMuted,
		getVolume = var19.getVolume,
		mute = var19.mute,
		setVolume = var19.setVolume,
		unmute = var19.unmute
	}
end