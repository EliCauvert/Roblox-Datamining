local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local dataSource = require(viewRecyclerReact.Parent.ViewRecycler).DataSource
local reactModule = require(viewRecyclerReact.Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref), dataSource (ref)
	local var1 = reactModule.useState(function()
		-- upvalues: dataSource (copy), p1 (ref), p2 (ref)
		return dataSource.sequence(p1, p2)
	end)
	local var2 = reactModule.useRef(table.clone(p1))
	reactModule.useLayoutEffect(function()
		-- upvalues: dataSource (copy), var1 (ref), var2 (ref), p1 (ref), p2 (ref)
		dataSource.reconcileSnapshot(var1, var2.current, p1, p2)
		var2.current = table.clone(p1)
	end, { var1, p1, p2 })
	
	return var1
end