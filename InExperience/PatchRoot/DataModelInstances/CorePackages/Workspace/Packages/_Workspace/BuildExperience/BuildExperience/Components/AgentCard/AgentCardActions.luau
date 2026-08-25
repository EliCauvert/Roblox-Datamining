local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View

return function(p0)
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		LayoutOrder = 3,
		tag = "row gap-small size-full-0 auto-y"
	}, p0.children)
end