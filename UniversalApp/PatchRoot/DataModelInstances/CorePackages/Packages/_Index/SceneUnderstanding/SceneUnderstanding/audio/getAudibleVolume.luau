local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local safelyAccessPropertyModule = require(script:FindFirstAncestor("SceneUnderstanding").safelyAccessProperty)

return function(p1)
	-- upvalues: safelyAccessPropertyModule (ref), userGameSettingsService (ref)
	return if p1.IsPlaying then safelyAccessPropertyModule(userGameSettingsService, "MasterVolume", 0) * (if p1.SoundGroup then p1.SoundGroup.Volume else 1) * p1.Volume * safelyAccessPropertyModule(p1, "RollOffGain", 0) else 0
end