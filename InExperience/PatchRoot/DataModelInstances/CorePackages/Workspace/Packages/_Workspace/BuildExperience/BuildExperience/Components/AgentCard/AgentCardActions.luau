local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View

return function(p1)
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder or 3
	}, p1.children)
end