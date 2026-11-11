local CorePackages = game:GetService("CorePackages")
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)
local FFlagAXFixMakeupLookGrantOutfitHoisting = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixMakeupLookGrantOutfitHoisting

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(p1, IsEditable, p2)
	-- upvalues: FFlagAXFixMakeupLookGrantOutfitHoisting (copy)
	return {
		outfitId = tostring(p1),
		isEditable = IsEditable,
		outfitType = if FFlagAXFixMakeupLookGrantOutfitHoisting then p2 else nil
	}
end)