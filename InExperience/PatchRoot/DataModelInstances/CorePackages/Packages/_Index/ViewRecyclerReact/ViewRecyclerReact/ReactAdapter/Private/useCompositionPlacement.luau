local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local compositionPlacementManagerModule = require(viewRecyclerReact.ReactAdapter.Private.CompositionPlacementManager)
local _ = require(viewRecyclerReact.Parent.ViewRecycler)
local reactModule = require(viewRecyclerReact.Parent.React)
local _ = require(script.Parent.RecyclingRuntime)

return function(p0, p1, p2) --[[ line: 12 | named "useCompositionPlacement" ]]
	-- upvalues: reactModule (ref), compositionPlacementManagerModule (ref)
	local var3, var4 = reactModule.useState(0)
	local var5 = reactModule.useState(function() --[[ line: 18 ]]
		-- upvalues: p0 (ref), p1 (ref), p2 (ref), compositionPlacementManagerModule (copy), var4 (ref)
		return compositionPlacementManagerModule.new(p0.getRecyclingScope({ maxPoolSize = p1, diagnostics = p2 }), function() --[[ line: 23 ]]
			-- upvalues: var4 (copy)
			var4(function(p3) --[[ line: 24 ]]
				return p3 + 1
			end)
		end)
	end)
	local recyclingScope = p0.getRecyclingScope({ maxPoolSize = p1, diagnostics = p2 })
	reactModule.useEffect(function() --[[ line: 34 ]]
		-- upvalues: recyclingScope (ref), p1 (ref)
		recyclingScope.setMaxPoolSize(p1)
	end, { p1, recyclingScope })
	reactModule.useLayoutEffect(function() --[[ line: 38 ]]
		-- upvalues: var5 (ref)
		var5.flush()
	end, { var5, var3 })
	reactModule.useLayoutEffect(function() --[[ line: 42 ]]
		-- upvalues: var5 (ref)
		return function() --[[ line: 43 ]]
			-- upvalues: var5 (copy)
			var5.destroy()
		end
	end, { var5 })
	
	return { manager = var5 }
end