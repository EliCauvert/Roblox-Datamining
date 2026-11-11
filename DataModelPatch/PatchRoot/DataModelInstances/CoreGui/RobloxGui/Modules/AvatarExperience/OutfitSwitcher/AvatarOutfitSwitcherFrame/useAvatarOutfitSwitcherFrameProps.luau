local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.OutfitSwitcher.OutfitSwitcherFrame.useOutfitSwitcherFrameProps)

return function()
	-- upvalues: ReactModule (copy), ConstantsModule (copy), ConstantsModule1 (copy)
	return ReactModule.useMemo(function()
		-- upvalues: ConstantsModule (upval), ConstantsModule1 (upval)
		return {
			showSettingsTile = true,
			outfitKey = ConstantsModule.EditableCharacterKey,
			outfitType = ConstantsModule1.OutfitTypes.Avatar
		}
	end, {})
end