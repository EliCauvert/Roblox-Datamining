local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local dataSource = require(viewRecyclerReact.Parent.ViewRecycler).DataSource
local reactModule = require(viewRecyclerReact.Parent.React)

return function(p0, p1)
	-- upvalues: reactModule (ref), dataSource (ref)
	local var2 = reactModule.useState(function()
		-- upvalues: dataSource (copy), p0 (ref), p1 (ref)
		return dataSource.sequence(p0, p1)
	end)
	local var3 = reactModule.useRef(table.clone(p0))
	reactModule.useLayoutEffect(function()
		-- upvalues: dataSource (copy), var2 (ref), var3 (ref), p0 (ref), p1 (ref)
		dataSource.reconcileSnapshot(var2, var3.current, p0, p1)
		var3.current = table.clone(p0)
	end, { var2, p0, p1 })
	
	return var2
end