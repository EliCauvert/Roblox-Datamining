local useLocalization = require(script:FindFirstAncestor("ShareSheet").Parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.PeoplePickerHeaderView)

return function(p1)
	-- upvalues: useLocalization (ref)
	return {
		goBack = p1.goBack,
		onQueryChanged = p1.setQuery,
		query = p1.query,
		searchPlaceholder = useLocalization({ searchPlaceholder = "CommonUI.Controls.Action.Search" }).searchPlaceholder
	}
end