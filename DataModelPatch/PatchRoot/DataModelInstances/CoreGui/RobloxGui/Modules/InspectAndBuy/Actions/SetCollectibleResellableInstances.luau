local _ = require(script.Parent.Parent.Models.CollectibleInstance)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(CollectibleItemId, CollectibleItemInstances)
	return {
		collectibleItemId = CollectibleItemId,
		collectibleItemInstances = CollectibleItemInstances
	}
end)