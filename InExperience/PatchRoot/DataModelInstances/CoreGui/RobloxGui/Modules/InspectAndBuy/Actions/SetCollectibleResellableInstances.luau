local _ = require(script.Parent.Parent.Models.CollectibleInstance)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { collectibleItemId = p1, collectibleItemInstances = p2 }
end)