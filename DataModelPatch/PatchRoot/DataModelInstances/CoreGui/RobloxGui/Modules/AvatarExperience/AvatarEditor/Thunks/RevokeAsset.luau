local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RevokeAssetModule = require(Modules.AvatarExperience.AvatarEditor.Actions.RevokeAsset)
local ToggleEquipAssetModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local _ = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceNavigation)

return function(p1, p2, p3)
	-- upvalues: UtilsModule (copy), ToggleEquipAssetModule (copy), RevokeAssetModule (copy)
	return function(p4)
		-- upvalues: p1 (ref), p2 (ref), UtilsModule (upval), ToggleEquipAssetModule (upval), p3 (copy), RevokeAssetModule (upval)
		p1 = tostring(p1)
		p2 = tostring(p2)
		
		if UtilsModule.isAssetEquipped(p2, p1, p4:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets) then
			p4:dispatch(ToggleEquipAssetModule(p1, p2, p3))
		end
		p4:dispatch(RevokeAssetModule(p1, p2))
	end
end