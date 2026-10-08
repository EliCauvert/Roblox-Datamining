local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local compositionPlacementModule = require(viewRecyclerReact.ReactAdapter.Private.CompositionPlacement)
local _ = require(viewRecyclerReact.Parent.ViewRecycler)
local reactModule = require(viewRecyclerReact.Parent.React)
local _ = require(script.Parent.RecyclingRoot)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), compositionPlacementModule (ref)
	local var1 = reactModule.useState(function()
		-- upvalues: p1 (ref), p2 (ref), p3 (ref), compositionPlacementModule (copy)
		return compositionPlacementModule.new(p1.getScope({ maxPoolSize = p2, diagnostics = p3 }))
	end)
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			var1.destroy()
		end
	end, { var1 })
	
	return var1
end