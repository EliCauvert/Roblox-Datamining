local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.AvatarExperience.Common.Enum.UnavailableItemFilter)
local _ = require(Modules.AvatarExperience.Common.Enum.SalesTypeFilter)
local _ = require(Modules.AvatarExperience.Common.Enum.SortType)
local _ = require(Modules.AvatarExperience.Common.Enum.SortAggregation)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(p1)
	return {
		creatorFilter = p1.creatorFilter,
		priceRange = p1.priceRange,
		salesTypeFilter = p1.salesTypeFilter,
		unavailableItemFilter = p1.unavailableItemFilter,
		sortType = p1.sortType,
		sortAggregation = p1.sortAggregation,
		category = p1.category,
		subcategory = p1.subcategory,
		topics = p1.topics,
		wearTimeFilter = p1.wearTimeFilter,
		taxonomy = p1.taxonomy
	}
end)