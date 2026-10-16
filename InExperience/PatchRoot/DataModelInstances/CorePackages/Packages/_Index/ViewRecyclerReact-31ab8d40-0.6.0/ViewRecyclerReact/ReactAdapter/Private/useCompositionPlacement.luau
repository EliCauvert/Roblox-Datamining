local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local CompositionPlacementModule = require(ViewRecyclerReact.ReactAdapter.Private.CompositionPlacement)
local _ = require(ViewRecyclerReact.Parent.ViewRecycler)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local _ = require(script.Parent.RecyclingRoot)

return function(p1, MaxPoolSize, Diagnostics) --[[ Line: 8 | Named "useCompositionPlacement" ]]
	-- upvalues: ReactModule (copy), CompositionPlacementModule (copy)
	local UseStateResult = ReactModule.useState(function() --[[ Line: 13 ]]
		-- upvalues: p1 (copy), MaxPoolSize (copy), Diagnostics (copy), CompositionPlacementModule (upval)
		return CompositionPlacementModule.new((p1.getScope({ maxPoolSize = MaxPoolSize, diagnostics = Diagnostics })))
	end)
	ReactModule.useLayoutEffect(function() --[[ Line: 21 ]]
		-- upvalues: UseStateResult (copy)
		return function() --[[ Line: 22 ]]
			-- upvalues: UseStateResult (upval)
			UseStateResult.destroy()
		end
	end, { UseStateResult })
	
	return UseStateResult
end