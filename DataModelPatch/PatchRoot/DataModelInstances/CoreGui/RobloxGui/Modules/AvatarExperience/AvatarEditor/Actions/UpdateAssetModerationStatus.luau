local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(p1, ModerationStatus, AssetName, UniverseId)
	return {
		assetId = tostring(p1),
		moderationStatus = ModerationStatus,
		assetName = AssetName,
		universeId = UniverseId
	}
end)