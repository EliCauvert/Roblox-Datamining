local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetAvatarSettingsModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAvatarSettings)
local SetDefaultBodyColorRangesModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetDefaultBodyColorRanges)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)

return function(p1)
	-- upvalues: SetAvatarSettingsModule (copy), SetDefaultBodyColorRangesModule (copy), ConstantsModule (copy)
	return function(p2)
		-- upvalues: p1 (copy), SetAvatarSettingsModule (upval), SetDefaultBodyColorRangesModule (upval), ConstantsModule (upval)
		p2:dispatch(SetAvatarSettingsModule(p1.minimumDeltaEBodyColorDifference, p1.scales, p1.accessoryRefinementTypes, p1.accessoryRefinementLowerBounds, p1.accessoryRefinementUpperBounds))
		p2:dispatch(SetDefaultBodyColorRangesModule(ConstantsModule.DefaultBodyColorRanges))
	end
end