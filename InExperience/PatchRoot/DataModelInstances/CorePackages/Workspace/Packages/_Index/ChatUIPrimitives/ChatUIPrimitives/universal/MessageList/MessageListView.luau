local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local ViewRecyclerModule = require(Parent.ViewRecycler)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), ViewRecyclerModule (copy)
	return ReactModule.createElement(ViewRecyclerModule.VirtualList, p1.listProps)
end)