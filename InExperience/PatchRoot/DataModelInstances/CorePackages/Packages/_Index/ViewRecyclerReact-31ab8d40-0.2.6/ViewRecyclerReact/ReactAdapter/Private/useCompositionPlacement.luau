local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local CompositionPlacementModule = require(ViewRecyclerReact.ReactAdapter.Private.CompositionPlacement)
local _ = require(ViewRecyclerReact.Parent.ViewRecycler)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local _ = require(script.Parent.RecyclingRoot)

return function(p1, MaxPoolSize, Diagnostics) --[[ Line: 8 | Named "useCompositionPlacement" ]]
	-- upvalues: ReactModule (copy), CompositionPlacementModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1 = ReactModule.useState(function() --[[ Line: 14 ]]
		-- upvalues: p1 (copy), MaxPoolSize (copy), Diagnostics (copy), CompositionPlacementModule (upval), UseStateResult2 (copy)
		return CompositionPlacementModule.new(p1.getScope({ maxPoolSize = MaxPoolSize, diagnostics = Diagnostics }), function() --[[ Line: 19 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(function(p2: number): number --[[ Line: 20 ]]
				return p2 + 1
			end)
		end)
	end)
	local Scope = p1.getScope({ maxPoolSize = MaxPoolSize, diagnostics = Diagnostics })
	ReactModule.useEffect(function() --[[ Line: 30 ]]
		-- upvalues: Scope (copy), MaxPoolSize (copy)
		Scope.setMaxPoolSize(MaxPoolSize)
	end, { MaxPoolSize, Scope })
	ReactModule.useLayoutEffect(function() --[[ Line: 34 ]]
		-- upvalues: UseStateResult1 (copy)
		UseStateResult1.flush()
	end, { UseStateResult1, UseStateResult })
	ReactModule.useLayoutEffect(function() --[[ Line: 38 ]]
		-- upvalues: UseStateResult1 (copy)
		return function() --[[ Line: 39 ]]
			-- upvalues: UseStateResult1 (upval)
			UseStateResult1.destroy()
		end
	end, { UseStateResult1 })
	
	return UseStateResult1
end