local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Models.CollectibleInstance)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(CollectibleItemId, CollectibleInstanceId, CollectibleInstanceData)
	return {
		collectibleItemId = CollectibleItemId,
		collectibleInstanceId = CollectibleInstanceId,
		collectibleInstanceData = CollectibleInstanceData
	}
end)