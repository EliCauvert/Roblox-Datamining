local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.OutfitSwitcher.OutfitSwitcherFrame.useOutfitSwitcherFrameProps)
local FFlagAXOutfitPageRevamp = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXOutfitPageRevamp

return function()
	-- upvalues: ReactModule (copy), ConstantsModule (copy), ConstantsModule1 (copy), FFlagAXOutfitPageRevamp (copy)
	return ReactModule.useMemo(function()
		-- upvalues: ConstantsModule (upval), ConstantsModule1 (upval), FFlagAXOutfitPageRevamp (upval)
		return {
			outfitKey = ConstantsModule.MakeupOutfitKey,
			outfitType = ConstantsModule1.OutfitTypes.Makeup,
			showSettingsTile = FFlagAXOutfitPageRevamp
		}
	end, {})
end