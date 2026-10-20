local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local InventorySorts = AvatarExperienceSlotBasedEditorModule.Enums.InventorySorts
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local InventoryFilters = AvatarExperienceSlotBasedEditorModule.Enums.InventoryFilters
local FilterSectionModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterSection)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local RadioButtonGroupModule = require(Modules.AvatarExperience.Catalog.Components.Filters.RadioButtonGroup)
local FormPeekviewModule = require(Modules.AvatarExperience.Common.Components.FormPeekview)
local FFlagAXInventoryDurablesExpiredFilter = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXInventoryDurablesExpiredFilter

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), FFlagAXInventoryDurablesExpiredFilter (copy), InventorySorts (copy), InventoryFilters (copy), ReactModule (copy), FormPeekviewModule (copy), FilterSectionModule (copy), RadioButtonGroupModule (copy), ConstantsModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		newest = "Feature.Avatar.Label.Newest",
		recentlyWorn = "Feature.Avatar.Label.RecentlyWorn",
		sortBy = if FFlagAXInventoryDurablesExpiredFilter then "Feature.Avatar.Heading.SortBy" else nil,
		filter = if FFlagAXInventoryDurablesExpiredFilter then "Feature.Avatar.Heading.Filter" else nil,
		activeItems = if FFlagAXInventoryDurablesExpiredFilter then "Feature.Avatar.Heading.Active" else nil,
		expiredItems = if FFlagAXInventoryDurablesExpiredFilter then "Feature.Avatar.Heading.Expired" else nil
	})
	local List = if FFlagAXInventoryDurablesExpiredFilter then {
		{
			text = UseLocalizationResult.activeItems,
			id = InventoryFilters.Active
		},
		{
			text = UseLocalizationResult.expiredItems,
			id = InventoryFilters.Expired
		}
	} else nil
	
	return ReactModule.createElement(FormPeekviewModule, {
		useAutomaticSize = true,
		canApply = p1.canApply,
		canReset = p1.canReset,
		onApply = p1.onApply,
		onReset = p1.onReset,
		closePeekViewSignal = p1.closePeekViewSignal,
		totalSize = UDim2.fromScale(1, 0)
	}, {
		SortsSection = ReactModule.createElement(FilterSectionModule, {
			title = if FFlagAXInventoryDurablesExpiredFilter then UseLocalizationResult.sortBy else "Sort by",
			Size = UDim2.fromScale(1, 0),
			contentSize = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			RadioButtons = ReactModule.createElement(RadioButtonGroupModule, {
				items = {
					{
						text = UseLocalizationResult.newest,
						id = InventorySorts.Newest
					},
					{
						text = UseLocalizationResult.recentlyWorn,
						id = InventorySorts.RecentlyWorn
					}
				},
				itemHeight = ConstantsModule.SortAndFiltersRowHeight,
				selectedValue = p1.currentSort,
				onActivated = p1.setCurrentSort
			})
		}),
		FiltersSection = if FFlagAXInventoryDurablesExpiredFilter then ReactModule.createElement(FilterSectionModule, {
			title = UseLocalizationResult.filter,
			Size = UDim2.fromScale(1, 0),
			contentSize = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			RadioButtons = ReactModule.createElement(RadioButtonGroupModule, {
				items = List,
				itemHeight = ConstantsModule.SortAndFiltersRowHeight,
				selectedValue = p1.currentFilter,
				onActivated = p1.setCurrentFilter
			})
		}) else nil
	})
end