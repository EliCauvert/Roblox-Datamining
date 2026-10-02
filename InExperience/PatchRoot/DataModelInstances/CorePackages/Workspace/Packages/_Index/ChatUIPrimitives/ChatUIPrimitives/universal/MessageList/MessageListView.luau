local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local viewRecyclerModule = require(parent.ViewRecycler)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), viewRecyclerModule (ref)
	return reactModule.createElement(viewRecyclerModule.VirtualList, p1.listProps)
end)