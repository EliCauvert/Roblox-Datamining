local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local _ = require(Modules.AvatarExperience.Common.Reducers.AvatarExperience)

return function(p1, p2)
	-- upvalues: UtilsModule (copy)
	return UtilsModule.getColor3ForRangeIdAndBodyPartIndex(p2, p1.AvatarEditor.BodyColorPickerSettings.selectedBodyPartIndex, p1.AvatarEditor.BodyColorPickerSettings.rangeIdToBodyPartsToSliderAndColor3Values, p1.AvatarEditor.DefaultBodyColorRanges)
end