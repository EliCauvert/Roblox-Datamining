local soundService = game:GetService("SoundService")

return function() --[[ line: 25 | named "enableAudioPlaybackInApp" ]]
	-- upvalues: soundService (ref)
	if game:GetEngineFeature("SoundServiceSetSoundEnabled") then
		soundService:SetSoundEnabled(true)
	end
end