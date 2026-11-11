local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)

return function(p1): boolean
	-- upvalues: UtilsModule (copy)
	return UtilsModule.getEquippedToolId(p1) ~= nil
end