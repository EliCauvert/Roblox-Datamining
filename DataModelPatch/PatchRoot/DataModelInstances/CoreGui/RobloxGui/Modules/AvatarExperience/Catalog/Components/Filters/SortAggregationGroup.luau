local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseIsGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useIsGamepad
local RadioButtonGroupModule = require(Modules.AvatarExperience.Catalog.Components.Filters.RadioButtonGroup)
local SortAggregationModule = require(Modules.AvatarExperience.Common.Enum.SortAggregation)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), SortAggregationModule (copy), UseIsGamepadFunction (copy), ReactModule (copy), ConstantsModule (copy), RadioButtonGroupModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		allTime = "Feature.Catalog.LabelAllTime",
		pastWeek = "Feature.Catalog.LabelPastWeek",
		pastDay = "Feature.Catalog.LabelPastDay"
	})
	local Items = {
		{
			text = UseLocalizationResult.allTime,
			id = SortAggregationModule.AllTime
		},
		{
			text = UseLocalizationResult.pastWeek,
			id = SortAggregationModule.PastWeek
		},
		{
			text = UseLocalizationResult.pastDay,
			id = SortAggregationModule.PastDay
		}
	}
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, ConstantsModule.SortAndFiltersSmallRowHeight * #Items)
	}, {
		SortRadioButtons = ReactModule.createElement(RadioButtonGroupModule, {
			hideDividers = true,
			items = Items,
			itemHeight = ConstantsModule.SortAndFiltersSmallRowHeight,
			selectedValue = p1.sortAggregation,
			onActivated = p1.setSortAggregation,
			useDefaultControlState = UseIsGamepadFunction()
		})
	})
end