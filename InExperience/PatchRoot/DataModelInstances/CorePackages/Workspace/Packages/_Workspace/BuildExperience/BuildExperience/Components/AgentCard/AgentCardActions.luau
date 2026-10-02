local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View

return function(p1)
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder or 3
	}, p1.children)
end