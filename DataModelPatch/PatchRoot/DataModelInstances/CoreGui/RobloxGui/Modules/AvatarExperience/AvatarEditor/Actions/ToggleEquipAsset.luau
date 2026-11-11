local CorePackages = game:GetService("CorePackages")
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(AssetTypeId, AssetId, OverrideOrder, OverrideAdjustments)
	return {
		assetTypeId = AssetTypeId,
		assetId = AssetId,
		overrideOrder = OverrideOrder,
		overrideAdjustments = OverrideAdjustments
	}
end)