local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1)
	return {
		wasItemEquipped = p1.wasItemEquipped,
		fetchItemFailed = p1.fetchItemFailed,
		itemId = p1.itemId,
		itemType = p1.itemType
	}
end)