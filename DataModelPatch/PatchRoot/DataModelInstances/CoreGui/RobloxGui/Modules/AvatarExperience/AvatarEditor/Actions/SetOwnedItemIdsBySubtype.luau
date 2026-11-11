local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ItemSubType, ItemIds)
	return { itemSubType = ItemSubType, itemIds = ItemIds }
end)