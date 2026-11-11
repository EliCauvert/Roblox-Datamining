local Parent = script:FindFirstAncestor("FriendsActivityFeed").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View

return function(p1)
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, { tag = "size-full", LayoutOrder = p1.layoutOrder })
end