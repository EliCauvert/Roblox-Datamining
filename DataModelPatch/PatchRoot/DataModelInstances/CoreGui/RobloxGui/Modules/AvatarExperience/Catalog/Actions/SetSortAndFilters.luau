local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.AvatarExperience.Common.Enum.SortType)
local _ = require(Modules.AvatarExperience.Common.Enum.SortAggregation)
local _ = require(Modules.AvatarExperience.Common.Enum.SalesTypeFilter)
local _ = require(Modules.AvatarExperience.Common.Enum.UnavailableItemFilter)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(p1)
	return p1 or {}
end)