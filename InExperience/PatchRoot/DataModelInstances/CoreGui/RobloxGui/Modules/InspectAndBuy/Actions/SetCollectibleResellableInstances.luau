local _ = require(script.Parent.Parent.Models.CollectibleInstance)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(CollectibleItemId, CollectibleItemInstances) --[[ Line: 8 ]]
	return {
		collectibleItemId = CollectibleItemId,
		collectibleItemInstances = CollectibleItemInstances
	}
end)