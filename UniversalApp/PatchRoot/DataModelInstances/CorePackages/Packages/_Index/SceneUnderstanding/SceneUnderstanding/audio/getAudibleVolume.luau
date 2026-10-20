local UserGameSettings = UserSettings():GetService("UserGameSettings")
local SafelyAccessPropertyModule = require(script:FindFirstAncestor("SceneUnderstanding").safelyAccessProperty)

return function(Sound)
	-- upvalues: SafelyAccessPropertyModule (copy), UserGameSettings (copy)
	return if Sound.IsPlaying then SafelyAccessPropertyModule(UserGameSettings, "MasterVolume", 0) * (if Sound.SoundGroup then Sound.SoundGroup.Volume else 1) * Sound.Volume * SafelyAccessPropertyModule(Sound, "RollOffGain", 0) else 0
end