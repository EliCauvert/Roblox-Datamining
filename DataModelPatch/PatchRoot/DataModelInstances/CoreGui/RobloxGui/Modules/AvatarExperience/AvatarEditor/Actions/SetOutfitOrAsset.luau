local CorePackages = game:GetService("CorePackages")
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(Ids, ItemType)
	return { ids = Ids, itemType = ItemType }
end)