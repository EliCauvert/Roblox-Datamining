-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:10 2026 Pacific Standard Time.

local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local safelyAccessPropertyModule = require(script:FindFirstAncestor("SceneUnderstanding").safelyAccessProperty)

return function(p0) --[[ line: 19 | named "getAudibleVolume" ]]
	-- upvalues: safelyAccessPropertyModule (ref), userGameSettingsService (ref)
	return if p0.IsPlaying then safelyAccessPropertyModule(userGameSettingsService, "MasterVolume", 0) * (if p0.SoundGroup then p0.SoundGroup.Volume else 1) * p0.Volume * safelyAccessPropertyModule(p0, "RollOffGain", 0) else 0
end