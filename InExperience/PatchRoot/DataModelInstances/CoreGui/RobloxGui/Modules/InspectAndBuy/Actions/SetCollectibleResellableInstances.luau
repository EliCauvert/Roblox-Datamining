local _ = require(script.Parent.Parent.Models.CollectibleInstance)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0, p1) --[[ line: 8 ]]
	return { collectibleItemId = p0, collectibleItemInstances = p1 }
end)