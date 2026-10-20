local UseLocalizationFunction = require(script:FindFirstAncestor("ShareSheet").Parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.PeoplePickerHeaderView)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy)
	return {
		goBack = p1.goBack,
		onQueryChanged = p1.setQuery,
		query = p1.query,
		searchPlaceholder = UseLocalizationFunction({ searchPlaceholder = "CommonUI.Controls.Action.Search" }).searchPlaceholder
	}
end