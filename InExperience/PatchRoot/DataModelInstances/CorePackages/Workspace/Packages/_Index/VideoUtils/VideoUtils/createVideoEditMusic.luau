return function(p1, Callback)
	local VideoEditMusic = Instance.new("Folder")
	VideoEditMusic.Name = "VideoEditMusic"
	VideoEditMusic.Parent = game:GetService("CoreGui")
	local AudioPlayer = Instance.new("AudioPlayer")
	AudioPlayer.Asset = `rbxassetid://{p1}`
	AudioPlayer.PlaybackSpeed = 0
	AudioPlayer.Parent = VideoEditMusic
	local AudioDeviceOutput = Instance.new("AudioDeviceOutput")
	AudioDeviceOutput.Parent = VideoEditMusic
	local Wire = Instance.new("Wire")
	Wire.SourceInstance = AudioPlayer
	Wire.TargetInstance = AudioDeviceOutput
	Wire.Parent = VideoEditMusic
	local Playing = false
	local Connection = AudioPlayer:GetPropertyChangedSignal("IsReady"):Connect(function()
		-- upvalues: AudioPlayer (copy), Playing (ref), Callback (copy)
		if AudioPlayer.IsReady then
			if Playing and not AudioPlayer.IsPlaying then
				AudioPlayer:Play()
			end
			AudioPlayer.TimePosition = Callback()
		end
	end)
	AudioPlayer:Play()
	
	return {
		setPosition = function(TimePosition)
			-- upvalues: AudioPlayer (copy)
			AudioPlayer.TimePosition = TimePosition
		end,
		setPlaying = function(Value)
			-- upvalues: Playing (ref), AudioPlayer (copy), Callback (copy)
			Playing = Value
			
			if Value and AudioPlayer.IsReady and not AudioPlayer.IsPlaying then
				AudioPlayer:Play()
				AudioPlayer.TimePosition = Callback()
			end
			AudioPlayer.PlaybackSpeed = if Value then 1 else 0
		end,
		destroy = function()
			-- upvalues: Connection (copy), VideoEditMusic (copy)
			Connection:Disconnect()
			VideoEditMusic:Destroy()
		end
	}
end