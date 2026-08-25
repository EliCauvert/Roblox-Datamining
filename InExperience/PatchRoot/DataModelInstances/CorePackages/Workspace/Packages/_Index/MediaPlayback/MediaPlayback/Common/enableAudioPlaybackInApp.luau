local soundService = game:GetService("SoundService")

return function()
	-- upvalues: soundService (ref)
	if game:GetEngineFeature("SoundServiceSetSoundEnabled") then
		soundService:SetSoundEnabled(true)
	end
end