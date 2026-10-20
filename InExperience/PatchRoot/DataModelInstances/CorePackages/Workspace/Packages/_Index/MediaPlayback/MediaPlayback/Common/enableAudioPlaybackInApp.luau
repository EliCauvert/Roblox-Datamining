local SoundService = game:GetService("SoundService")

return function()
	-- upvalues: SoundService (copy)
	if game:GetEngineFeature("SoundServiceSetSoundEnabled") then
		SoundService:SetSoundEnabled(true)
	end
end