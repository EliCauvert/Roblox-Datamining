local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local SearchBar = require(Parent.AvatarExperienceSearch).Components.SearchBar

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), SearchBar (copy)
	return ReactModule.createElement(View, { tag = "col align-y-center size-full padding-x-small" }, {
		SearchBar = ReactModule.createElement(SearchBar, {
			showCancelButton = true,
			useTopBarInputBackground = true,
			text = p1.query,
			onFocus = p1.onFocus,
			onClear = p1.onClear,
			onCancel = p1.onCancel,
			ref = p1.searchBarRef
		})
	})
end