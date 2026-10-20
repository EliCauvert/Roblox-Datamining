local MediaPlayback = script:FindFirstAncestor("MediaPlayback")
local SignalsModule = require(MediaPlayback.Parent.Signals)
local EnableAudioPlaybackInAppModule = require(MediaPlayback.Common.enableAudioPlaybackInApp)
local CreateAudioSystemModule = require(MediaPlayback.Stores.getAudioPlaybackStore.createAudioSystem)
local CreateVolumeStoreModule = require(MediaPlayback.Stores.getAudioPlaybackStore.createVolumeStore)
local _ = require(MediaPlayback.Stores.getAudioPlaybackStore.types)
local CreateSignalFunction = SignalsModule.createSignal
local CreateEffectFunction = SignalsModule.createEffect
local OnDisposedFunction = require(MediaPlayback.Parent.SignalsExperimental).onDisposed
local config = {
	spawn = function(Callback)
		return task.spawn(Callback)
	end,
	wait = function(Duration): number
		return task.wait(Duration)
	end
}

return function(AssetId, UsePreview, p1)
	-- upvalues: config (copy), CreateSignalFunction (copy), CreateVolumeStoreModule (copy), EnableAudioPlaybackInAppModule (copy), CreateAudioSystemModule (copy), CreateEffectFunction (copy), OnDisposedFunction (copy)
	local P2 = p1 or config
	local Signal, Signal2 = CreateSignalFunction(0)
	local Signal1, Signal2_1 = CreateSignalFunction(0)
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local Signal4, Signal2_3 = CreateSignalFunction(false)
	local Signal5, Signal2_4 = CreateSignalFunction(false)
	local Signal6, Signal2_5 = CreateSignalFunction(false)
	local List = {}
	local VolumeStoreModule = CreateVolumeStoreModule()
	EnableAudioPlaybackInAppModule()
	local AudioSystemModule = CreateAudioSystemModule(AssetId, UsePreview)
	local AudioPlayer = AudioSystemModule.audioPlayer
	
	local function play()
		-- upvalues: Signal2_2 (copy), Signal2_3 (copy), AudioPlayer (copy)
		Signal2_2(true)
		Signal2_3(false)
		AudioPlayer.PlaybackSpeed = 1
	end
	
	local function pause()
		-- upvalues: Signal2_2 (copy), AudioPlayer (copy)
		Signal2_2(false)
		AudioPlayer.PlaybackSpeed = 0
	end
	
	local function stop()
		-- upvalues: Signal2_2 (copy), AudioPlayer (copy), Signal2_1 (copy)
		Signal2_2(false)
		AudioPlayer.PlaybackSpeed = 0
		AudioPlayer.TimePosition = 0
		Signal2_1(0)
	end
	
	local function seek(Value: number)
		-- upvalues: AudioPlayer (copy), Signal2_1 (copy)
		local ClampedValue = math.clamp(Value, 0, AudioPlayer.TimeLength)
		AudioPlayer.TimePosition = ClampedValue
		Signal2_1(ClampedValue)
	end
	
	AudioPlayer:GetPropertyChangedSignal("TimeLength"):Connect(function()
		-- upvalues: Signal2 (copy), AudioPlayer (copy)
		Signal2(AudioPlayer.TimeLength)
	end)
	Signal2(AudioPlayer.TimeLength)
	AudioPlayer:GetPropertyChangedSignal("IsReady"):Connect(function()
		-- upvalues: Signal2_5 (copy), AudioPlayer (copy)
		Signal2_5(AudioPlayer.IsReady)
	end)
	Signal2_5(AudioPlayer.IsReady)
	table.insert(List, CreateEffectFunction(function(p2)
		-- upvalues: Signal3 (copy), AudioPlayer (copy), P2 (copy), Signal2_3 (copy), Signal2_2 (copy), Signal2_1 (copy), OnDisposedFunction (upval)
		if Signal3(p2) then
			if not AudioPlayer.IsPlaying then
				AudioPlayer:Play()
			end
			local Flag = true
			P2.spawn(function()
				-- upvalues: Flag (ref), AudioPlayer (upval), Signal2_3 (upval), Signal2_2 (upval), Signal2_1 (upval), P2 (upval)
				while Flag do
					if AudioPlayer.IsPlaying then
						Signal2_1(AudioPlayer.TimePosition)
						P2.wait(0.0625)
						continue
					end
					Signal2_3(true)
					Signal2_2(false)
					AudioPlayer.PlaybackSpeed = 0
					AudioPlayer.TimePosition = 0
					Signal2_1(0)
					break
				end
			end)
			OnDisposedFunction(p2, function()
				-- upvalues: Flag (ref)
				Flag = false
			end)
		end
	end))
	table.insert(List, CreateEffectFunction(function(p3)
		-- upvalues: AudioPlayer (copy), VolumeStoreModule (copy)
		AudioPlayer.Volume = VolumeStoreModule.getVolume(p3)
	end))
	
	return {
		assetId = AssetId,
		usePreview = UsePreview,
		getDuration = Signal,
		getElapsed = Signal1,
		getIsPlaying = Signal3,
		getIsElapsed = Signal4,
		getIsDestroyed = Signal5,
		getIsLoaded = Signal6,
		destroy = function()
			-- upvalues: AudioSystemModule (copy), List (copy), Signal2_4 (copy)
			AudioSystemModule.destroy()
			
			for _, value in List do
				value()
			end
			Signal2_4(true)
		end,
		play = play,
		pause = pause,
		stop = stop,
		seek = seek,
		getIsMuted = VolumeStoreModule.getIsMuted,
		getVolume = VolumeStoreModule.getVolume,
		mute = VolumeStoreModule.mute,
		setVolume = VolumeStoreModule.setVolume,
		unmute = VolumeStoreModule.unmute
	}
end