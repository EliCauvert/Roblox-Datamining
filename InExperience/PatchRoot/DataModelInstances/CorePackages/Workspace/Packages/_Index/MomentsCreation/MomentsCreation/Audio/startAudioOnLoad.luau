return function(Sound: Sound, Callback) --[[ Line: 5 | Named "startAudioOnLoad" ]]
	local Connection = Sound:GetPropertyChangedSignal("IsReady"):Connect(function() --[[ Line: 6 | Named "startIfLoaded" ]]
		-- upvalues: Sound (copy), Callback (copy)
		if not Sound.IsReady then return end
		Sound.TimePosition = Sound.PlaybackRegion.Min
		
		if Callback() then
			Sound.PlaybackSpeed = 1
			
			if not Sound.IsPlaying then
				Sound:Play()
			end
		end
	end)
	
	if not Sound.IsReady then
		return Connection
	end
	Sound.TimePosition = Sound.PlaybackRegion.Min
	
	if Callback() then
		Sound.PlaybackSpeed = 1
		
		if not Sound.IsPlaying then
			Sound:Play()
		end
	end
	return Connection
end