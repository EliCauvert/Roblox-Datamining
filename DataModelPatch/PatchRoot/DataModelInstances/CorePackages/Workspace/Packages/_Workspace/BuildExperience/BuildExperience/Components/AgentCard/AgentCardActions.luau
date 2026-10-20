local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View

return function(p1)
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		LayoutOrder = 3,
		tag = "row gap-small size-full-0 auto-y"
	}, p1.children)
end