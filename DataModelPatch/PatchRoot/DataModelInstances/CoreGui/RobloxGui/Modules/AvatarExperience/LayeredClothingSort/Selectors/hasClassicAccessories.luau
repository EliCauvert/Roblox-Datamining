local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)
local config = {
	[ConstantsModule.AssetTypeIdStrings.TShirt] = true,
	[ConstantsModule.AssetTypeIdStrings.Pants] = true,
	[ConstantsModule.AssetTypeIdStrings.Shirt] = true
}
local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(List): boolean
	-- upvalues: CryoModule (copy), config (copy)
	for i, value in List do
		if not CryoModule.isEmpty(value) and config[i] then
			return true
		end
	end
	return false
end)

return function(p1)
	-- upvalues: MemoizeResult (copy)
	local EquippedAssets = p1.AvatarExperience.AvatarEditor.Character.EquippedAssets
	
	return if EquippedAssets then MemoizeResult(EquippedAssets) else false
end