local SoundService = game:GetService("SoundService")

return function() --[[ Line: 25 | Named "enableAudioPlaybackInApp" ]]
	-- upvalues: SoundService (copy)
	if game:GetEngineFeature("SoundServiceSetSoundEnabled") then
		SoundService:SetSoundEnabled(true)
	end
end