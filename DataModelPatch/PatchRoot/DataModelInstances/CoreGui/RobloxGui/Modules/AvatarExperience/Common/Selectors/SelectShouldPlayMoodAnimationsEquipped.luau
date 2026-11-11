local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(Modules.AvatarExperience.Common.Types)
local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(p1): boolean
	-- upvalues: ConstantsModule (copy), CryoModule (copy)
	local v1 = p1 and p1[ConstantsModule.AssetTypeIdStrings.DynamicHead]
	
	if v1 and not CryoModule.isEmpty(v1) then
		local v2 = p1 and p1[ConstantsModule.AssetTypeIdStrings.MoodAnimation]
		local NextEntry = v2 and next(v2)
		
		return if NextEntry then true else false
	else
		return false
	end
end)

return function(p1)
	-- upvalues: MemoizeResult (copy)
	return MemoizeResult(p1.AvatarExperience.AvatarEditor.Character.EquippedAssets)
end